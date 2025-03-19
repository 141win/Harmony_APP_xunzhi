import { StockType, StockResData } from '../models/Stock'
import { $get_stock } from '../utils/request'

@Component
export default struct AxiosPage {
  @State res: Array<StockType> = [] //定数据
  fetchData = async () => {
    //发起网络请求
    // request.get('/stock')
    //   .then((res: AxiosResponse<responseData<stockType>>) => {
    //     console.log(JSON.stringify(res))
    //   })
    this.res = await $get_stock<StockType>('/stock')
    console.log(JSON.stringify(this.res))
  }

  //生命周期，挂载该组件时自动调用
  async aboutToAppear() {
    let url = `/stock?&page=${this.page}&pageSize=${20}`
    let list = await $get_stock<StockType>(url)
    this.res = list //3.改数据 （将网络请求到的数据设置给预先定义的响应式数据）
  }

  page = 1
  //加载更多，触底调用
  loadMore = async () => {
    console.log('触底了', this.page)
    // let cate = category[this.idx].cate //提取当前菜单对应的分类标志
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
        Row() {
          Text("代码")
          Text("名称")
          Text("上市日期")
          Text("现价")
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceAround)

        // Scroll() {
        ForEach(this.res, (item: StockType, index: number) => {
          Row() {
            Text(item.id + '')
            Text(item.name)
            Text(item.listing_date)
            Text(item.price + '')
          }
          .border({ width: 3, color: 'green' })
          .width('100%')
          .height('10%')
          .justifyContent(FlexAlign.SpaceAround)

          Text('_____________')// .border({width:3,color:'red'})
            .width('100%')
            .height('5%')
        })
      }
    }
    .scrollBarWidth(2)
    .onScrollEdge((side: Edge) => {
      // console.log('触达边缘',side)
      if (side == 2) {
        this.loadMore()
      }
    })
  }
}
