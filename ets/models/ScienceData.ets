//数据接口
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
