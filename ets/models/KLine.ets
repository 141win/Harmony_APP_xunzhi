export interface StockLineGraph {
  name: string
}

export interface StockLineGraphArray<T> {
  stockLineGraph: Array<T>,
  otherStockLineGraph: Array<T>
}

export const KLineCategory: StockLineGraphArray<StockLineGraph> = {
  stockLineGraph: [
    {
      name: '分时'
    },
    {
      name: '五日'
    },
    {
      name: '日K'
    },
    {
      name: '周K'
    },
    {
      name: '月K'
    },
    {
      name: '分钟'
    }
  ],
  otherStockLineGraph:[
    {
      name: '1分'
    },
    {
      name: '5分'
    },
    {
      name: '15分'
    },
    {
      name: '30分'
    },
    {
      name: '60分'
    },
    {
      name: '120分'
    },
    {
      name:'季K'
    },
    {
      name:'年K'
    }
  ]
}

export interface  StockInfoSelect{
  name:string
}
export const stockInfoSelectT:Array<StockInfoSelect> = [
  {
    name: '资金'
  },
  {
    name:'资讯'
  },
  {
    name:'评论'
  }

]

