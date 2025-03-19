import { ScienceType } from '../models/ScienceData'
import { $get_sci } from '../utils/request'
import { JSON } from '@kit.ArkTS'
import Item from '../views/Item'

@Component
export default  struct SciencePage {
  @State prodList:Array<ScienceType> = []
  page = 2
  async aboutToAppear() {
    let list = await $get_sci<ScienceType>('/news/sc')
    console.log('页面即将显示',JSON.stringify(list))
    this.prodList = list
  }

  // 触底分页
  loadMore = async ()=>{
    let url = `/science?&page=${this.page}`
    let list = await $get_sci<ScienceType>(url)
    this.page++
    this.prodList = [
      ...this.prodList,  //原数据，拓展运算符
      ...list  //新数据
    ]
  }

  build() {
    Scroll(){
      Column(){
        Flex({
          wrap:FlexWrap.Wrap,
          justifyContent:FlexAlign.SpaceBetween
        }){
          //2. 用数据
          ForEach(this.prodList,(item:ScienceType)=>{
            Item({data:item})
          })
        }
        .padding(10)
      }
    }
    .scrollBarWidth(2)
    .onScrollEdge((side:Edge)=>{
      if(side==2){
        this.loadMore()
      }
    })
  }
}