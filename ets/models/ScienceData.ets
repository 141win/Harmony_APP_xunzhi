//数据接口
export interface ResData<T> {
  code: number
  msg: string
  data: T
}
export interface ScienceResData<T> {
  code:number
  msg:string
  data:Array<T>
}

export interface ScienceType {
  title:string
  source:string
  img:string
}