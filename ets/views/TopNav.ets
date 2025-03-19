import { category, CategoryType } from '../models/TopNav'

@Component
export default struct GoodListPage {
  @State tabList: Array<CategoryType> = category
  @Link actIdx: number // 当前选中索引
  build() {
    Scroll() {
      Row() {
        ForEach(this.tabList, (item: CategoryType, index: number) => {
          Column() {
            // 文字按钮
            Button(item.name)
              .fontSize(20)
              .width(90)
              .fontColor('#2f2f2f')
              .fontWeight(this.actIdx == index ? FontWeight.Bolder : FontWeight.Normal)
              .backgroundColor('#ffffff')
              .height('90%')
              .padding(0)
              .margin(0)

            // 动态下划线
            Text('_____')
              .fontSize(14)
              .margin({ top: -10})
              .visibility(this.actIdx === index ? Visibility.Visible : Visibility.None) // 控制显示
              .fontColor('#ff0d73e9')
              .fontWeight(FontWeight.Bolder)
          }
          .height('100%')
          .onClick(() => {
            this.actIdx = index // 更新选中索引
          })
        })
      }
      .justifyContent(FlexAlign.Start)
      .width('auto')
      .backgroundColor('#FFFFFF')
    }
    .scrollable(ScrollDirection.Horizontal)
    .width('100%')
  }
}