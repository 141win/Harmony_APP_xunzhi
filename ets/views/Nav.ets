import {NavIconType,navIcon} from '../models/BottomNavIcon'

@Component
export default struct Nav {
  @Link actIdx: number//@Link定义的变量不能在此处初始化//接收父组件传递的数据
  @State tabList:Array<NavIconType> = navIcon
  build() {
    Row() {
      ForEach(this.tabList, (item: NavIconType, index: number) => {
        Column() {
          Row() {
            Image(this.actIdx==index?item.selectedIcon:item.icon)
              .width(20)
          }
          .height('60%')
          Row() {
            Text(item.name)
          }
          .height('40%')
          .justifyContent(FlexAlign.Center)
        }
        .onClick(() => {
          this.actIdx = index
        })
      })
    }
    .width('100%')
    .height(60)
    .justifyContent(FlexAlign.SpaceAround)
    .backgroundColor('#E0E0E0')
    .borderRadius('40%')
  }
}
