
import router from '@ohos.router'
@Preview
@Component
export default struct Mine {

  build() {
    Column() {
      Row(){
        Column(){
          Text('用户，您好')
            .fontSize(22)
            .fontColor(Color.White)
            .fontWeight(FontWeight.Bold)
            .margin({
              left:20
            })
          Text('与宠物之家相遇的第33天')
            .fontSize(12)
            .fontColor(Color.White)
            .margin({
              top:5,
              left:20
            })
        }
        .alignItems(HorizontalAlign.Start)
        Image($r('app.media.ic_avatar'))
          .width(50)
          .height(50)
          .margin({
            right:20
          })
      }.justifyContent(FlexAlign.SpaceBetween)
      .margin({
        top:20
      })
      .width('100%')
      .height('10%')


      Column(){

        Row(){
          Row(){
            Image($r('app.media.ic_info')).width(25).height(25).objectFit(ImageFit.Fill)
            Text('个人信息').fontColor(Color.White).margin({
              left:10
            })
          }

          .margin({
            left: 20,
            top:30
          })
          Image($r('app.media.ic_right')).width(25).height(25).objectFit(ImageFit.Fill).margin({
            right: 20,
            top: 30
          })
        }.width('100%').justifyContent(FlexAlign.SpaceBetween)
        .onClick(() => {
          router.pushUrl({
            url: 'pages/settings/myInfo'
          })
        })
        Row(){
          Row(){
            Image($r('app.media.ic_help')).width(25).height(25).objectFit(ImageFit.Fill)
            Text('我要帮助').fontColor(Color.White).margin({
              left:10
            })
          }
          .margin({
            left: 20,
            top:30
          })
          Image($r('app.media.ic_right')).width(25).height(25).objectFit(ImageFit.Fill).margin({
            right: 20,
            top: 30
          })
        }.width('100%').justifyContent(FlexAlign.SpaceBetween)
        .onClick(() => {
          router.pushUrl({
            url: 'pages/settings/help'
          })
        })
        Row(){
          Row(){
            Image($r('app.media.ic_about')).width(25).height(25).objectFit(ImageFit.Fill)
            Text('关于我们').fontColor(Color.White).margin({
              left:10
            })
          }
          .margin({
            left: 20,
            top:30
          })
          Image($r('app.media.ic_right')).width(25).height(25).objectFit(ImageFit.Fill).margin({
            right: 20,
            top: 30
          })
        }.width('100%').justifyContent(FlexAlign.SpaceBetween)
        .onClick(() => {
          router.pushUrl({
            url: 'pages/settings/about'
          })
        })
      }.backgroundColor('#1F1F1F')
      .width('95%')
      .height('32%')
      .margin({
        left:20,
        right:20,
        top:20
      })
      .borderRadius(15)
    }.width('100%')
    .height('100%')
    .backgroundColor('#6ec4d5')
    // .backgroundImage($r('app.media.background'))
    .backgroundImageSize(ImageSize.Cover)
  }


}