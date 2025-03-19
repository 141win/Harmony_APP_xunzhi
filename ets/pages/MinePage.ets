import Logo from '../views/logo'
@Entry
@Component
export default struct MinePage {
  @State message: string = '我的页面';

  build() {
    RelativeContainer() {
      Logo()
        .border({width:3,color:'black'})
        .width('100%')
      Text(this.message)
        .id('MinePageHelloWorld')
        .fontSize($r('app.float.page_text_font_size'))
        .fontWeight(FontWeight.Bold)
        .alignRules({
          center: { anchor: '__container__', align: VerticalAlign.Center },
          middle: { anchor: '__container__', align: HorizontalAlign.Center }
        })
        .onClick(() => {
          this.message = 'Welcome';
        })
    }
    .height('100%')
    .width('100%')
  }
}