import { ScienceType } from '../models/ScienceData';

@Component
export default struct Item {
  @Prop data: ScienceType; // 接收父组件传递的数据

  build() {
    Column() {
      // 图片
      Image(this.data.img)
        .width('100%')
        .height(200)
        .objectFit(ImageFit.Cover) // 图片填充模式

      // 标题
      Text(this.data.title)
        .fontSize(18)
        .fontColor('#333')
        .margin({ top: 10, bottom: 5 })
        .alignSelf(ItemAlign.Start)


      // 来源
      Text(`简介: ${this.data.source}`)
        .fontSize(14)
        .fontColor('#666')
        .margin({ bottom: 10 });
    }
    .width('100%')
    .margin({ bottom: 20 });
  }
}