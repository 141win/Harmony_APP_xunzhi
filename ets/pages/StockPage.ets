import TopNav from '../views/stockPage/TopFunc'
import StockDataRegion from '../views/stockPage/StockDataRegion'
import { router } from "@kit.ArkUI"
import KLineRegion from '../views/stockPage/KLineRegion'
import StockInfoSelectTitle from '../views/stockPage/StockInfoSelectTitle'
import Fund from '../views/stockPage/Fund'
import Info from '../views/stockPage/Info'
import Review from '../views/stockPage/Review'
import { StockType, CategoryData } from '../models/Stock'
import { $get_stock } from '../utils/request'

interface index {
  stockId: number,
  item: StockType
}

@Entry
@Component
struct StockPage {
  @State stockId: number = 0
  //父组件传入的数据
  @State detail: StockType | null = null
  //选择的子组件编号
  @State StockInfoCategory: number = 0
  //请求具体某支股票数据
  @State resStockData: Array<CategoryData> = [] //定数据
  @State cate1: Array<CategoryData> =
    [{ category: '无', Data: 0 }, { category: '无', Data: 0 }, { category: '无', Data: 0 }]
  @State cate2: Array<CategoryData> = []
  @State cate3: Array<CategoryData> = []

  // @State resLength:number = this.resStockData.length
  async aboutToAppear() {
    let stock = router.getParams() as index //类型断言
    console.log('股票详情页', JSON.stringify(stock))
    this.detail = stock.item
    // this.stockId = stock.stockId
    // console.log(stock.stockId+'')
    console.log('股票详情页', this.detail)

    let url = `/stock/stockData?&page=${stock.stockId+1}&pageSize=${20}`
    let stockData = await $get_stock<CategoryData>(url)
    console.log('stockData', JSON.stringify(stockData))
    this.resStockData = stockData //3.改数据 （将网络请求到的数据设置给预先定义的响应式数据）
    this.cate1 = this.resStockData.splice(0, 3)
    this.cate2 = this.resStockData.splice(0, 6)
    this.cate3 = this.resStockData.splice(0, 11)
  }

  build() {
    Column() {
      //顶部
      TopNav({ stockName: this.detail?.name, stockId: this.detail?.id })
        .width('100%')
      Scroll() {
        Column() {

          //股票数据区
          StockDataRegion({ cateData1: this.cate1, cateData2: this.cate2 })
            .width('100%')
            .margin({ top: 2 })
          //K线图选择栏
          KLineRegion()
            .width('100%')
            .margin({ top: 2 })
          //股票信息选择栏
          StockInfoSelectTitle({ selected_Info: this.StockInfoCategory })
            .width('100%')
            .margin({ top: 2 })
          if (this.StockInfoCategory == 0) {
            Fund({ plate: this.cate3 })
              .width('100%')
              .margin({ top: 2 })
          } else if (this.StockInfoCategory == 1) {
            Info()
              .width('100%')
              .margin({ top: 2 })
          } else if (this.StockInfoCategory == 2) {
            Review()
              .width('100%')
              .margin({ top: 2 })
          }
        }
      }
    }
  }
}