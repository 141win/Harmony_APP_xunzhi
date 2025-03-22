class MyDataSource implements IDataSource {
  private list: string[] = []

  constructor(list: string[]) {
    this.list = list
  }

  totalCount(): number {
    return this.list.length
  }

  getData(index: number): string {
    return this.list[index]
  }

  registerDataChangeListener(listener: DataChangeListener): void {
  }

  unregisterDataChangeListener() {
  }
}

@Component
export default struct ImageSwiper {
  private swiperController: SwiperController = new SwiperController()
  private data: MyDataSource = new MyDataSource([])

  aboutToAppear(): void {
    let list: string[] = []//存放图片路径
    list.push('https://inews.gtimg.com/news_ls/OWiBiEXqGa_6TBIyIqINMLi8z1xjDl1nhDqqPpAHcWnt8AA_870492/0')
    list.push('https://inews.gtimg.com/news_ls/OFdNyhupCCa8zrwSKfS-hfMkFR-H34mc7c_-Qhux4I5-kAA_870492/0')
    list.push('https://inews.gtimg.com/news_ls/OuUEUZGbuNz_w541vmWinENjWei1Kt7-yy_cglr6eKNiwAA_870492/0')
    list.push('https://inews.gtimg.com/news_ls/OGnjlM7ixhCXWmtoneenwK3p2QqkB4F9j99RvSWbvnQvIAA_870492/0')
    this.data = new MyDataSource(list)
  }

  build() {
    Column({ space: 5 }) {
      Swiper(this.swiperController) {
        LazyForEach(this.data, (item: string) => {
          Image(item)
            .width('100%')
            .height(160)
            .backgroundColor(0xAFEEEE)
        }, (item: string) => item)
      }
      .cachedCount(2)
      .index(5)
      .autoPlay(true)
      .interval(4000)
      .loop(true)
      .duration(1000)
      .itemSpace(0)
      .indicator( // 设置圆点导航点样式
        new DotIndicator()
          .itemWidth(8)
          .itemHeight(8)
          .selectedItemWidth(16)
          .selectedItemHeight(8)
          .color(Color.Gray)
          .selectedColor(Color.Blue)
          .maxDisplayCount(9))
    }
    .width('100%')
    .height('100%')
    .margin({ top: 5 })
  }
}