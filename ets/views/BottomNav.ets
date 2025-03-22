import {NavIconType,navIcon} from '../models/BottomNavIcon'

@Component
export default struct Nav {
  @Link actIdx: number//@Link定义的变量不能在此处初始化//接收传送数据与父组件通信
  @State tabList:Array<NavIconType> = navIcon
  build() {
    Row() {
      ForEach(this.tabList, (item: NavIconType, index: number) => {
        Column() {
          Row() {
            //根据父组件传递参数进行图标状态切换
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
          //根据点击结果更新响应式参数
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
