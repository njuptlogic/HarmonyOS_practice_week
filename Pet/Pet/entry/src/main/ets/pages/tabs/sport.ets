@Preview
@Component
export default struct Sport {
  @State format: string = 'mm:ss'
  @State kilometers: number = 0
  @State duration: number = 0 // 添加时长状态
  @State heartRate: number = 90 // 添加心率状态
  @State calories: number = 0 // 添加千卡状态
  textTimerController: TextTimerController = new TextTimerController()
  intervalId: number = null!

  aboutToAppear() {
    this.textTimerController.start();
    this.intervalId = setInterval(() => {
      this.kilometers += 0.02; // 每秒增加0.02公里
      this.duration += 1; // 每秒增加1秒时长
      this.calories += 0.3; // 每秒增加0.3千卡
      this.heartRate = this.getRandomHeartRate(); // 更新心率
      this.updateKilometers();
      this.updateDuration();
      this.updateCalories();
    }, 1000);
  }

  aboutToDisappear() {
    if (this.intervalId) {
      clearInterval(this.intervalId);
    }
  }

  updateKilometers() {
    this.kilometers = parseFloat(this.kilometers.toFixed(2)); // 确保只保留两位小数
  }

  updateDuration() {
    // 更新时长的格式为 mm:ss
    let minutes = Math.floor(this.duration / 60);
    let seconds = this.duration % 60;
    this.format = `${String(minutes).padStart(2, '0')}:${String(seconds).padStart(2, '0')}`;
  }

  updateCalories() {
    this.calories = parseFloat(this.calories.toFixed(1)); // 确保只保留一位小数
  }

  getRandomHeartRate() {
    return Math.floor(Math.random() * (180 - 90 + 1)) + 90;
  }

  build() {
    Column() {
      Row() {
        Image($r('app.media.ic_avatar')).width(30).height(30)
        Text('运动实况').fontSize(16).fontColor(Color.Black).margin({
          left: 10
        })
      }
      .borderRadius(25)
      .backgroundColor(Color.White)
      .justifyContent(FlexAlign.Start)
      .alignItems(VerticalAlign.Center)
      .padding({
        left: 20,
        top: 10,
        bottom: 10,
        right: 20
      })
      .margin({
        top: 20,
        left: 20
      })

      Column() {
        Row() {
          Image($r('app.media.ic_sport'))
            .width(60)
            .height(60)
            .objectFit(ImageFit.Cover)
            .borderRadius(5)
            .margin({
              left: 20
            })
          Column() {
            Text('2024 户外轻松跑专属跑步内容').fontSize(16).fontColor(Color.White)
            Text('步频 150 剩余 998 米').fontSize(16).fontColor('#00FF00')
              .margin({
                top: 5
              })
          }.alignItems(HorizontalAlign.Start)
          .justifyContent(FlexAlign.Start)
          .margin({
            left: 10
          })
        }
        .width('90%')
        .height('15%')
        .borderRadius(5)
        .backgroundColor('#3C3644')
        .margin({
          top: 30
        })
        .justifyContent(FlexAlign.Start)
        .alignItems(VerticalAlign.Center)

        Row() {
          Text(this.kilometers.toFixed(2)).fontColor(Color.White).fontWeight(FontWeight.Bold).fontSize(70)
          Text('公里').fontColor(Color.White).fontSize(25).margin({
            left: 10,
            top: 20
          })
        }.alignItems(VerticalAlign.Center)
        .justifyContent(FlexAlign.Start)
        .margin({
          left: 50,
          top: 50
        })
        .width('100%')

        Row() {
          Column() {
            Text(this.format).fontColor(Color.White).fontSize(35)
            Text('总时长').fontColor(Color.White).fontSize(16)
          }.height('100%')
          .layoutWeight(1)
          .alignItems(HorizontalAlign.Start)

          Column() {
            Text('1\'23\'\'').fontColor(Color.White).fontSize(35)
            Text('实时配速').fontColor(Color.White).fontSize(16)
          }.height('100%')
          .layoutWeight(1)
          .alignItems(HorizontalAlign.Start)

        }.width('100%')
        .height('10%')
        .alignItems(VerticalAlign.Center)
        .justifyContent(FlexAlign.Start)
        .padding({
          left: 30
        })
        .margin({
          top: 50
        })

        Row() {
          Column() {
            Text(this.calories.toFixed(1)).fontColor(Color.White).fontSize(35)
            Text('千卡').fontColor(Color.White).fontSize(16)
          }.height('100%')
          .layoutWeight(1)
          .alignItems(HorizontalAlign.Start)

          Column() {
            Text(this.heartRate.toString()).fontColor(Color.White).fontSize(35)
            Text('实时心率').fontColor(Color.White).fontSize(16)
          }.height('100%')
          .layoutWeight(1)
          .alignItems(HorizontalAlign.Start)

        }.width('100%')
        .height('10%')
        .alignItems(VerticalAlign.Center)
        .justifyContent(FlexAlign.Start)
        .padding({
          left: 30
        })
        .margin({
          top: 50
        })

      }
      .backgroundColor('#46404C')
      .width('100%')
      .height('100%')
      .margin({
        top: 20
      })
      .borderRadius({
        topLeft: 20,
        topRight: 20
      })
    }.width('100%')
    .height('100%')
    .backgroundColor('#f6f6f6')
    .alignItems(HorizontalAlign.Start)
  }
}
