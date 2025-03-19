import MinePage from '../pages/MinePage'
import Nav from '../views/Nav'
import NewsPage from '../pages/NewsPage'
import PopularPage from '../pages/PopularPage'

@Entry
@Component
struct MainPage {
  @State PageIndex: number = 0

  build() {
    Column() {
      // 用if-else判断？
      if (this.PageIndex == 0) {
        NewsPage()
          .height('90%')
          .border({ width: 3, color: 'red' })
      } else if (this.PageIndex == 1) {
        PopularPage()
          .height('90%')
          .border({ width: 3, color: 'red' })
      }
      else{
        MinePage()
          .height('90%')
          .border({ width: 3, color: 'red' })
      }
      Nav({ actIdx: this.PageIndex })
        .border({ width: 3, color: 'blue' })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F0F0F0')
    .border({ width: 4, color: 'green' })
    .justifyContent(FlexAlign.SpaceAround)
  }
}