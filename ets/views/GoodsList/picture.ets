import { category, CategoryType } from "../../models/Car";

@Preview
@Component
export default struct Picture {
  @State picture: Array<CategoryType> = category

  build() {
    Column() {
      Swiper() {
        ForEach(this.picture, (item: CategoryType) => {
          Stack({ alignContent: Alignment.Center }) { // 使用 Stack 来堆叠 Image 和 Text
            Image(item.name)
              .width('90%')
              .height(200)

            Text(item.msg)
              .position({ x: '5%', y: '70%' })// 根据需要调整x和y值以确保文本位于图片上的正确位置
              .fontSize(24)
              .fontColor('#ffffff')
              .padding(16)
          }
          .width('100%') // 确保 Stack 的宽度与父容器匹配
          .height(200) // 设置 Stack 的高度
          .margin({ bottom: 20 }) // 添加一些间距以便更好看
        }) // 提供一个唯一的键值，这里使用 msg 字段作为唯一标识
      }
      .width('100%') // 设置 Column 宽度
      Flex({
        wrap: FlexWrap.Wrap,
        justifyContent: FlexAlign.SpaceBetween
      }) {
        Image($rawfile('1.png'))
          .height(50)
          .width(50)
        Image($rawfile('2.png'))
          .height(50)
          .width(50)
        Image($rawfile('3.png'))
          .height(50)
          .width(50)
        Image($rawfile('4.png'))
          .height(50)
          .width(50)
        Image($rawfile('5.png'))
          .height(50)
          .width(50)
      }
      .padding({top:30})
      Flex({
        wrap: FlexWrap.Wrap,
        justifyContent: FlexAlign.SpaceBetween
      }) {
        Text('车型大全')
        Text('热门车型')
        Text('车友圈')
        Text('二手车')
        Text('条件选车')
      }
      Flex({
        wrap: FlexWrap.Wrap,
        justifyContent: FlexAlign.SpaceBetween
      }) {
        Image($rawfile('6.png'))
          .height(50)
          .width(50)
        Image($rawfile('7.png'))
          .height(50)
          .width(50)
        Image($rawfile('8.png'))
          .height(50)
          .width(50)
        Image($rawfile('9.png'))
          .height(50)
          .width(50)
      }
      .padding({top:30,left:10,right:10})
      Row(){
        Text('小米汽车')
        Text('迈巴赫')
        Text('玛莎拉蒂')
        Text('奔驰')
      }
      .padding({left:3,right:10})
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      Flex({
        wrap: FlexWrap.Wrap,
        justifyContent: FlexAlign.SpaceBetween
      }) {
        Image('https://p3.dcarimg.com/img/tos-cn-i-dcdx/6ab615212c1a407282fb1712221e1124~1200x0.webp')
          .height(70)
          .width(80)
        Image('https://p3.dcarimg.com/img/tos-cn-i-dcdx/9078a46347ba4d5aadd5f4239999b029~1200x0.webp')
          .height(70)
          .width(80)
        Image('https://p3.dcarimg.com/img/motor-mis-img/b0e2eda3bdf9639950e09bcae137dc10~1200x0.webp')
          .height(70)
          .width(80)
        Image('https://p3.dcarimg.com/img/tos-cn-i-dcdx/5fb022ad31564c3fa07d5d74ddbc70e9~1200x0.webp')
          .height(70)
          .width(80)
      }
      Row(){
        Text('小米SU7')
        Text('迈巴赫S级')
        Text('玛莎拉蒂总裁')
        Text('奔驰C级')
      }
      .padding({left:3,right:10})
      .width('100%')
      .justifyContent(FlexAlign.SpaceBetween)
      .padding({bottom:50})
    }
  }
}