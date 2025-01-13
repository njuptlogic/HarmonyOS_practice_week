import { StorageUtils } from '../../utils/StorageUtils';
import showToast from '../../utils/ToastUtils';
import Prompt from '@system.prompt';
import router from '@ohos.router';
import { addUser } from '../../viewmodel/LoginViewModel';
import UserInfo from '../../viewmodel/UserInfo';
import HealthInfo from '../../viewmodel/HealthInfo';
import { addHealth } from '../../viewmodel/HealthViewModel';
@Entry
@Component
struct Register {
  @State username: string = '';
  @State password: string = '';
  @State userInfo: UserInfo = new UserInfo(0,0,'','')
  @State healthInfo: HealthInfo = new HealthInfo(0,0, '110', '140/110', '10小时42分钟11秒', '193', '70', '50')


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
      }).type(InputType.Normal)
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


      Button('注册')
        .width('80%')
        .height(40)
        .margin({
          top: 40
        })
        .fontColor(Color.White)
        .backgroundColor('#3d7fff')
        .onClick(() => {
          if (this.username == '' || this.password == '' ) {
            showToast('请输入完整的注册信息！')
          } else {
            this.addUser();

          }
        })
    }.width('100%')
    .height('100%')
    .backgroundColor('#6ec4d5')

  }

  addUser(){
    this.userInfo.createTime = new Date().getTime()
    this.userInfo.username = this.username;
    this.userInfo.password = this.password;

    this.healthInfo.createTime = new Date().getTime();
    addHealth(this.healthInfo).then(() => {
      addUser(this.userInfo).then(() => {
        Prompt.showToast({
          message: '注册成功！',
          duration: 2000
        })
        router.back()
      })
    })
  }
}