import { CategoryData } from '../../models/Stock'

@Component
export default  struct StockData {
  // @State detail: number = 0
  @Prop stockCategoryData: CategoryData
  @Prop fontWidth:number
  build() {
    Row() {
      //类别名称
      Text(this.stockCategoryData.category as string)
        .fontSize(13)
        .width(`${this.fontWidth}%`)
      //数据
      Text(this.stockCategoryData.Data+'')
        .fontColor(this.stockCategoryData.Data>0?'red':'green')
        .fontSize(13)
    }
  }
}