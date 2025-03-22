import { StockInfoSelect, stockInfoSelectT} from '../../models/KLine'

@Component
export default struct StockInfoSelectTitle {
  @Link selected_Info: number

  build() {
    Column() {
      Row() {
        ForEach(stockInfoSelectT, (item: StockInfoSelect, index: number) => {
          Row() {
            Text(item.name)
              .fontSize(15)
              .fontColor(this.selected_Info == index ? 'red' : 'black')
              .onClick(() => {
                this.selected_Info = index
              })
          }
          .justifyContent(FlexAlign.SpaceAround)
          .width(`${100/stockInfoSelectT.length}%`)
        })
      }

    }
  }
}