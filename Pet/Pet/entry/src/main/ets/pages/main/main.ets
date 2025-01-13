
import Body from '../tabs/body';
import ChatPage from '../tabs/ChatPage';
import Home from '../tabs/home';
import Mine from '../tabs/mine';
import Sport from '../tabs/sport';
import { BreakPointSelect } from '../../common/BreakPointSelect';

// interface myTitle {
//   title:string
// };

@Entry
@Component


struct Main {
  //页面索引
  @State currentSelectedIndex:number = 0;
  //接收屏幕大小变化的数据
  @State currentBreakPoint:string = "sm";

  @Builder tabBuilder(title: string,index : number,Img: Resource,ImgDisable:Resource) {
    Column() {
      Image(this.currentSelectedIndex === index?Img:ImgDisable)
        .size(
          { width: new BreakPointSelect(this.currentBreakPoint).getTabBarImgSize(),
            height: new BreakPointSelect(this.currentBreakPoint).getTabBarImgSize() })
      Text(title)
        .fontSize(new BreakPointSelect(this.currentBreakPoint).getTabBarFontSize())
        .margin({top :8})
        .fontColor(this.currentSelectedIndex === index?$r("app.color.toolBarFontChosen"):$r("app.color.toolBarFontNoChosen"))
    }
    .width('100%')
    .height(50)
    .justifyContent(FlexAlign.Center)
  }

  private controller: TabsController = new TabsController();

  // @State items : myTitle[] = [
  //   { title: '首页' },
  //   { title: '健康' },
  //   { title: '运动' },
  //   {title: '我的'}
  // ];

  // let items = Array<{ title: string }> = [
  //   { title: '首页' },
  //   { title: '健康' },
  //   { title: '运动' },
  //   { title: '身体' },
  //   {title: '我的'}
  // ];
  @State showBookPage: Boolean = false;
  @State pageVisible: Boolean = false;

  onPageShow(){
    this.pageVisible = true;
  }

  onPageHide(){
    this.pageVisible = false;
  }

  build() {
    Row() {
      Tabs({ barPosition: BarPosition.End }) {
        TabContent(){
          Home()
        }.tabBar(this.tabBuilder('首页',0,$r("app.media.Home_1"),$r("app.media.Home_2")))
        TabContent(){
          ChatPage()
        }.tabBar(this.tabBuilder("聊天",1,$r("app.media.Chats_1"),$r("app.media.Chats_2")))
        // TabContent(){
        //   Sport()
        // }.tabBar(this.tabBuilder("匹配",2,$r("app.media.Matches_2"),$r("app.media.Matches_1")))
        TabContent(){
          Mine()
        }.tabBar(this.tabBuilder("个人",3,$r("app.media.Profile_2"),$r("app.media.Profile_1")))
        // { title: string }
        // item: string, index: number
        // ForEach(this.items, (item: myTitle, index) => {
        //   TabContent() {
        //     Column() {
        //       // Load different components based on index
        //       if (index === 0) {
        //         Home()
        //       } else if (index === 1) {
        //         Health()
        //       } else if (index === 2) {
        //         Sport()
        //       } else {
        //         Mine()
        //       }
        //     }
        //   }.tabBar(item.title);
        //   // }.tabBar(item.title);
        // });
      }.onChange((index : number)=>{
        this.currentSelectedIndex = index
      }).vertical(false)
      .barWidth('100%')
      .barHeight('70vp')
      .animationDuration(400)
    }.height('100%');
  }
}