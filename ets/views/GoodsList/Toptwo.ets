import { CarType } from "../../models/Car"

@Component
export default struct Toptwo {
  @Prop data:CarType


  build() {
    Row() {
      Column() {
        Image('' + this.data.img)
          .width(50)
          .height(50)
        Text('' + this.data.source)
      }
    }
    .width('auto')
    .margin(10)
  }
}