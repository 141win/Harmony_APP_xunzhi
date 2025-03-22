import { CarType } from '../models/Car'
import { $get_news } from '../utils/request'
import QiChe from './GoodsList/QiChe'
import { router } from '@kit.ArkUI'
import Picture from './GoodsList/picture'


@Component
export default struct CarPage {
  @State prodList: Array<CarType> = []
  page = 2

  async aboutToAppear() {
    let list = await $get_news<CarType>('/news/ca')
    //console.log('页面即将显示', JSON.stringify(list))
    this.prodList = list
  }

  loadMore = async () => {
    let url = `/news/ca?&page=${this.page}`
    let list = await $get_news<CarType>(url)
    this.page++
    this.prodList = [
      ...this.prodList,
      ...list
    ]
  }

  build() {
    Column() {
      Scroll() {
        Column() {
          Picture()
          Flex({
            wrap: FlexWrap.Wrap,
            justifyContent: FlexAlign.SpaceBetween
          }) {
            //2. 用数据
            ForEach(this.prodList, (item: CarType, index: number) => {
              QiChe({ data: item })
                .onClick(() => {
                  console.log(' ' + index)
                  if (index == 0) {
                    router.pushUrl({ url: 'pages/CaronePage' })
                  }
                  if (index == 1) {
                    router.pushUrl({ url: 'pages/CartwoPage' })
                  }
                })
            })
          }
        }
      }
      .scrollBarWidth(2)
      .onScrollEdge((side: Edge) => {
        if (side == 2) {
          this.loadMore()
        }
      })
    }
    .width('100%')
  }
}