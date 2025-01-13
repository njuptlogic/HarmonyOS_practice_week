import { StorageUtils } from '../../utils/StorageUtils';
import showToast from '../../utils/ToastUtils';
import Prompt from '@system.prompt';
import router from '@ohos.router';
import { addUser, updateUser } from '../../viewmodel/LoginViewModel';
import UserInfo from '../../viewmodel/UserInfo';
@Entry
@Component
struct Forget {
  @State username: string = '';
  @State password: string = '';
  @State userInfo: UserInfo = new UserInfo(0,0, '','');

  build() {
    Column(){
      Image($r('app.media.ic_logo'))
        .width(150)
        .height(150)
        .margin({
          top: 50
        })

      Text('健康中心')
        .fontSize(28)
        .fontWeight(FontWeight.Bold)
        .margin({
          top: 40
        })
      TextInput({
        placeholder: '请输入用户名'
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
          this.username = value;
        })

      TextInput({
        placeholder: '请输入新密码'
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


      Button('修改密码')
        .width('80%')
        .height(40)
        .margin({
          top: 40
        })
        .fontColor(Color.White)
        .backgroundColor('#fff3d3a4')
        .onClick(() => {
          if (this.password == '' ) {
            showToast('请输入完整的注册信息！')
          } else {
            this.addUser();

          }
        })
    }.width('100%')
    .height('100%')

  }

  addUser(){
    this.userInfo.createTime = new Date().getTime()
    this.userInfo.username = this.username
    this.userInfo.password = this.password;
    updateUser(this.userInfo).then(() => {
      Prompt.showToast({
        message: '修改密码成功！',
        duration: 2000
      })

      router.back()
    })
  }
}