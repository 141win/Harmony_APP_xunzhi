import Financial from '../views/Financial'
import MainContent from '../views/MainContent'
import SearchBar from '../views/SearchBar'
import TopNav from '../views/TopNav'
import SciencePage from '../pages/SciencePage'
import TeachPage from '../pages/TeachPage'

@Entry
@Component
export default struct NewsPage {
  @State NewsCategory: number = 0

  build() {
    Column() {
      SearchBar()
        .height('8%')
        .border({ width: 3, color: 'red' })
      TopNav({ actIdx: this.NewsCategory })
        .height('8%')
        .border({ width: 3, color: 'red' })
      if (this.NewsCategory == 0) {
        MainContent()// { path: '/news/ed'}
          .height('80%')
          .border({ width: 3, color: 'red' })
      } else if (this.NewsCategory == 1) {
        Financial()
          .height('80%')
          .border({ width: 3, color: 'red' })
      } else if (this.NewsCategory == 2) {
        SciencePage()
          .height('80%')
          .border({ width: 3, color: 'red' })
      } else if (this.NewsCategory == 3){
        TeachPage()
          .height('80%')
          .border({ width: 3, color: 'black' })
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F0F0F0')
    .border({ width: 4, color: 'green' })
    .justifyContent(FlexAlign.SpaceAround)
  }
}