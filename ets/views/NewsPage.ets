import Financial from './Financial'
import MainContent from './MainContent'
import SearchBar from './SearchBar'
import TopNav from './TopNav'
import SciencePage from './SciencePage'
import TeachPage from './TeachPage'
import CarPage from './CarPage'
//
// @Component
// export default struct NewsPage {
//   @State NewsCategory: number = 0
//   @State keyword : string = ''
//
//   build() {
//     Column() {
//       SearchBar({keyword : $keyword})
//         .height('8%')
//       TopNav({ actIdx: this.NewsCategory })
//         .height('8%')
//
//       if (this.keyword !== '') {
//         // 搜索逻辑独立出来，keyword 变化时，搜索结果也会刷新
//         MainContent({ "path": '/news', "keyword": this.keyword })
//           .height('80%')
//       }
//
//       // 展示首页
//       else if (this.NewsCategory == 0) {
//         MainContent({ "path": '/news' })
//           .height('80%')
//       }
//       // 展示军事板块  ma
//       else if (this.NewsCategory == 1) {
//         MainContent({ "path": '/news/ma' })
//           .height('80%')
//       }
//       //科技
//       else if (this.NewsCategory == 2) {
//         SciencePage()
//           .height('80%')
//       }
//       //教育
//       else if (this.NewsCategory == 3) {
//         TeachPage()
//           .height('80%')
//       }
//       // 展示汽车板块 ca
//       else if (this.NewsCategory == 4){
//         CarPage()
//           .height('80%')
//           .border({ width: 3, color: 'black' })
//       }
//
//       //财经
//       else if (this.NewsCategory == 5) {
//         Financial()
//           .height('80%')
//         // .border({ width: 3, color: 'red' })
//       }
//     }
//     .width('100%')
//     .height('100%')
//     .backgroundColor('#F0F0F0')
//     .justifyContent(FlexAlign.SpaceAround)
//   }
// }

// import Financial from '../views/Financial'
// import MainContent from '../views/MainContent'
// import SearchBar from '../views/SearchBar'
// import TopNav from '../views/TopNav'
// import SciencePage from '../pages/SciencePage'
// import TeachPage from '../pages/TeachPage'
// import CarPage from '../pages/CarPage'


@Component
export default struct NewsPage {
  @State NewsCategory: number = 0
  @State keyword : string = ''


  build() {
    Column() {
      SearchBar({keyword : $keyword})
        .height('8%')

      TopNav({ actIdx: this.NewsCategory })
        .height('8%')


      if (this.keyword !== '') {
        // 搜索逻辑独立出来，keyword 变化时，搜索结果也会刷新
        MainContent({ "path": '/news', "keyword": this.keyword })
          .height('80%')
      }

      // 展示首页
      else if (this.NewsCategory == 0) {
        MainContent({"path" : '/news'})
          .height('80%')
      }
      // 展示军事板块  ma
      else if (this.NewsCategory == 1) {
        MainContent({"path" : '/news/ma'})
          .height('80%')
      }

      //  展示科技板块
      else if (this.NewsCategory == 2) {
        SciencePage()
          .height('80%')
      }

      // 展示教育板块 ed
      else if (this.NewsCategory == 3) {
        TeachPage()
          .height('80%')
      }

      // 展示汽车板块 ca
      else if (this.NewsCategory == 4){
        CarPage()
          .height('80%')
      }

      // 展示财经板块  st
      else if (this.NewsCategory == 5){
        Financial()
          .height('80%')
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F0F0F0')
    .justifyContent(FlexAlign.SpaceAround)
  }
}