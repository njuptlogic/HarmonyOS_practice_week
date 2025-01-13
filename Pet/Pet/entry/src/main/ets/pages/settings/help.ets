import router from '@ohos.router';
@Entry
@Component
struct Help {
  build() {
    Column(){
      Row(){
        Image($r('app.media.close')).width(40).height(40).onClick(() => {
          router.back();
        })
        Text('反馈中心').fontColor(Color.Black).fontSize(22).textAlign(TextAlign.Center)
          .margin({
            right:50
          })
        Text('')
      }
      .width('100%')
      .alignItems(VerticalAlign.Center)
      .justifyContent(FlexAlign.SpaceBetween)
      .margin({
        left:15,
        top:15
      })

      TextArea({
        placeholder: '请输入反馈内容'
      }).width('90%')
      .height('40%')
      .borderRadius(15)
      .margin({
        top: 30
      })

      Stack({alignContent : Alignment.Bottom}) {
        Button('反馈').backgroundColor(Color.Red).fontColor(Color.White).padding({
          left: 50,
          right:50
        })

      }
      .height('40%')

    }.height('100%')
    .width('100%')
    .backgroundColor('#6ec4d5')
  }
}