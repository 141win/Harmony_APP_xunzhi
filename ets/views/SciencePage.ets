import { ScienceType } from '../models/ScienceData'
import { $get_sci } from '../utils/request'
import { JSON } from '@kit.ArkTS'
import Item from './Item'
import { ImageType } from '../models/image'

@Component
export default struct SciencePage {
  @State prodList: Array<ScienceType> = []
  @State searchKeyword: string = ''; // 搜索关键词
  @State filteredProdList: Array<ScienceType> = []; // 过滤后的新闻列表
  @State swiperData: Array<ImageType> = [
    {
      imageUrl: 'https://inews.gtimg.com/news_ls/OCgoBDcah9WaZNTi4vTlR_GIFllDrY9cy_vhuRIegh6dQAA_870492/0',
      title: '热点精选',
      subtitle: '从空调霸主到全屋健康生态，来自董小姐的真香警告',
      time: '腾讯科技 21小时前'
    },
    {
      imageUrl: 'https://inews.gtimg.com/news_ls/OTySa13mj3YeU-U1G6RDqe1ruzN-hfdU1vicgdhyGcPBEAA_870492/0',
      title: '热点精选',
      subtitle: '我国自研脑机接口植入人脑获得新突破',
      time: '11小时前'
    },
    {
      imageUrl: 'https://inews.gtimg.com/news_ls/O6Os5xupgzLJa5rtDgopJH2vsC0n5ygOaGVz7qJe7_wtYAA_870492/0',
      title: '热点精选',
      subtitle: '百度公开“开盒”事件调查详情：任何人无权触碰用户数据',
      time: '新京报 1小时前'
    },
    {
      imageUrl: 'https://inews.gtimg.com/om_ls/O1P472xJPMo7QaEb9vukvvB45qsFfq57YJsnWiSGF2vgUAA_870492/0',
      title: '热点精选',
      subtitle: '量子日”上，黄仁勋主动道歉：对量子计算时间表预测误判',
      time: '27分钟前'
    },
    {
      imageUrl:'https://inews.gtimg.com/om_ls/OGruwBDPVlWtUwbX5jhukt4sJ3mMgXHqjSuzqU6dIgHTsAA_870492/0',
      title:'热点精选',
      subtitle:'OpenAI新模型让Agent“开口说话”，但模仿谁开发者、用户说了都不算',
      time:'腾讯科技 28分钟前'
    }
  ];

  page = 2;

  async aboutToAppear() {
    let list = await $get_sci<ScienceType>('/news/sc');
    console.log('页面即将显示', JSON.stringify(list));
    this.prodList = list;
    this.filteredProdList = list; // 初始化时，过滤列表与原始列表一致
  }

  // 触底分页
  loadMore = async () => {
    let url = `/news/sc?&page=${this.page}`;
    let list = await $get_sci<ScienceType>(url);
    this.page++;
    this.prodList = [
      ...this.prodList,  // 原数据，拓展运算符
      ...list  // 新数据
    ];
    this.filterNews(); // 加载更多后，重新过滤新闻
  }

  // 过滤新闻
  filterNews = () => {
    if (this.searchKeyword) {
      //filter用于创建一个新数组，新数组中的元素是通过指定函数测试的所有元素
      this.filteredProdList = this.prodList.filter(item =>
      item.title.toLowerCase().includes(this.searchKeyword.toLowerCase())
      );
    }
    else
    {
      this.filteredProdList = this.prodList; // 如果没有关键词，显示所有新闻
    }
  }

  build() {
    Scroll() {
      Column() {
        //水稻，日常，地球，科技
        TextInput({ placeholder: '请输入关键词搜索' })
          .width('95%')
          .height(40)
          .padding(10)
          .onChange((value: string) => { //当用户在TextInput中执行输入修改删除时，onChange会被触发
            this.searchKeyword = value;
            this.filterNews(); // 输入关键词时，触发过滤
          });

        // 横向图像滑动 Swiper
        Swiper() {
          ForEach(this.swiperData, (item: ImageType) => {
            Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
              // 文字描述区域
              Column() {
                Text(item.title)
                  .fontSize(18)
                  .fontWeight(FontWeight.Bold)
                  .fontColor('red')
                  .alignSelf(ItemAlign.Start)
                  .margin({ bottom: 25 });

                Text(item.subtitle)
                  .fontSize(14)
                  .alignSelf(ItemAlign.Start)
                  .margin({ bottom: 20 });

                Text(item.time)
                  .fontSize(12)
                  .fontColor('#666')
                  .alignSelf(ItemAlign.Start);
              }
              .width('35%')
              .padding({ right: 10 });

              // 图片区域
              Image(item.imageUrl)
                .width('65%')
                .height(200)
                .objectFit(ImageFit.Cover);
            }
            .backgroundColor('#ffe2e1e1');
          });
        }
        .indicator(true) // 显示指示器
        .autoPlay(true)  // 自动播放
        .interval(3000)  // 自动播放间隔时间（3秒）
        .loop(true)      // 循环播放
        .duration(500)   // 切换动画时长
        .height(200)
        .padding(10);

        Flex({
          wrap: FlexWrap.Wrap,
          justifyContent: FlexAlign.SpaceBetween
        }) {
          // 使用过滤后的数据
          ForEach(this.filteredProdList, (item: ScienceType) => {
            Item({ data: item });
          });
        }
        .padding(10);
      }
    }
    .scrollBarWidth(2)
    .onScrollEdge((side: Edge) => {
      if (side == 2) {
        this.loadMore();
      }
    });
  }
}