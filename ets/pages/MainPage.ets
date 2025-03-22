import MinePage from '../views/MinePage'
import BottomNav from '../views/BottomNav'
import NewsPage from '../views/NewsPage'
import ConcernPage from '../views/ConcernPage'

@Entry
@Component
struct MainPage {
  @State PageIndex: number = 0

  build() {
    Column() {
      // 用if-else判断
      if (this.PageIndex == 0) {
        //新闻页面组件
        NewsPage()
          .height('90%')
      } else if (this.PageIndex == 1) {
        //关注页面组件
        ConcernPage()
          .height('90%')
      }
      else{
        //我的页面
        MinePage()
          .height('90%')
      }
      //底部导航栏组件
      //传递参数给子组件，进行双向通信
      BottomNav({ actIdx: this.PageIndex })
        .height('5%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F0F0F0')
    .justifyContent(FlexAlign.SpaceAround)
  }
}