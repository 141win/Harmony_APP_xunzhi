import { CarType } from '../../models/Car'

@Component
export default struct Topthree {
  @Prop data:CarType


  build() {
    Column(){
      Image(''+this.data.img)
        .width('100%')
      Text(this.data.title)
        .fontSize(30)
      Text(this.data.source)
        .alignSelf(ItemAlign.Start)
        .margin(10)
        .padding({bottom:50})
    }
    .width('100%')
  }
}