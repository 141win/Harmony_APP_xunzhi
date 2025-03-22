export interface NavIconType{
  name:string
  icon:Resource
  selectedIcon:Resource
}

// 底部导航栏数据

export const navIcon:Array<NavIconType> = [
  {
    icon:$rawfile('news.svg'),
    selectedIcon:$rawfile('news_active.svg'),
    name:'新闻'
  },
  {
    icon:$rawfile('popular.svg'),
    selectedIcon:$rawfile('popular_active.svg'),
    name:'关注'
  },
  {
    icon:$rawfile('mine.svg'),
    selectedIcon:$rawfile('mine_active.svg'),
    name:'我的'
  }
]