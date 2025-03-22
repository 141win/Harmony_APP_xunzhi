// export class TimeSharingData {
//   time: string
//   price: number
//   volume: number
// }
//
// export class KLineData {
//   date: string
//   open: number
//   close: number
//   high: number
//   low: number
//   volume: number
// }
//
// // 模拟数据生成
// export function generateTimeSharingData(): TimeSharingData[] {
//   // 生成分时数据逻辑
// }
//
// export function generateKLineData(): KLineData[] {
//   // 生成K线数据逻辑
// }
//
// @Component
// struct StockChart {
//   @State chartType: string = 'time' // time/kline
//   @State currentData: any[] = []
//   @State scale: number = 1.0
//   @State offset: number = 0
//
//   aboutToAppear() {
//     this.loadData()
//   }
//
//   loadData() {
//     this.currentData = this.chartType === 'time' ?
//     generateTimeSharingData() : generateKLineData()
//   }
//
//   build() {
//     Column() {
//       // 图表类型切换
//       Row() {
//         Button('分时')
//           .onClick(() => {
//             this.chartType = 'time'
//             this.loadData()
//           })
//         Button('K线')
//           .onClick(() => {
//             this.chartType = 'kline'
//             this.loadData()
//           })
//       }
//
//       // 图表绘制区域
//       Canvas(this.onPaint)
//         .width('100%')
//         .height(400)
//         .backgroundColor(Color.White)
//         .onTouch((event) => this.handleTouch(event))
//     }
//   }
//
//   // 绘图逻辑
//   onPaint(ctx: CanvasRenderingContext2D) {
//     ctx.clearRect(0, 0, ctx.width, ctx.height)
//
//     if (this.chartType === 'time') {
//       this.drawTimeSharing(ctx)
//     } else {
//       this.drawKLine(ctx)
//     }
//   }
//
//   // 分时图绘制
//   private drawTimeSharing(ctx: CanvasRenderingContext2D) {
//     const { width, height } = ctx
//     const data = this.currentData as TimeSharingData[]
//
//     // 计算坐标范围
//     const prices = data.map(d => d.price)
//     const minPrice = Math.min(...prices)
//     const maxPrice = Math.max(...prices)
//
//     // 绘制价格曲线
//     ctx.beginPath()
//     data.forEach((d, i) => {
//       const x = i * (width / data.length)
//       const y = height - ((d.price - minPrice) / (maxPrice - minPrice)) * height
//       i === 0 ? ctx.moveTo(x, y) : ctx.lineTo(x, y)
//     })
//     ctx.strokeStyle = '#1890ff'
//     ctx.stroke()
//   }
//
//   // K线图绘制
//   private drawKLine(ctx: CanvasRenderingContext2D) {
//     const { width, height } = ctx
//     const data = this.currentData as KLineData[]
//     const candleWidth = 6
//
//     data.forEach((d, i) => {
//       const x = i * (width / data.length)
//       const yHigh = this.priceToY(d.high, height)
//       const yLow = this.priceToY(d.low, height)
//       const yOpen = this.priceToY(d.open, height)
//       const yClose = this.priceToY(d.close, height)
//
//       // 绘制影线
//       ctx.beginPath()
//       ctx.moveTo(x + candleWidth/2, yHigh)
//       ctx.lineTo(x + candleWidth/2, yLow)
//       ctx.strokeStyle = d.close > d.open ? 'red' : 'green'
//       ctx.stroke()
//
//       // 绘制实体
//       ctx.fillStyle = d.close > d.open ? 'red' : 'green'
//       ctx.fillRect(
//         x,
//         Math.min(yOpen, yClose),
//         candleWidth,
//         Math.abs(yOpen - yClose)
//       )
//     })
//   }
//
//   // 触摸事件处理
//   private handleTouch(event: TouchEvent) {
//     // 实现平移和缩放逻辑
//   }
//
//   // 辅助方法
//   private priceToY(price: number, height: number): number {
//     const prices = this.currentData.map(d => d.high)
//     const min = Math.min(...prices)
//     const max = Math.max(...prices)
//     return height - ((price - min) / (max - min)) * height * 0.9
//   }
// }