@Component
export default struct Topone {


  build() {
    Column(){
      Row() {
        Text('关注')
          .fontSize(30)
        Row()
        {
          Image($rawfile('10.png'))
            .height(30)
            .width(30)
          Button('发布')
            .backgroundColor('#ff6189e7')
        }
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .width('100%')
    }
  }
}