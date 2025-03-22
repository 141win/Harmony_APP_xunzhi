import { ScienceType } from '../models/ScienceData';
import { router } from '@kit.ArkUI';

@Component
export default struct Item {
  @Prop data: ScienceType; // 接收父组件传递的数据


  build() {
    Column() {
      // 图片
      Image(this.data.img)
        .width('100%')
        .height(200)

      Text(this.data.title)
        .fontSize(18)
        .fontColor('#333')
        .margin({ top: 10, bottom: 5 })
        .alignSelf(ItemAlign.Start)
        .onClick(() => {
          if (this.data.title == '水稻提产增效整县制推进实施方案在杭州发布'){
            router.pushUrl({
              url: 'pages/DetailPage1',
            })
          }
          else if(this.data.title == '低空经济正以多样姿态融入日常生活 “硬核”科技支撑其迎“风”而上'){
            router.pushUrl({
              url: 'pages/DetailPage2',
            })
          }
        })

      Text(`简介: ${this.data.source}`)
        .fontSize(14)
        .fontColor('#666')
        .margin({ bottom: 10 })
        .onClick(() => {
          if(this.data.source == '针对水稻大面积提产增效难题，探索水稻提产增效整县制推进实施路径，构建“一县一策”技术集成模式，为实现水稻单产大面积提升提供科技支撑……这是记者3月19日在浙江省杭州市富阳区举办的水稻大面积提产增效整县制推进研讨部署会上获悉的内容。'){
            router.pushUrl({
              url: 'pages/DetailPage1',
            })
          }
          else if(this.data.source == '近日，湖北武汉低空经济创新成果集中发布。目前已有24条低空航线投入使用，包括8条载人航线和16条无人机航线。'){
            router.pushUrl({
              url: 'pages/DetailPage2',
            })
          }
        })
    }
    .width('100%')
    .margin({ bottom: 20 });
  }
}