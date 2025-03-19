import { font } from "@kit.ArkUI";


@Component
export default struct Logo{

  // 注册字体
  aboutToAppear() {
    font.registerFont({
      familyName: 'test',
      familySrc: $rawfile('SmileySans-Oblique.ttf')
    })
  }

  build() {

    Row() {

      Image($r('app.media.logo'))
        .aspectRatio(1)  // 保持原本形状
        .height(40)


      Text("鸿蒙项目：讯知")
        .fontFamily('test')//字体调用
        .fontSize(30)

    }
    .justifyContent(FlexAlign.Center)

  }


}