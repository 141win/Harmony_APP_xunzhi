import { ScienceType } from '../models/ScienceData'
import { $get_sci } from '../utils/request'

@Entry
@Component
export default struct RequestPage {
  @State productList:Array<ScienceType> = [] //1. 定数据

  async aboutToAppear() {
    let list = await $get_sci<ScienceType>('/news/ed')
    console.log('页面即将显示',JSON.stringify(list))
    this.productList = list
  }

  //事件函数封装
  handleGetProduct = async ()=>{
    let results = await $get_sci<ScienceType>('/news/ed')
    console.log('新闻数据',JSON.stringify(results))
    this.productList = results  //3. 改数据。将商品数据赋值给状态数据
  }
  build() {
    Column() {
      List({ space: 10 }) {
        ForEach(this.productList , (item:ScienceType) => {
          ListItem() {
            Row() {
              Image(item.img)
                .width(120)
                .height(90)
                .objectFit(ImageFit.Cover)
                .margin(8)
                .autoResize(true)
                .syncLoad(true);

              Column() {
                Text(item.title)
                  .fontSize(18)
                  .fontColor(Color.Black)
                  .maxLines(2)
                  .textOverflow({ overflow: TextOverflow.Ellipsis });

                Text(item.source)
                  .fontSize(14)
                  .fontColor(Color.Gray)
                  .margin({ top: 8 });
              }
            }
            .padding(8)
          }
          .borderRadius(12)
          .backgroundColor(Color.White)
          .shadow(ShadowStyle.OUTER_DEFAULT_XS)
        }, (item:ScienceType) => JSON.stringify(item))
      }
      .height('100%')
      .width('100%')
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}