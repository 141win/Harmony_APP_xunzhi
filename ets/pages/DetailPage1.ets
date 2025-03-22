import { router } from '@kit.ArkUI'
@Entry
@Component
struct DetailPage1 {
  build() {
    Scroll() {
      Column() {
        Button('返回')
          .fontSize(20)
          .alignSelf(ItemAlign.Start)
          .backgroundColor('#ffcac6c6')
          .margin({ bottom: 20 })
          .width('30%')
          .onClick(() => {
            router.pushUrl({
              url: 'pages/MainPage'
            })
          })
        Text('水稻提产增效整县制推进实施方案在杭州发布')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .fontColor('#1a1a1a')
          .margin({ bottom: 16 })
          .width('100%')

        Text('来源：新华社 | 2025年03月19日 14:53:50')
          .fontSize(14)
          .fontColor('#666')
          .margin({ bottom: 20 })
          .alignSelf(ItemAlign.Start)

        Text('原标题：水稻提产增效整县制推进实施方案在杭州发布')
          .fontSize(16)
          .fontColor('#444')
          .margin({ bottom: 25 })
          .width('100%')

        Text('        针对水稻大面积提产增效难题，探索水稻提产增效整县制推进实施路径，构建“一县一策”技术集成模式，为实现水稻单产大面积提升提供科技支撑……这是记者3月19日在浙江省杭州市富阳区举办的水稻大面积提产增效整县制推进研讨部署会上获悉的内容。')
          .fontSize(16)
          .fontColor('#333')
          .lineHeight(24)
          .margin({ bottom: 18 })
          .width('100%')

        Text('        本次会议由中国水稻研究所组织召开，与会专家分析研判当前水稻生产面临的形势和挑战，会上发布了水稻提产增效整县制推进实施方案，并研究部署2025年水稻提产增效整县制推进工作任务。')
          .fontSize(16)
          .fontColor('#333')
          .lineHeight(24)
          .margin({ bottom: 18 })
          .width('100%')

        Text('        根据实施方案，推进水稻单产提升和提质增效，需要坚持“良田、良种、良法、良机”深度融合，加强专业互补、行业协同，开展全产业链技术集成创新，一体化推进教学科研生产，探索建立多方协作机制、条件保障机制、集成创新机制和利益共享机制，促进提产增效技术落地。')
          .fontSize(16)
          .fontColor('#333')
          .lineHeight(24)
          .margin({ bottom: 18 })
          .width('100%')

        Text('        下一步，中国水稻研究所将着眼解决水稻单产提升和提质增效的瓶颈问题和技术难点，2025年在主产区遴选5至8个县开展水稻提产增效整县制推进工作，3年时间在20至30个整县制推进县形成3至5个水稻提产增效整县制推进机制模式，5年时间在50至60个县开展水稻提产增效整县制推进，集成可复制可推广的水稻提产增效新模式，形成一批理论研究成果，培养一批科研和技术推广人才，带动一批企业和新型经营主体，培训一批新型高素质农民。（记者 许舜达）')
          .fontSize(16)
          .fontColor('#333')
          .lineHeight(24)
          .margin({ bottom: 18 })
          .width('100%')

        Column() {
          Text('编辑：谢博辉')
            .fontSize(12)
            .fontColor('#999')
            .margin({ bottom: 8 })

          Text('责任编辑：刘亮')
            .fontSize(12)
            .fontColor('#999')
        }
        .width('100%')
        .margin({ top: 30 })
        .alignItems(HorizontalAlign.End)
      }
      .padding(20)
    }
  }
}