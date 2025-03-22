import { CategoryData } from '../../models/Stock'
import StockData from './StockData'
import StockTopInfo from './StockTopInfo'
@Component
export default struct StockDataRegion {
  @Prop cateData1:Array<CategoryData>
  @Prop cateData2:Array<CategoryData>
  build() {
    Row() {
      Column() {
        Row() {
          // 现价
          Text(this.cateData1[0].Data+'')
            .fontSize(30)
            .fontColor(this.cateData1[1].Data>0?'red':'green')
          Column() {
            Row() {
              Image(this.cateData1[1].Data>0?$rawfile("red_up.svg"):$rawfile("green_down.svg"))
                .width(20)
            }
            Row() {
              //涨数
              Text((this.cateData1[1].Data>0?"+":"")+this.cateData1[1].Data)
                .fontColor(this.cateData1[1].Data>0?'red':'green')
              //涨幅
              Text((this.cateData1[2].Data>0?"+":"")+this.cateData1[2].Data+"%")
                .fontColor(this.cateData1[2].Data>0?'red':'green')
            }
            .width(110)
            .justifyContent(FlexAlign.SpaceAround)
          }
          .alignItems(HorizontalAlign.Start)
        }

        Flex({
          wrap:FlexWrap.Wrap,
          justifyContent:FlexAlign.SpaceBetween
        }) {
          //splice(3),取第四个元素到最后一个元素
          ForEach(this.cateData2,(item:CategoryData)=>{
            StockData({ stockCategoryData: item ,fontWidth:45})
              .width('33%')
          })
        }
        StockTopInfo()
          .margin({top:7,bottom:3})
      }
      .alignItems(HorizontalAlign.Start)


    }
  }
}