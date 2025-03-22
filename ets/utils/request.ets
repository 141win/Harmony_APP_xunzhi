//对@ohos/axios进行二次封装
import axios, { AxiosResponse } from '@ohos/axios'
import { StockResData } from '../models/Stock'
import { NewsResData } from '../models/News'
import { ResData, ScienceResData } from '../models/ScienceData'

const instance = axios.create({
  // baseURL:'http://localhost:3000'
  baseURL: 'http://192.168.70.102:3000'
})


//封装get请求函数
export const $get_stock = async<T>(url: string) => {
  let res: AxiosResponse<StockResData<T>> = await instance.get<T, AxiosResponse<StockResData<T>>>(url)
  return res.data.data
}

export const $get_news = async<T>(url: string) => {
  let res: AxiosResponse<NewsResData<T>> = await instance.get<T, AxiosResponse<NewsResData<T>>>(url)
  return res.data.data
}

//封装get请求函数
export const $get_sci = async<T>(url: string) => {
  let res: AxiosResponse<ScienceResData<T>> = await instance.get<T, AxiosResponse<ScienceResData<T>>>(url)
  return res.data.data
}


//封装post请求函数
export const $post = async<U, T>(url: string, data: U) => {
  let res: AxiosResponse<ResData<T>> = await instance.post<ResData<T>, AxiosResponse<ResData<T>>>(url, data)
  return res.data
}


export default instance