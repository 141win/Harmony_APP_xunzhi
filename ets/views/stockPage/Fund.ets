import StockData from './StockData'
import { CategoryData } from '../../models/Stock'

@Component
export default struct StockInfoSelectTitle {
  @Prop plate:Array<CategoryData>
  build() {
    Flex({
      wrap: FlexWrap.Wrap,
      justifyContent: FlexAlign.SpaceBetween
    }) {
      ForEach(this.plate, (item: CategoryData, index: number) => {
        // Row(){
        StockData({ stockCategoryData: item,fontWidth:70 })
          .width('48%')
          .margin('1%')
          .backgroundColor('#F4F6FA')
        // }
        // .border({width:3,color:'red'})
      })
    }
  }
}