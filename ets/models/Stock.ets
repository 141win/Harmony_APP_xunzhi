// 股票数据接口
export interface StockType {
  id: number
  listing_date: string
  name: string
  price: number|null
}

export interface StockResData<T> {
  code: number,
  msg: string,
  data: Array<T>
}

// interface axiosResponse<T> {
//   data: responseData<T>,
//   status: number
// }