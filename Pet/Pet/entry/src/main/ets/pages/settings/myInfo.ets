import router from '@ohos.router'
@Entry
@Component
struct MyInfo {
  build() {
    Column(){
      Row(){
        Image($r('app.media.close')).width(40).height(40).onClick(() => {
          router.back();
        })
        Text('个人资料').fontColor(Color.Black).fontSize(22).textAlign(TextAlign.Center)
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

      Image($r('app.media.ic_avatar')).width(80).height(80)
        .margin({
          top: 50
        })

      Row(){
        Text('宠物中心账号').fontSize(20).fontColor(Color.Black).fontWeight(FontWeight.Regular)
        Text('ZZZ1234').fontSize(18).fontColor(Color.Gray).fontWeight(FontWeight.Regular)
      }.justifyContent(FlexAlign.SpaceBetween)
      .width('100%')
      .padding({
        left:30,
        right: 30
      })
      .margin({
        top: 80
      })

      Row(){
        Text('昵称').fontSize(20).fontColor(Color.Black).fontWeight(FontWeight.Regular)
        Text('铲屎官').fontSize(18).fontColor(Color.Gray).fontWeight(FontWeight.Regular)
      }.justifyContent(FlexAlign.SpaceBetween)
      .width('100%')
      .padding({
        left:30,
        right: 30
      })
      .margin({
        top: 30
      })

      Row(){
        Text('性别').fontSize(20).fontColor(Color.Black).fontWeight(FontWeight.Regular)
        Text('保密').fontSize(18).fontColor(Color.Gray).fontWeight(FontWeight.Regular)
      }.justifyContent(FlexAlign.SpaceBetween)
      .width('100%')
      .padding({
        left:30,
        right: 30
      })
      .margin({
        top: 30
      })

      Row(){
        Text('出生日期').fontSize(20).fontColor(Color.Black).fontWeight(FontWeight.Regular)
        Text('2000-12-25').fontSize(18).fontColor(Color.Gray).fontWeight(FontWeight.Regular)
      }.justifyContent(FlexAlign.SpaceBetween)
      .width('100%')
      .padding({
        left:30,
        right: 30
      })
      .margin({
        top: 30
      })
    }.height('100%')
    .width('100%')
    .backgroundColor('#6ec4d5')
  }
}