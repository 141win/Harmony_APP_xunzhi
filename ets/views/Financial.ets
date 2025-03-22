import { StockType } from '../models/Stock'
import { $get_stock } from '../utils/request'
import { router } from "@kit.ArkUI"
import ImageSwiper from '../views/ImageSwiper'

@Component
export default struct AxiosPage {
  @State res: Array<StockType> = [] //定数据
  @State stockIdx: number = 0

  //生命周期，挂载该组件时自动调用
  async aboutToAppear() {
    let url = `/stock?&page=${this.page}&pageSize=${20}`
    let list = await $get_stock<StockType>(url)
    console.log(JSON.stringify(list))
    this.res = list //3.改数据 （将网络请求到的数据设置给预先定义的响应式数据）
  }

  page = 1
  //加载更多，触底调用
  loadMore = async () => {
    console.log('触底了', this.page)
    let url = `/stock?&page=${this.page}&pageSize=${20}`
    let list = await $get_stock<StockType>(url)
    this.page++
    this.res = [
      ...this.res, //原数据，拓展运算符
      ...list//新数据
    ]
  }

  build() {
    Scroll() {
      Column() {
        //横向滑动展示图片
        ImageSwiper()
          .height(180)

        //股票基本信息列表
        Row() {
          Text("代码")
          Text("名称")
          Text("上市日期")
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceAround)

        ForEach(this.res, (item: StockType, index: number) => {
          Row() {
            Text(item.id + '')
            Text(item.name)
            Text(item.listing_date)
          }

          .width('100%')
          .height('10%')
          .justifyContent(FlexAlign.SpaceAround)
          .onClick(() => {
            console.log('点击股票详情页')
            this.stockIdx = index
            router.pushUrl({
              url: 'pages/StockPage', //目标页面路径（必须是页面，必须在main_pages.json文件中添加该页面文件路径）
              params: {stockId:this.stockIdx,item}  //将股票数据传给股票详情页
            })
          })

          //分割线
          Divider().height(2).color(0xCCCCCC)
        })
      }
    }
    .scrollBarWidth(2)
    .onScrollEdge((side: Edge) => {
      if (side == 2) {
        this.loadMore()
      }
    })
  }
}