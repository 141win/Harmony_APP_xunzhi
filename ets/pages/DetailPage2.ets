import { router } from '@kit.ArkUI'
@Entry
@Component
struct DetailPage2 {
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
        Text('低空经济正以多样姿态融入日常生活 “硬核”科技支撑其迎“风”而上')
          .fontSize(24)
          .fontColor('#333')
          .margin({ top: 20, bottom: 10 })
          .alignSelf(ItemAlign.Start)

        Text('来源：央视网 | 2025年03月19日 14:37:53')
          .fontSize(14)
          .fontColor('#666')
          .margin({ bottom: 20 })
          .alignSelf(ItemAlign.Start)

        Text('        央视网消息：近日，湖北武汉低空经济创新成果集中发布。目前已有24条低空航线投入使用，包括8条载人航线和16条无人机航线。')
          .fontSize(16)
          .fontColor('#333')
          .margin({ bottom: 20 })
          .alignSelf(ItemAlign.Start)

        Image('https://p2.img.cctvpic.com/photoworkspace/contentimg/2025/03/19/2025031914371658577.png')
          .width('100%')
          .height(200)
          .margin({ bottom: 20 })

        Text('        在活动现场，新款无人机、无人机应急指挥车、智能反制系统等“硬核”科技同步亮相，吸引了大家的目光。')
          .fontSize(16)
          .fontColor('#333')
          .margin({ bottom: 20 })
          .alignSelf(ItemAlign.Start)

        Image('https://p3.img.cctvpic.com/photoworkspace/contentimg/2025/03/19/2025031914372265020.png')
          .width('100%')
          .height(200)
          .margin({ bottom: 20 })

        Text('        活动现场还首次发布了天河江城低空快线。未来，市民游客可以“打飞的”从江汉关往返天河机场。目前，武汉市已有24条低空航线投入使用，其中包含8条载人航线和16条无人机航线，全面覆盖了短途运输、空中游览、物流运输等多个领域，覆盖空域网络达500平方公里。')
          .fontSize(16)
          .fontColor('#333')
          .margin({ bottom: 20 })
          .alignSelf(ItemAlign.Start)

        Text('        上海：长三角城际低空载客航线网络化运行试飞\n\n        18日，上海虹桥国际中央商务区完成6条城际载客航线首飞验证，预计“五一”前开通上海到江苏吴江、太仓的低空航线。')
          .fontSize(16)
          .fontColor('#333')
          .margin({ bottom: 20 })
          .alignSelf(ItemAlign.Start)

        Image('https://p5.img.cctvpic.com/photoworkspace/contentimg/2025/03/19/2025031914373080080.png')
          .width('100%')
          .height(200)
          .margin({ bottom: 20 })

        Text('        记者现场体验了从上海飞往浙江平湖的直升机航线，感觉非常平稳，可以从空中非常清晰地俯瞰地面的美景，体验感非常好。')
          .fontSize(16)
          .fontColor('#333')
          .margin({ bottom: 20 })
          .alignSelf(ItemAlign.Start)

        Image('https://p1.img.cctvpic.com/photoworkspace/contentimg/2025/03/19/2025031914373664374.png')
          .width('100%')
          .height(200)
          .margin({ bottom: 20 })

        Text('        此次共试飞了虹桥至上海金山区、松江区，虹桥至浙江平湖、嘉定，虹桥至江苏太仓、昆山6条航线。据了解，通过低空飞行，虹桥枢纽城际之间的商务出行和文旅交通时间较传统交通方式大幅缩短。以虹桥到平湖为例，飞行时间只需要20分钟左右，比驾车用时缩短70%，比乘坐高铁总耗时缩短83%。长三角“低空走廊”覆盖上海虹桥、苏州、嘉兴、芜湖四地，未来计划开通虹桥与苏州工业园区、相城、芜湖芜宣机场等航线。')
          .fontSize(16)
          .fontColor('#333')
          .margin({ bottom: 20 })
          .alignSelf(ItemAlign.Start)

        Column() {
          Text('编辑：刘珊')
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
      .width('100%')
      .padding({ left: 20, right: 20 })
    }
  }
}