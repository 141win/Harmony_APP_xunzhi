import { StockInfoType } from '../../models/Stock'
import { $get_stock } from '../../utils/request'

@Component
export default struct Review {
  @State review: Array<StockInfoType> = [] //定数据
  @State reviewLike:Array<boolean> = []
  page = 1

  //生命周期，挂载该组件时自动调用
  async aboutToAppear() {
    // let url = `/stock/reviews/?&page=${this.page}&pageSize=${20}`
    let url = `/reviews/show/?&page=${this.page}&pageSize=${20}`
    let list = await $get_stock<StockInfoType>(url)
    console.log(JSON.stringify(list))
    this.review = list //3.改数据 （将网络请求到的数据设置给预先定义的响应式数据）
  }

  loadMore = async () => {
    console.log('触底了', this.page)
    // let url = `/stock/reviews/?&page=${this.page}&pageSize=${20}`
    let url = `/reviews/show/?&page=${this.page}&pageSize=${20}`
    let list = await $get_stock<StockInfoType>(url)
    this.page++
    this.review = [
      ...this.review, //原数据，拓展运算符
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
          ForEach(this.review, (item: StockInfoType, index: number) => {
            Column() {
              // 标题
              Text(item.source + '')
                .fontSize(14)
                .fontColor('#333')
                .alignSelf(ItemAlign.Start)
                // .border({ width: 3, color: 'red' })
              Row() {
                // 来源
                Row() {
                  Text(item.title + '')
                    .fontSize(15)
                    .fontColor('#666')
                }
                // .border({ width: 3, color: 'red' })
                .justifyContent(FlexAlign.Start)
                .width('50%')

                Row() {
                  Image(this.reviewLike[index] ? $rawfile("like_active.svg") : $rawfile("like.svg"))
                    .width(10)
                    .onClick(() => {
                      // console.log("点赞触发")
                      if(this.reviewLike[index]){
                        this.reviewLike[index]=false
                      }
                      else{
                        this.reviewLike[index]=true
                      }
                    })
                  Text(item.created_date + '')
                    .fontSize(14)
                    .fontColor('#666')
                }
                // .border({ width: 3, color: 'red' })
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