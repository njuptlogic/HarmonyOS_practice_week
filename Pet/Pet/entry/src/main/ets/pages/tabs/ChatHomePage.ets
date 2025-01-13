// import { ChatBottomBar } from '../../common/component/ChatBottomBar';
// import { ChatHomeTop } from '../../common/component/ChatHomeTop'

@Entry
@Component
struct ChatHomePage {
  //其他聊天框组件
  @Builder
  ChatBoxOther(text:string){
    Text(text)
      .fontColor($r("app.color.font"))
      .margin({left:50,top:10})
  }

  //我的聊天框组件
  @Builder
  ChatBoxMine(text:string){
    Text(text)
      .fontColor($r("app.color.font"))
      .textAlign(TextAlign.End)
      .margin({right:50,top:10})
  }
  //接收屏幕大小变化的数据
  @State currentBreakPoint:string = "sm";

  //当前消息框需要发送的消息
  @State currentMessage:string = "";
  build() {
    GridRow({
      breakpoints: {
        value: ["320vp", "520vp", "840vp"]
      }
    }){
      GridCol({
        span:{
          xs:12,//手机
          sm:12,//手机
          md:12,//折叠屏
          lg:12//平板
        }
      }){
        Column(){
          //顶部固定栏目
          // ChatHomeTop({dogName:"luppy",userName:"小男孩",dogAvatar:$r("app.media.dog_5")}).margin({top:0})
          //聊天记录
          Scroll(){
            List(){
              //对方
              ListItem(){
                Column(){
                  //头像 + ID
                  Row({space:20}){
                    Image($r('app.media.dog_5'))
                      .width(40)
                      .height(40)
                      .borderRadius(50)
                    Text("luppy")
                      .fontColor("#ffa49898")
                      .fontSize(18)
                      .fontWeight(400 )
                  }.width("100%")
                  .justifyContent(FlexAlign.Start)
                  //消息内容
                  this.ChatBoxOther("你好！Loki")
                  this.ChatBoxOther("今天出来遛弯吗？帮我带一口狗粮！")
                }.padding(20)
                .alignItems(HorizontalAlign.Start)
              }
              //我的
              ListItem(){
                Column(){
                  //头像 + ID
                  Row({space:20}){
                    Text("Loki")
                      .fontColor("#ffa49898")
                      .fontSize(18)
                      .fontWeight(400 )

                    Image($r('app.media.dog_1'))
                      .width(40)
                      .height(40)
                      .borderRadius(50)
                  }.width("100%")
                  .justifyContent(FlexAlign.End)
                  //消息内容
                  this.ChatBoxMine("你好！luppy")
                  this.ChatBoxMine("好滴！")
                }.padding(20)
                .alignItems(HorizontalAlign.End)
              }
            }.width("100%")
            .lanes(1)
            .scrollBar(BarState.Off)
          }.width("100%")
          .scrollBar(BarState.Off)

          //底部Bar
          // ChatBottomBar({currentMessage:this.currentMessage,currentBreakPoint: this.currentBreakPoint})
        }
        .width("100%")
        .height("100%")
      }
    }
    .width("100%")
    .height("100%")
    .onBreakpointChange((breakpoint:string) =>{
      this.currentBreakPoint = breakpoint;
      console.log(this.currentBreakPoint)
    })
   .backgroundColor('#6ec4d5')
  }
}