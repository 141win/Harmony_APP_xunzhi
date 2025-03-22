import Logo from './logo'

@Entry
@Component
struct UserCenter {
  build() {
    Column() {
      // 顶部设置和扫一扫图标
      Row({ space: 12 }) {
        Image($rawfile('sao.png'))
          .width(25)
        Image($rawfile('setting.png'))
          .width(25)
      }
      .width('100%')
      .justifyContent(FlexAlign.End)
      .margin({ right: 20, top: 15 })

      // 用户基础信息
      Row() {
        Image($rawfile('useravatar.png')) // 用户头像
          .width(50)
          .borderRadius(25)
          .margin({ left: 20, right: 10 })
        Text('ikun1')
          .fontWeight(600)
      }
      .width('100%')
      .justifyContent(FlexAlign.Start)
      .alignItems(VerticalAlign.Top)

      // 用户数据（获赞、发表、关注、粉丝）
      Row() {
        Column() {
          Text('20获赞')
            .fontColor('#666')
        }
        .layoutWeight(1)

        Column() {
          Text('14发表')
            .fontColor('#666')
        }
        .layoutWeight(1)

        Column() {
          Text('5关注')
            .fontColor('#666')
        }
        .layoutWeight(1)

        Column() {
          Text('10亿粉丝')
            .fontColor('#666')
        }
        .layoutWeight(1)
      }
      .width('100%')
      .padding({ left: 25, right: 25 })
      .margin({ top: 10 })
      .justifyContent(FlexAlign.SpaceAround)

      // 我的
      Column() {
        Column() {
          Row() {
            Text('我的')
              .fontSize(18)
              .fontWeight(700)
            Blank()
            Row() {
              Text('更多')
                .fontSize(14)
                .fontColor('#ff9b9a9a')
              Image($rawfile('more.png'))
                .width(18)
                .fillColor('#ff9b9a9a')
            }
          }
          .width('100%')
          .margin({ bottom: 15 })

          Row() {
            Column() {
              Image($rawfile('xiaoxi.png'))
                .width(26)
              Text('消息')
                .fontSize(12)
                .margin(6)
            }
            .layoutWeight(1)

            Column() {
              Image($rawfile('shoucang.png'))
                .width(35)
              Text('收藏')
                .fontSize(12)
                .margin(6)
            }
            .layoutWeight(1)

            Column() {
              Image($rawfile('lishi.png'))
                .width(30)
              Text('历史')
                .fontSize(12)
                .margin(6)
            }
            .layoutWeight(1)

            Column() {
              Image($rawfile('dianzan.png'))
                .width(34)
              Text('点赞')
                .fontSize(12)
                .margin(6)
            }
            .layoutWeight(1)
          }
          .width('100%')
        }
        .backgroundColor('#fff')
        .borderRadius(15)
        .padding(15)
      }
      .width('90%') // 统一宽度为 90%
      .margin({ top: 20, bottom: 10 }) // 添加上下间距
      .alignItems(HorizontalAlign.Center) // 居中显示

      // 常用功能
      Column() {
        Column() {
          Row() {
            Text('常用功能')
              .fontSize(18)
              .fontWeight(700)
            Blank()
            Row() {
              Text('更多')
                .fontSize(14)
                .fontColor('#ff9b9a9a')
              Image($rawfile('more.png'))
                .width(18)
                .fillColor('#ff9b9a9a')
            }
          }
          .width('100%')
          .margin({ bottom: 15 })

          Row() {
            Column() {
              Image($rawfile('ziti.png'))
                .width(30)
              Text('字体')
                .fontSize(12)
                .margin(6)
            }
            .layoutWeight(1)

            Column() {
              Image($rawfile('yejian.png'))
                .width(30)
              Text('夜间')
                .fontSize(12)
                .margin(6)
            }
            .layoutWeight(1)

            Column() {
              Image($rawfile('bangzhu.png'))
                .width(30)
              Text('帮助')
                .fontSize(12)
                .margin(6)
            }
            .layoutWeight(1)

            Column() {
              Image($rawfile('anquan.png'))
                .width(30)
              Text('安全')
                .fontSize(12)
                .margin(6)
            }
            .layoutWeight(1)
          }
          .width('100%')
        }
        .backgroundColor('#fff')
        .borderRadius(15)
        .padding(15)
      }
      .width('90%') // 统一宽度为 90%
      .margin({ bottom: 20 }) // 添加底部间距
      .alignItems(HorizontalAlign.Center) // 居中显示
    }
    .padding(10)
    .backgroundColor('#F5F5F5') // 浅灰色背景
    .width('100%')
    .height('100%')
  }
}

export default UserCenter