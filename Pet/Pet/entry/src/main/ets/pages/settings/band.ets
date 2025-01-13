import router from '@ohos.router';
@Entry
@Component
struct Band {
  build() {
    Column(){
      Row(){
        Image($r('app.media.close')).width(40).height(40).onClick(() => {
          router.back();
        })
        Text('运动手环').fontColor(Color.Black).fontSize(22).textAlign(TextAlign.Center)
          .margin({
            right:50
          })
        Text('')
      }
      .width('100%')
      .height('5%')
      .alignItems(VerticalAlign.Center)
      .justifyContent(FlexAlign.SpaceBetween)
      .margin({
        left:15,
        top:15
      })

      Row(){
        Image($r('app.media.band1')).width(150).height(150)
        Column(){
          Text('模拟手环1').fontSize(20)
          Text('参数：ef:01:13:01').fontSize(14).margin({
            top: 10
          })
          Text('配对数：2').fontSize(14).margin({
            top: 10
          })
        }.margin({
          left: 20
        })
        .alignItems(HorizontalAlign.Start)
      }.backgroundColor(Color.White)
      .borderRadius(20)
      .width('90%')
      .margin({
        top: 50
      })
      .padding({left: 20, right: 20, top: 20, bottom: 20})

      Row(){
        Image($r('app.media.band2png')).width(150).height(150)
        Column(){
          Text('模拟手环2').fontSize(20)
          Text('参数：ef:01:13:01').fontSize(14).margin({
            top: 10
          })
          Text('配对数：2').fontSize(14).margin({
            top: 10
          })
        }.margin({
          left: 20
        })
        .alignItems(HorizontalAlign.Start)
      }.backgroundColor(Color.White)
      .borderRadius(20)
      .width('90%')
      .margin({
        top: 50
      })
      .padding({left: 20, right: 20, top: 20, bottom: 20})

      Stack({alignContent: Alignment.Bottom}){
        Button('连接').backgroundColor(Color.Red).fontColor(Color.White).padding({
          left: 50,
          right:50
        })
      }.height('20%')
    }.width('100%')
    .height('100%')
    .backgroundColor('#f6f6f6')
  }
}