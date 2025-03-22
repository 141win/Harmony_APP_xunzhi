// 股票数据接口
export interface StockType {
  id: number
  listing_date: string
  name: string
  price: number | null
}

export interface StockResData<T> {
  code: number,
  msg: string,
  data: Array<T>
}

//-------------------------------------

//某支股票具体数据
export interface PriceType {
  TopPrice: number,
  DownPrice: number,
  OpenPrice: number,
  ExchangePercentage: number,
  Value: number,
  TranscationVolume: number
}

export interface PriceResData<T> {
  data: T
}


export interface CategoryResData<T> {
  data: Array<T>
}

export interface CategoryData {
  category: String,
  Data: number
}

export const cateData: Array<CategoryData> = [
  {
    category: '现价',
    Data: 1769.01
  },
  {
    category: '涨数',
    Data: 20.85,
  },
  {
    category: '涨幅',
    Data: 1.19
  },
  {
    category: '最高',
    Data: 1770.48
  },
  {
    category: '最低',
    Data:
    1749.90
  },
  {
    category: '今开',
    Data:
    1749.90
  },
  {
    category: '换手率',
    Data:
    0.3
  },
  {
    category: '市值',
    Data:
    189
  },
  {
    category: '成交额',
    Data:
    174.9
  },
  {
    category: '银行',
    Data: 0.23
  },
  {
    category: '北京',
    Data: 0.76
  },
  {
    category: '中字头股票',
    Data: 0.53
  },
  {
    category: '券商重仓',
    Data: 0.42
  },
  {
    category: '中特估',
    Data: 0.78
  },
  {
    category: '融资融券',
    Data: 0.19
  },
  {
    category: '沪股通',
    Data: 0.49
  },
  {
    category: '标普道琼斯A股',
    Data: 0.9
  },
  {
    category: '汇金（国家队）',
    Data: 0.29
  },
  {
    category: '高股息精选',
    Data: 0.22
  },
  {
    category: '证金（国家队）',
    Data: 0.18
  }
]

//--------------------------------------

//股票资讯
export interface StockInfoType {
  title: number
  created_date: string
  source: string
}


