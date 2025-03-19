import { NewsType } from '../models/News'
import { $get_news } from '../utils/request'

@Component
export default struct MainContent {
  // @Link :string
  @State egDivider: DividerTmp = new DividerTmp(1, 20, 20, Color.Black)
  @State res: Array<NewsType> = [] //定数据
  // @Link path : String
  async aboutToAppear() {
    let list = await $get_news<NewsType>('/news/ed')
    console.log('页面即将显示', JSON.stringify(list))
    this.res = list //3.改数据 （将网络请求到的数据设置给预先定义的响应式数据）
  }

  page = 1;

  loadMore = async ()=>{
    // let url = this.path + '/?category=${cate}&page=${this.page}'
    // let list = await $get_news<NewsType>(url)
    // this.page++
    // this.res = [
    //   ...this.res,  //原数据，拓展运算符
    //   ...list  //新数据
    // ]
  }

  build() {
    // 内容展示列表
    Scroll(){
      List({ space: 10 }) {
        ForEach(this.res, (item: NewsType) => {

          ListItem() {
            newsItem({
              title: item.title,
              createTime: item.created_date,
              source: item.source,
              imgPath: item.img
            })
              .height('20%')
              .margin({ left: 10, right: 10 })
          }
        })
      }
      .alignListItem(ListItemAlign.Center)
      .divider(this.egDivider)

      // ListItem() {
      //   newsItem({
      //     title: "占位",
      //     createTime: "占位",
      //     source: "占位",
      //     imgPath: "占位"
      //   })
      //     .height('20%')
      //     .margin({ left: 10, right: 10 })
      // }
      //
      // ListItem() {
      //   newsItem({
      //     title: "占位",
      //     createTime: "占位",
      //     source: "占位",
      //     imgPath: "占位"
      //   })
      //     .height('20%')
      //     .margin({ left: 10, right: 10 })
      // }
      //
      // ListItem() {
      //   newsItem({
      //     title: "占位",
      //     createTime: "占位",
      //     source: "占位",
      //     imgPath: "占位"
      //   })
      //     .height('20%')
      //     .margin({ left: 10, right: 10 })
      // }
      //
      // ListItem() {
      //   newsItem({
      //     title: "占位",
      //     createTime: "占位",
      //     source: "占位",
      //     imgPath: "占位"
      //   })
      //     .height('20%')
      //     .margin({ left: 10, right: 10 })
      // }
      //
      // ListItem() {
      //   newsItem({
      //     title: "占位",
      //     createTime: "占位",
      //     source: "占位",
      //     imgPath: "占位"
      //   })
      //     .height('20%')
      //     .margin({ left: 10, right: 10 })
      // }

    }
    }

}


// 单个列表项
@Component
struct newsItem {
  @Prop title: string;
  @Prop createTime: string;
  @Prop source: string;
  @Prop imgPath: string = '/app.media.background';
  imgPrePath: string = ''

  build() {

    // 新闻以{标题 时间} {图片} 排列
    Row() {
      // {标题
      //  时间 来源}
      Row() {
        Column() {
          // 标题
          Text(this.title)
            .fontColor(Color.Black)
            .fontSize('18')
            .layoutWeight(3)


          Row({ space: 10 }) {
            // 时间
            Text(this.createTime)
              .fontColor(Color.Black)
              .fontSize('10')
              .layoutWeight(3)

            // 来源
            Text(this.source)
              .fontColor(Color.Black)
              .fontSize('10')
              .layoutWeight(2)
          }
          .layoutWeight(1)

        }
        .alignItems(HorizontalAlign.Start) // 靠左
      }
      .padding({ left: 10 })
      .layoutWeight(7)

      Row() {
        // 图片
        Image(this.imgPrePath + this.imgPath)
          .height('100%')
          .aspectRatio(1) // 保持原本形状

      }
      .layoutWeight(3)
      .justifyContent(FlexAlign.End)
    }

  }
}


// 分隔线样式
class DividerTmp {
  strokeWidth: Length
  startMargin: Length
  endMargin: Length
  color: ResourceColor

  constructor(strokeWidth: Length, startMargin: Length, endMargin: Length, color: ResourceColor) {
    this.strokeWidth = strokeWidth
    this.startMargin = startMargin
    this.endMargin = endMargin
    this.color = color
  }
}