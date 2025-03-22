import { router } from "@kit.ArkUI"

@Component
export default struct TopNav {
  @Prop stockName: string
  @Prop stockId: number
  build() {
    Row() {
      Row() {
        Image($rawfile('back.svg'))
          .width(20)
          .onClick(() => {
            // console.log('触发点击')
            //router路由退回，退回上一页面
            router.back()
          })
      }
      .justifyContent(FlexAlign.Start)
      .width('20%')

      Row() {
        Column(){
          Text(this.stockName)
          Text(this.stockId+'')
        }
      }
      .justifyContent(FlexAlign.Center)
      .width('60%')

      Row() {
        Image($rawfile('ask.svg'))
          .width(20)
      }
      .justifyContent(FlexAlign.Center)
      .width('10%')

      Row() {
        Image($rawfile('search.svg'))
          .width(20)
      }
      .justifyContent(FlexAlign.End)
      .width('10%')
    }
    .justifyContent(FlexAlign.SpaceAround)
  }
}