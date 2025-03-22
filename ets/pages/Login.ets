import { Account, UserDataType} from '../models/user'
import { $post } from '../utils/request'
import { promptAction, router } from '@kit.ArkUI'
import { preferences } from '@kit.ArkData'

@Entry
@Component
struct Login {
  @State username:string = ''
  @State password:string = ''
  handleLogin = async ()=>{
    // 登录请求
    let data = await $post<Account,UserDataType>('/users/login',{
      userName:this.username,
      password:this.password
    })
    //轻提示
    promptAction.showToast({
      message:data.msg
    })
    console.log(JSON.stringify(data))
    //将登录成功后的数据进行本地缓存
    if(data.code==1){
      this.saveUserInfo(data.data)
      router.pushUrl({
        url:'pages/MainPage'
      })
    }
  }

  //存储用户数据
  saveUserInfo = async (data:UserDataType)=>{
    let context = getContext() //获取应用的上下文对象
    let prefer = await preferences.getPreferences(context,'token_info') //创建首选项实例
    prefer.put('token',data.token) //本地存储token
    prefer.put('_id',data.userInfo._id) //本地存储token
    prefer.put('username',data.userInfo.userName) //本地存储token
    prefer.flush()  //执行写入
  }
  build() {
    Column(){
      Image($rawfile('logo.svg'))
        .height(140)
        .margin({top:100,bottom:60})
      Flex({alignItems:ItemAlign.Center}){
        Image($rawfile('account.svg'))
          .height(35)
          .margin({left:20})
        TextInput({text:this.username})
          .backgroundColor('#F7F8F8')
          .onChange((value:string)=>{
            this.username = value
          })
      }
      .height(60)
      .width('80%')
      .backgroundColor('#F7F8F8')
      .borderRadius(20)

      Flex({alignItems:ItemAlign.Center}){
        Image($rawfile('password.svg'))
          .height(35)
          .margin({left:20})
        TextInput({text:this.password})
          .backgroundColor('#F7F8F8')
          .type(InputType.Password)
          .onChange((value:string)=>{
            this.password = value
          })
      }
      .height(60)
      .width('80%')
      .backgroundColor('#F7F8F8')
      .borderRadius(20)
      .margin({top:20})

      Button(){
        Row(){
          Text('登录')
            .fontColor('#fff')
            .margin({left:10})
        }
      }
      .width('80%')
      .padding(16)
      .margin({top:40})
      .linearGradient({
        angle:90,
        colors:[['#9AC4FE',0],['#92A5FD',1]]
      })
      .onClick(this.handleLogin)

      //注册账号
      Button() {
        Row() {
          Text('注册账号')
            .fontColor('#fff')
            .margin({ left: 10 });
        }
      }
      .width('80%')
      .padding(16)
      .margin({ top: 20 })
      .linearGradient({
        angle: 90,
        colors: [['#9AC4FE', 0], ['#92A5FD', 1]]
      })
      .onClick(() => {
        router.pushUrl({
          url: 'pages/RegisterPage'
        });
      });
    }
    .width('100%')
    .alignItems(HorizontalAlign.Center)
  }
}