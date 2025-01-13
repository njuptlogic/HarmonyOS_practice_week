import HealthInfo from '../../viewmodel/HealthInfo';
import { getHealthInfo } from '../../viewmodel/HealthViewModel';
@Preview
@Component
export default struct Health {
  @State healthInfo: HealthInfo[] = null!;
  @State heartRateAlive: string = '--';
  @State heartRateMax: string = '--';
  @State heartRateQuite: string = '--';
  @State heartRateSour: string = '--';
  @State sleepTime: string = '--'
  @State bloodPressure: string = '--'

  aboutToAppear(){
    this.getHealthData()
  }

  getHealthData(){
    getHealthInfo().then((res: HealthInfo[]) => {
      this.healthInfo = res;
      if (this.healthInfo?.length > 0) {
        this.heartRateAlive = this.healthInfo[0].heartRateAlive;
        this.heartRateMax = this.healthInfo[0].heartRateMax;
        this.heartRateQuite = this.healthInfo[0].heartRateQuite;
        this.heartRateSour = this.healthInfo[0].heartRateSour;
        this.sleepTime = this.healthInfo[0].sleepTime;
        this.bloodPressure = this.healthInfo[0].bloodPressure;
      }
    })
  }


  build() {
    Column() {
      Text('健康')
        .fontSize(25)
        .fontColor(Color.Black)
        .fontWeight(FontWeight.Bold)
        .width('100%')
        .margin({
          left: 20,
          top: 20
        })

      //心率
      Column() {
        Row() {
          Image($r('app.media.ic_heart')).height(30).width(30).objectFit(ImageFit.Fill)
          Text('心率').fontColor('#DC143C').fontSize(18).fontWeight(FontWeight.Bold).margin({
            left: 5
          })
        }.justifyContent(FlexAlign.Start)
        .alignItems(VerticalAlign.Center)
        .width('100%')

        Text('实时心率').fontSize(14).margin({
          top: 15
        })
        Row() {
          Text(this.heartRateAlive).fontSize(16).fontWeight(FontWeight.Bold)
          Text('次/分').fontSize(14).margin({
            left: 5
          })
        }.justifyContent(FlexAlign.Start)
        .alignItems(VerticalAlign.Center)
        .margin({
          top: 15
        })
        .width('100%')

        Row() {
          Column() {
            Text('最大心率').fontSize(14)
            Row() {
              Text(this.heartRateMax).fontSize(16).fontWeight(FontWeight.Bold)
              Text('次/分').fontSize(14).margin({
                left: 5
              })
            }.justifyContent(FlexAlign.Start)
            .alignItems(VerticalAlign.Center)
            .width('100%')
            .margin({
              top:10
            })
          }
          .alignItems(HorizontalAlign.Start)
          .layoutWeight(1)

          Column() {
            Text('静息心率').fontSize(14)
            Row() {
              Text(this.heartRateQuite).fontSize(16).fontWeight(FontWeight.Bold)
              Text('次/分').fontSize(14).margin({
                left: 5
              })
            }.justifyContent(FlexAlign.Start)
            .alignItems(VerticalAlign.Center)
            .width('100%')
            .margin({
              top:10
            })
          }
          .alignItems(HorizontalAlign.Start)
          .layoutWeight(1)

          Column() {
            Text('乳酸阈心率').fontSize(14)
            Row() {
              Text(this.heartRateSour).fontSize(16).fontWeight(FontWeight.Bold)
              Text('次/分').fontSize(14).margin({
                left: 5
              })
            }.justifyContent(FlexAlign.Start)
            .alignItems(VerticalAlign.Center)
            .width('100%')
            .margin({
              top:10
            })
          }
          .alignItems(HorizontalAlign.Start)
          .layoutWeight(1)
        }.justifyContent(FlexAlign.Start)
        .alignItems(VerticalAlign.Center)
        .margin({
          top: 20
        })
        .width('100%')

      }
      .width('95%')
      .margin({
        left: 20,
        right: 20,
        top: 20
      })
      .backgroundColor(Color.White)
      .height(200)
      .borderRadius(15)
      .alignItems(HorizontalAlign.Start)
      .padding({
        left: 20,
        top: 20,
        right: 20
      })

      //睡眠
      Column() {
        Row() {
          Image($r('app.media.ic_sleep')).height(20).width(20).objectFit(ImageFit.Fill)
          Text('睡眠').fontColor('#9400D3').fontSize(18).fontWeight(FontWeight.Bold).margin({
            left: 5
          })
        }.justifyContent(FlexAlign.Start)
        .alignItems(VerticalAlign.Center)

        .width('100%')


        Row() {
          Text(this.sleepTime).fontSize(16).fontWeight(FontWeight.Bold)
          Text('分钟').fontSize(14).margin({
            left: 5
          })
        }.justifyContent(FlexAlign.Start)
        .alignItems(VerticalAlign.Center)
        .margin({
          top: 15
        })
        .width('100%')

      }
      .width('95%')
      .margin({
        left: 20,
        right: 20,
        top: 20
      })
      .backgroundColor(Color.White)
      .height(100)
      .borderRadius(15)
      .alignItems(HorizontalAlign.Start)
      .padding({
        left: 20,
        top: 20,
        right: 20
      })

      //血压
      Column() {
        Row() {
          Image($r('app.media.ic_pressure')).height(25).width(25).objectFit(ImageFit.Fill)
          Text('血压').fontColor('#008000').fontSize(18).fontWeight(FontWeight.Bold).margin({
            left: 5
          })
        }.justifyContent(FlexAlign.Start)
        .alignItems(VerticalAlign.Center)

        .width('100%')


        Row() {
          Text(this.bloodPressure).fontSize(16).fontWeight(FontWeight.Bold)
          Text('高压/低压').fontSize(14).margin({
            left: 5
          })
        }.justifyContent(FlexAlign.Start)
        .alignItems(VerticalAlign.Center)
        .margin({
          top: 15
        })
        .width('100%')

      }
      .width('95%')
      .margin({
        left: 20,
        right: 20,
        top: 20
      })
      .backgroundColor(Color.White)
      .height(100)
      .borderRadius(15)
      .alignItems(HorizontalAlign.Start)
      .padding({
        left: 20,
        top: 20,
        right: 20
      })

    }.width('100%')
    .height('100%')
    .backgroundColor('#f6f6f6')
  }


}