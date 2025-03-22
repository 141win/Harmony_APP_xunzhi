import { NewsType } from '../models/News'
import { $get_news } from '../utils/request'

@Component
export default struct MainContent {


  @State egDivider: DividerTmp = new DividerTmp(1, 20, 20, Color.Black)
  @State res: Array<NewsType> = [] //定数据
  @Prop path : string;
  @Prop keyword : string

  private loading: boolean = false;  // 是否正在加载
  private hasMore: boolean = true;  // 是否还有更多数据

  async aboutToAppear() {
    await this.loadMore();
  }

  page = 1;
  pageSize = 10;

  loadMore = async () => {

    if(this.keyword != '' && this.keyword != null){
      let url = `${this.path}/?keyword=${this.keyword}`;
      let list = await $get_news<NewsType>(url);
      this.res = [...this.res, ...list];  // 合并新数据
    }

    else{
      if (this.loading || !this.hasMore) return;  // 防止重复请求 & 避免无效请求
      this.loading = true;  // 设置加载状态

      let url = `${this.path}/?page=${this.page}`;
      let list = await $get_news<NewsType>(url);

      if (list.length < this.pageSize) {
        this.hasMore = false;  // 如果返回数据少于一页，则说明没有更多数据了
      }

      this.res = [...this.res, ...list];  // 合并新数据
      this.page++;  // 页码+1
      this.loading = false;  // 取消加载状态
    }

  };


  build() {
    // 内容展示列表
    Row() {
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
      .onReachEnd(() => this.loadMore()) // 监听触底


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