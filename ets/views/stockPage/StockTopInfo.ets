@Component
export default struct TopNav {
  build() {
    Row() {
      Row() {
        Image($rawfile("pie_graph.svg"))
          .width(16)
      }
      .width('7%')
      Row(){
        Text('将于2025-03-27披露《2024年年报》')
          .fontSize(13)
      }
      .width('80%')
      Row() {
        Image($rawfile("calender.svg"))
          .width(16)
      }
      .width('13%')
    }
    .justifyContent(FlexAlign.SpaceAround)
  }
}