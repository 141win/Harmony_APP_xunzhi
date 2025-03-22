import { KLineCategory, StockLineGraph } from '../../models/KLine'
// import { SelectTitleBar, promptAction, SelectTitleBarMenuItem } from '@kit.ArkUI'


@Component
export default struct KLineRegion {
  @State selected_KLine: number = 0

  build() {
    Column() {
      Row() {
        ForEach(KLineCategory.stockLineGraph, (item: StockLineGraph, index: number) => {
          Row() {
            Text(item.name)
              .fontSize(15)
              .fontColor(this.selected_KLine==index?'red':'black')
              .onClick(() => {
                this.selected_KLine=index
              })
            if (index == 5) {
              Image($rawfile('arrow_down.svg'))
                .width(16)
            }
          }
          .justifyContent(FlexAlign.SpaceAround)
          .width("16.6%")
        })

        // Row() {
        //   SelectTitleBar({
        //     // 定义下拉列表选项
        //     options: [
        //       { value: '分钟' },
        //       { value: '5分' },
        //       { value: '10分' },
        //       { value: '15分' },
        //       { value: '30分' },
        //       { value: '60分' },
        //       { value: '季K' },
        //       { value: '年K' },
        //     ],
        //     // 初始选择第一个下拉选项
        //     selected: 0,
        //     // 选中时触发函数
        //     onSelected: (index) => promptAction.showToast({ message: 'page index ' + index }),
        //     // 隐藏左侧返回箭头
        //     hidesBackButton: true,
        //   })
        // }

      }
    }
  }
}