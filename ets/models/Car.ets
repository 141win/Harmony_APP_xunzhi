

export interface CarType {
  title:string,
  source:string,
  img: string
}

export interface ResData<T>{
  code:number,
  msg:string,
  data:Array<T>
}

export interface  CategoryType{
  msg:string
  name:string
}
export const category:Array<CategoryType> = [
  {
    msg:'秦PLUS EV 510KM标准版上市',
    name: 'https://p3-sign.toutiaoimg.com/tos-cn-i-axegupay5k/55f9fb4e071b46fc97cad3a5c9cc17e9~tplv-tt-origin-web:gif.jpeg?_iz=58558&from=article.pc_detail&lk3s=953192f4&x-expires=1742992654&x-signature=yZ5XLiuuoOx2c9T%2FWA42cL4yezA%3D'
  },
  {
    msg:'上汽奥迪A5L将亮相上海车展',
    name:'https://p26-sign.toutiaoimg.com/tos-cn-i-axegupay5k/03c4cc4bfad14a8d9c85718852de40d9~tplv-tt-origin-web:gif.jpeg?_iz=58558&from=article.pc_detail&lk3s=953192f4&x-expires=1742992833&x-signature=bjWtO8xxy%2BfBWBAzlKJise0XH%2Bo%3D'
  },
  {
    msg:'阿维塔06实车亮相',
    name:'https://p3-sign.toutiaoimg.com/tos-cn-i-axegupay5k/68424d1932c74d6cbcf6985494295909~tplv-tt-origin-web:gif.jpeg?_iz=58558&from=article.pc_detail&lk3s=953192f4&x-expires=1742992895&x-signature=w8KBxpL6YPOoC1BfFK46keDljyo%3D'
  }
]