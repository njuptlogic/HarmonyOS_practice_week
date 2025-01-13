import router from '@ohos.router';
@Entry
@Component
struct About {
  build() {
    Column(){
      Row(){
        Image($r('app.media.close')).width(40).height(40).onClick(() => {
          router.back();
        })
        Text('关于我们').fontColor(Color.Black).fontSize(22).textAlign(TextAlign.Center)
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
      Image($r('app.media.ic_logo')).width(120).height(120).margin({
        top: 100
      })
      Text('宠物中心').fontSize(20).fontColor(Color.Black).fontWeight(FontWeight.Medium).margin({
        top: 40
      })
      Text('version 2.0.0').fontSize(16).fontColor(Color.Gray).margin({
        top: 20
      })
    }.width('100%')
    .height('100%')
    .backgroundColor('#6ec4d5')
  }
}