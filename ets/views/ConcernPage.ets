import { CarType } from '../models/Car'
import { $get_news } from '../utils/request'
import Topone from '../views/GoodsList/Topone'
import Topthree from '../views/GoodsList/Topthree'
import Toptwo from '../views/GoodsList/Toptwo'
import { router } from '@kit.ArkUI'

@Component
export default struct ConcernPage {
  @State prodList: Array<CarType> = []
  @State keyword :string = ''
  @State filter:Array<CarType> = []
  page = 2

  async aboutToAppear() {
    let list = await $get_news<CarType>(`/news/ma`)
    this.prodList = list
    this.filter = list
  }

  filterNews = () => {
    if (this.keyword) {
      this.filter = this.prodList.filter(item =>
      item.title.toLowerCase().includes(this.keyword.toLowerCase())
      );
    }
    else
    {
      this.filter = this.prodList; // 如果没有关键词，显示所有新闻
    }
  }
  build() {
    Column() {
      Column(){
        Row() {
          Text('关注')
            .fontSize(30)
          TextInput({text:''})
            .width(200)
            .onChange((value:string)=>{
              this.keyword = value
              this.filterNews()
            })
          Row()
          {
            Image($rawfile('10.png'))
              .height(30)
              .width(30)
              .onClick(() => {

              })
            Button('发布')
              .backgroundColor('#ff6189e7')
          }
        }
        .justifyContent(FlexAlign.SpaceBetween)
        .width('100%')
      }
      Scroll() {
        Row() {
          //2. 用数据
          ForEach(this.prodList, (item: CarType, index: number) => {
            Toptwo({ data: item })
          })
        }
        .justifyContent(FlexAlign.Start)
        .width('auto')
      }
      .scrollable(ScrollDirection.Horizontal)
      .width('100%')

      Scroll() {
        Flex({
          wrap: FlexWrap.Wrap,
          justifyContent: FlexAlign.SpaceBetween
        }) {
          ForEach(this.filter, (item: CarType, index: number) => {
            Topthree({ data: item })
              .onClick(() => {
                if (index == 0) {
                  router.pushUrl({ url: 'pages/CaronePage' })
                }
                if (index == 1) {
                  router.pushUrl({ url: 'pages/CartwoPage' })
                }
              })
          })
        }
        .padding({top:30})
      }
    }
  }
}