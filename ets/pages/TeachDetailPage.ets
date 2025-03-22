import { $get_sci } from '../utils/request'
import { ScienceType } from '../models/ScienceData'
import { router } from '@kit.ArkUI'

interface RouterParams {
  id?: number
}

@Entry
@Component
struct NewDetailPage {
  @State isCollected: boolean = false
  @State productList: Array<ScienceType> = [] //1. 定数据
  @State detailData: Array<ScienceType> | null = null
  private newsId: number = 0

  aboutToAppear() {
    const params = router.getParams() as RouterParams
    if (params?.id !== undefined) {
      this.newsId = params.id
      this.loadNewsDetail()
    }
  }

  async loadNewsDetail() {
    try {
      const res = await $get_sci<ScienceType>(`/news/te/?id=${this.newsId}`)
      console.log('新闻详情数据:', JSON.stringify(res))
      this.detailData = res // 绑定到状态变量
    } catch (error) {
      console.error('获取详情失败:', error)
    }
  }

  build() {
    Column() {
      Row() {
        Image($rawfile('back.svg'))
          .width(20)
          .onClick(() => {
            console.log('触发点击')
            router.back()
          })
      }
      .width("100%")
      Scroll(){
        Column() {
          // 标题部分
          Row() {
            Text("管红艳：为人务本 做事求真——依托本土资源 构建本真教育")
              .fontSize(24)
              .margin({ bottom: 10 })
          }
          .width('100%')
          .justifyContent(FlexAlign.Center)

          Row() {
            // 发布者信息
            Text("校长传媒  2025-03-19 07:45 发布于：北京市")
              .fontSize(14)
              .fontColor('#666666')
              .margin({ bottom: 15 })

          }
          .width('100%')
          .justifyContent(FlexAlign.Center)

          // 新闻内容
          Text('一、本真教育的提出\n' +
            '\n' +
            '依照教育局特色办学要求，结合校情、学情开展此项工作。\n' +
            '\n' +
            '一是资源优势：物质资源丰厚，可以便捷地走近自然，开展 “接地气”的教育；民风淳朴，地方特色生活习俗传承与发扬；有红色教育基地，抗联人物的辐射影响等可挖掘的教育资源。\n' +
            '\n' +
            '二是学情所迫：现状“严峻”，有的学生不会剥鸡蛋皮，分不清韭菜和麦子、镐头和锄头，黄瓜从蒂巴开始吃……孩子多是衣来伸手，饭来张口，根本不知道珍惜，不知道感恩。孩子不听话，不爱干活，不爱学习。因为忘记了根本，没有努力追求的动力，十足的“空心人”。教育的根本任务是立德树人，首先让孩子真正成为一个人，增强责任意识，培养真、善、美的品质。\n' +
            '\n' +
            '三是教育使然：陶行知的“生活教育论”及陈鹤琴的“活教育论”让我们再次对教育审视。我国二十一世纪教育发展研究院院长，著名教育、文化学者杨东平认为：基础教育应立足本土，来源生活，如果只是自上而下的高度集中和统一，将成为缺乏生活联系的无根教育。立足生活，根植本土，无处不教育，教育无不真实。\n' +
            '\n' +
            '国家的强盛寄情于中国梦、核心价值观，学校发展也要有核心价值。挖掘学校建设之“根”，确立教育发展之本：“为人务本 做事求真”为宗旨的“本真”特色教育落地生根。\n' +
            '\n' +
            '二、本真教育的内涵\n' +
            '\n' +
            '“本真教育”是对教育的一种美好理想与不懈追求。植根于博大精深的中华传统文化，立本：《论语》“君子务本，本立而道生”。立本就是教育要尊重生命的本态，遵循生命的发展规律。求真 ：陶行知说：“千教万教教人求真，千学万学学做真人。”崇尚科学，追求真知，坚持真理，真实诚信，追求真才实学。是一种是回归教育本义，完美统一的人的个性化、社会化的教育，在尊重生命本态的前提下，以人为本，务本向善，是回归自然本色的教育。\n' +
            '\n' +
            '大蒲柴河镇中心校始建于上世纪三十年代，老一辈大蒲柴河人艰苦创业、意气奋发、合力办学，成为教育发展之本。 学校从教育教学质量、生态建设、特色发展上不断谋求新思路，务实而行，孕育了许许多多的文化之根，它可以涵养、沉浸、润泽我们的学校，让农村学校拥有文化根基，为学生提供自然的、真实的成长空间，促进学生的长足发展。\n' +
            '\n' +
            '三、本真教育的路径\n' +
            '\n' +
            '1.思想是行动的指南：围绕本真特色教育，树立学校发展的旗帜，确立校徽、校树、校“花”。校徽：朴实无华的蒲公英，由P与X即“蒲小”首字母组成；1937是建校年，是起始点。从这里出发，不忘根本，寄寓着简单的快乐，时刻准备纷飞。校徽是标志性文化，人人戴。校树：山里红，将其“雕琢”，使之形态各异，喻名“守望、飞翔、舞”等，一校一树，一树一名，以树喻人，独树一帜。预示个性十足、朝气蓬勃的孩子们。校花（红豆杉）：松柏有本性，风霜其奈何。不失花的婀娜，平增花的傲骨，似傲雪寒梅，似迎风秋菊。花盆里栽不出参天松，他年它将和学梓带上蒲园这一段美好，从蒲小出发，去沃野、去四海！\n' +
            '\n' +
            '2.行动是理念的展现：成立领导小组，制订本真教育工作规划，确立目标、内容、方法。本真教育目标：立本真之志、展本真性情、行本真品质、做本真师生、创本真特色、塑本真蒲小。内容：倾力于本真园舍、倾情于本真学生、倾心于本真教师、倾重于本真课堂、倾注于本真管理。学校所有工作纳入本真教育之中，编写本真教育校本教材、本真源校报。\n' +
            '\n' +
            '3.品牌是发展的灵魂：打造本真教育“一字品牌”，本真园舍：一树一名、一石一品、一物一意、一景一情；本真教师：一堂好课、一技之长、一身正气、一世清明；本真学生 德真：一个好身体、一项好技能、一身好习惯、一世好品性；智真：一笔好字、一手好文、一副好口才、一生勤思考。')
            .fontSize(16)
            .fontColor('#333333')
            .lineHeight(24)
            .padding(10)
            .width('100%')

          // 收藏按钮
          Button() {
            Image(this.isCollected ? $rawfile('collect.svg') : $rawfile('uncollect.svg'))
              .width(45)
              .height(45)
              .objectFit(ImageFit.Contain)
          }
          .onClick(() => {
            this.isCollected = !this.isCollected
          })
          .backgroundColor(this.isCollected ? '#FFFFFF' : '#FFFFFF')
          .width(56)
          .height(56)
          .borderRadius(15)
        }
        .alignItems(HorizontalAlign.Center)
      }
      .scrollBarWidth(2)
      .onScrollEdge((side: Edge) => {
        if (side == 2) {
          // this.loadMore()
        }
      })
    }
  }
}