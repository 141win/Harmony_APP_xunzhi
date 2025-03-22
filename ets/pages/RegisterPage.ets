import { Account, UserDataType } from '../models/user';
import { $post } from '../utils/request';
import { promptAction, router } from '@kit.ArkUI';

@Entry
@Component
struct Register {
  @State username: string = ''; // 用户名
  @State password: string = ''; // 密码
  @State confirmPassword: string = ''; // 确认密码

  // 处理注册逻辑
  handleRegister = async () => {
    if (this.password !== this.confirmPassword) {
      promptAction.showToast({
        message: '两次输入的密码不一致'
      });
      return;
    }

    // 发送注册请求
    let data = await $post<Account, UserDataType>('/users/register', {
      userName: this.username,
      password: this.password
    });

    // 显示提示
    promptAction.showToast({
      message: data.msg
    });

    console.log(JSON.stringify(data));

    // 注册成功后跳转到登录页面
    if (data.code == 1) {
      router.pushUrl({
        url: 'pages/Login'
      });
    }
  };

  build() {
    Column() {
      Image($rawfile('logo.svg'))
        .height(140)
        .margin({ top: 100, bottom: 60 });

      // 用户名输入框
      Flex({ alignItems: ItemAlign.Center }) {
        Image($rawfile('account.svg'))
          .height(35)
          .margin({ left: 20 });
        TextInput({ text: this.username })
          .backgroundColor('#F7F8F8')
          .onChange((value: string) => {
            this.username = value;
          });
      }
      .height(60)
      .width('80%')
      .backgroundColor('#F7F8F8')
      .borderRadius(20);

      // 密码输入框
      Flex({ alignItems: ItemAlign.Center }) {
        Image($rawfile('password.svg'))
          .height(35)
          .margin({ left: 20 });
        TextInput({ text: this.password })
          .backgroundColor('#F7F8F8')
          .type(InputType.Password)
          .onChange((value: string) => {
            this.password = value;
          });
      }
      .height(60)
      .width('80%')
      .backgroundColor('#F7F8F8')
      .borderRadius(20)
      .margin({ top: 20 });

      // 确认密码输入框
      Flex({ alignItems: ItemAlign.Center }) {
        Image($rawfile('password.svg'))
          .height(35)
          .margin({ left: 20 });
        TextInput({ text: this.confirmPassword })
          .backgroundColor('#F7F8F8')
          .type(InputType.Password)
          .onChange((value: string) => {
            this.confirmPassword = value;
          });
      }
      .height(60)
      .width('80%')
      .backgroundColor('#F7F8F8')
      .borderRadius(20)
      .margin({ top: 20 });

      // 注册按钮
      Button() {
        Row() {
          Text('注册')
            .fontColor('#fff')
            .margin({ left: 10 });
        }
      }
      .width('80%')
      .padding(16)
      .margin({ top: 40 })
      .linearGradient({
        angle: 90,
        colors: [['#9AC4FE', 0], ['#92A5FD', 1]]
      })
      .onClick(this.handleRegister);

      // 返回登录页面
      Button() {
        Row() {
          Text('返回登录')
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
          url: 'pages/Login'
        });
      });
    }
    .width('100%')
    .alignItems(HorizontalAlign.Center);
  }
}