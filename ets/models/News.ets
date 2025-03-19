// 新闻数据接口
export interface NewsType {
  _id: number
  title: string
  source: string
  img: string
  created_date: string
}

export interface NewsResData<T> {
  code: number,
  msg: string,
  data: Array<T>
}