import { router } from '@kit.ArkUI'
import { BusinessError } from '@kit.BasicServicesKit'
import { DogChatInfo, DogChatSource } from '../../common/DogChatPageSource';
import { BreakPointSelect } from '../../common/BreakPointSelect';

@Component
export default struct ChatPage {
  //接收屏幕大小变化的数据
  @State currentBreakPoint:string = "sm";

  @Builder
  ListRow(itemImg:Resource | undefined,dogName:string | undefined,userName:string | undefined,lastTime:string | undefined){
    Row(){
      Image(itemImg)
        .width(new BreakPointSelect(this.currentBreakPoint).getChatPageImgSize())
        .height(new BreakPointSelect(this.currentBreakPoint).getChatPageImgSize())
        .borderRadius(50)

      Column(){
        Row(){
          Text(dogName)
            .fontColor($r("app.color.font"))
            .fontSize(18)
            .fontWeight(500)
            .textAlign(TextAlign.Start)
            .width("70%")
          Text(lastTime)
            .fontColor($r("app.color.fontTitle"))
            .fontSize(12)
            .textAlign(TextAlign.End)
        }.width("100%")

        Text(userName)
          .fontColor($r("app.color.fontTitle"))
          .fontSize(12)
      }
      .alignItems(HorizontalAlign.Start)
      .margin({left:10})
    }
    .onClick(()=>{
      // 跳转到第二页
      router.pushUrl({ url: 'pages/tabs/ChatHomePage' }).then(() => {
        console.info('Succeeded in jumping to the second page.')

      }).catch((err: BusinessError) => {
        console.error(`Failed to jump to the second page. Code is ${err.code}, message is ${err.message}`)
      })
    })
  }
  @State arr: number[] = [0, 1, 2, 3, 4]
  @Builder itemEnd() {
    Row() {
      Button("删除").margin({ left:50 }).backgroundColor(Color.Red)
    }.padding("4vp").justifyContent(FlexAlign.SpaceEvenly)
  }
  build() {
    GridRow({
      breakpoints: {
        value: ["320vp", "520vp", "840vp"]
      }
    }) {
      GridCol({
        span: {
          xs: 12, //手机
          sm: 12, //手机
          md: 12, //折叠屏
          lg: 12//平板
        }
      }) {
        Column(){
          //顶部
          Text("聊天").fontColor($r("app.color.font")).fontWeight(800)
            .fontSize(30)
            .alignSelf(ItemAlign.Start)

          Scroll(){
            Column(){
              //第二行：搜索框
              Search({ placeholder: '搜索...' })
                .height(54)
                .searchIcon({color:Color.Gray,size:25})
                .backgroundColor('#6ec4d5')
                .placeholderColor($r("app.color.fontTitle"))
                .borderWidth(1)
                .borderColor($r("app.color.fontTitle"))
                .margin({top:18})
                .width("90%")

              //文本框
              Row(){
                Text("新伙伴").fontColor($r("app.color.font")).fontWeight(500)
                Text("更多").fontColor($r("app.color.font")).fontWeight(500)
              }.justifyContent(FlexAlign.SpaceBetween)
              .width("90%")
              .height(22)
              .margin({top:18})

              //头像
              // Row({space:23}){
              //   LazyForEach(new DogAvatar(),(Dog1:DogImageInfo)=> {
              //     DogAvatarComponent({Array:Dog1,isLive:true,currentBreakPoint: this.currentBreakPoint})
              //   })
              // }.justifyContent(FlexAlign.SpaceAround)
              // .width("90%")
              // .height(new BreakPointSelect(this.currentBreakPoint).getHomeNewFriendsRowHeight())
              // .margin({top:5})

              //伙伴列表
              List({space:15}){
                LazyForEach(new DogChatSource,(Dog:DogChatInfo,item:number)=>{
                  ListItem(){
                    this.ListRow(Dog.DogImg,Dog.DogName,Dog.UserName,Dog.time)
                  }.width("90%")
                  .margin({left:new BreakPointSelect(this.currentBreakPoint).getChatPageMarginLeft()})
                  //listitem删除按钮
                  .swipeAction({
                    end:{
                      builder: () => { this.itemEnd() },
                      onAction: () => {
                      animateTo({ duration: 1000 }, () => {
                        let index = this.arr.indexOf(item)
                        this.arr.splice(index, 1)
                        })
                      },
                      actionAreaDistance:200,
                    },
                  })


                })
              }.width("90%")
              .lanes(1)
              .scrollBar(BarState.Off)
              .margin({bottom:50,top:18})

            }.width("100%")
            .justifyContent(FlexAlign.Center)
            .alignItems(HorizontalAlign.Center)
          }.width("100%")
          .height("100%")
          .backgroundColor('#6ec4d5')
          .scrollBar(BarState.Off)
          .edgeEffect(EdgeEffect.Spring)
        }.width("100%")
        .alignItems(HorizontalAlign.Center)
      }
    }.width("100%")
    .height("100%")
    .onBreakpointChange((breakpoint:string) =>{
      this.currentBreakPoint = breakpoint;
      console.log(this.currentBreakPoint)
    })
    .backgroundColor('#6ec4d5')
  }
}