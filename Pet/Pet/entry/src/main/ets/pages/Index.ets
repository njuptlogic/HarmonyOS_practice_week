import router from '@ohos.router'
import showToast from '../utils/ToastUtils'
import { getLoginInfo } from '../viewmodel/LoginViewModel';
import UserInfo from '../viewmodel/UserInfo';
import Prompt from '@system.prompt';
@Entry
@Component
struct Index {
  @State username: string = '';
  @State password: string = '';
  @State userList: Array<UserInfo> = null!;

  build() {
    Column(){
      Image($r('app.media.ic_logo'))
        .width(150)
        .height(150)
        .margin({
          top: 50
        })

      Text('宠物中心')
        .fontSize(28)
        .fontWeight(FontWeight.Bold)
        .margin({
          top: 40
        })

      TextInput({
        placeholder:'请输入用户名'
      }).type(InputType.Normal)
        .width('80%')
        .height(55)
        .placeholderColor(Color.Black)
        .margin({
          top: 50
        })
        .backgroundColor('#ffffff')
        .border({
          width: {
            bottom :1
          }
        })
        .onChange((value: string) => {
          this.username = value;
        })

      TextInput({
        placeholder: '请输入密码'
      }).type(InputType.Password)
        .width('80%')
        .height(55)
        .placeholderColor(Color.Black)
        .margin({
          top: 10
        })
        .backgroundColor('#fffffff')
        .border({
          width: {
            bottom:1
          }
        })
        .onChange((value: string) => {
          this.password = value;
        })

      Button('登录')
        .width('80%')
        .height(40)
        .margin({
          top: 40
        })
        .fontColor(Color.White)
        .backgroundColor('#3d7fff')
        .onClick(() => {
          //TODO: 账号密码验证
          this.login();
        })

      Button('注册')
        .width('80%')
        .height(40)
        .margin({
          top:10
        })
        .fontColor(Color.White)
        .backgroundColor('#3d7fff')
        .onClick(() => {
          router.pushUrl({
            url: 'pages/account/register'
          })
        })

      Button('忘记密码')
        .width('80%')
        .height(40)
        .margin({
          top:10
        })
        .fontColor(Color.White)
        .backgroundColor('#3d7fff')
        .onClick(() => {
          router.pushUrl({
            url: 'pages/account/forget'
          })
        })

    }.height('100%')
    .width('100%')
    .backgroundColor('#6ec4d5')
  }

  login(){
    getLoginInfo(this.username).then((res: UserInfo[]) => {
      this.userList = res;
      if (this.userList?.length > 0) {
        if (this.password === this.userList[0].password) {
          Prompt.showToast({
            message: '登录成功！',
            duration: 2000
          })
          router.replaceUrl({
            url: 'pages/main/main'
          })
        }
      }
    })
  }
}