import { StockInfoType } from '../../models/Stock'
import { $get_stock } from '../../utils/request'

@Component
export default struct Info {
  @State stockInfo: Array<StockInfoType> = [] //定数据
  page = 1
  //生命周期，挂载该组件时自动调用
  async aboutToAppear() {
    let url = `/news/st/?&page=${this.page}&pageSize=${20}`
    // let url = `/stock/Info/?&page=${this.page}&pageSize=${20}`
    let list = await $get_stock<StockInfoType>(url)
    console.log(JSON.stringify(list))
    this.stockInfo = list //3.改数据 （将网络请求到的数据设置给预先定义的响应式数据）
  }

  loadMore = async () => {
    console.log('触底了', this.page)
    // let cate = category[this.idx].cate //提取当前菜单对应的分类标志
    // let url = `/stock/Info/?&page=${this.page}&pageSize=${20}`
    let url = `/news/st/?&page=${this.page}&pageSize=${20}`
    let list = await $get_stock<StockInfoType>(url)
    this.page++
    this.stockInfo = [
      ...this.stockInfo, //原数据，拓展运算符
      ...list//新数据
    ]
  }

  build() {
    Scroll() {
      Column() {
        Flex({
          wrap: FlexWrap.Wrap,
          justifyContent: FlexAlign.SpaceBetween
        }) {
          //2. 用数据
          ForEach(this.stockInfo, (item: StockInfoType) => {
            Column() {
              // 标题
              Text(item.title+'')
                .fontSize(15)
                .fontColor('#333')
                .alignSelf(ItemAlign.Start)
              Row(){
                // 来源
                Row() {
                  Text(item.source + '')
                    .fontSize(14)
                    .fontColor('#666')
                }
                .justifyContent(FlexAlign.Start)
                .width('50%')
                Row(){
                  Text(item.created_date+'')
                    .fontSize(14)
                    .fontColor('#666')
                }
                .justifyContent(FlexAlign.End)
                .width('50%')
              }
              //分割线
              Divider().height(2).color(0xCCCCCC)
            }
            .width('100%')
            .margin({ bottom: 20 });
          })
        }
        .padding(10)
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