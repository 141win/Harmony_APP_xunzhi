export interface NavIconType{
  name:string
  icon:Resource
  selectedIcon:Resource
}

// 底部导航栏数据

export const navIcon:Array<NavIconType> = [
  {
    icon:$r('app.media.news'),
    selectedIcon:$r('app.media.news_active'),
    name:'新闻'
  },
  {
    icon:$r('app.media.popular'),
    selectedIcon:$r('app.media.popular'),
    name:'关注'
  },
  {
    icon:$r('app.media.mine'),
    selectedIcon:$r('app.media.mine_active'),
    name:'我的'
  }
]