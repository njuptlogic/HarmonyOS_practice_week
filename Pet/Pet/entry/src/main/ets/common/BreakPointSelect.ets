
export class BreakPointSelect{
  breakpoint?:string;
  //1.外界传入breakpoint进来
  //2.通过breakpoint获取一个图片的地址出去
  constructor(breakpoint:string) {
    this.breakpoint = breakpoint;
  }

  //主页
  //新伙伴
  getHomeTopFontSize():number{
    if(this.breakpoint ==="md")return 20; //折叠屏
    else if(this.breakpoint === "lg") return 22; //平板
    else return 20; //普通手机
  }
  getHomeTopImgSize():number{
    if(this.breakpoint ==="md")return 30; //折叠屏
    else if(this.breakpoint === "lg") return 30; //平板
    else return 24; //普通手机
  }
  getHomeNewFriendsRowSpace():number{
    if(this.breakpoint ==="md")return 10; //折叠屏
    else if(this.breakpoint === "lg") return 10; //平板
    else return 20; //普通手机
	}
  getHomeNewFriendsImgWidthHeight():number{
    if(this.breakpoint ==="md")return 70; //折叠屏
    else if(this.breakpoint === "lg") return 70; //平板
    else return 55; //普通手机
  }
  getHomeNewFriendsRowHeight():number{
    if(this.breakpoint ==="md")return 70; //折叠屏
    else if(this.breakpoint === "lg") return 70; //平板
    else return 54; //普通手机
  }
  getHomeDogItemImgWidth():number{
    if(this.breakpoint ==="md")return 170; //折叠屏
    else if(this.breakpoint === "lg") return 200; //平板
    else return 130; //普通手机
  }
  getHomeDogItemImgHeight():number{
    if(this.breakpoint ==="md")return 180; //折叠屏
    else if(this.breakpoint === "lg") return 200; //平板
    else return 180; //普通手机
  }

  getHomeDogCardListLane():number{
    if(this.breakpoint ==="md")return 2; //折叠屏
    else if(this.breakpoint === "lg") return 3; //平板
    else return 1; //普通手机
  }
  getHomeDogCardListMarginLeft():number{
    if(this.breakpoint ==="md")return 42; //折叠屏
    else if(this.breakpoint === "lg") return 50; //平板
    else return 24; //普通手机
  }
  getHomeDogCardListMarginRight():number{
    if(this.breakpoint ==="md")return 24; //折叠屏
    else if(this.breakpoint === "lg") return 24; //平板
    else return 0; //普通手机
  }

  //聊天
  getChatPageMarginLeft():number{
   if(this.breakpoint === "lg")
     return 50;
   else if(this.breakpoint === "md")
     return 36;
   else
     return 1;
  }
  getChatPageImgSize():number{
    if(this.breakpoint ==="md")return 60; //折叠屏
    else if(this.breakpoint === "lg") return 80; //平板
    else return 54; //普通手机
  }
  //匹配
  getMatchesPageSwiperOFDogInfoHeight():number{
    if(this.breakpoint ==="md")return 500; //折叠屏
    else if(this.breakpoint === "lg") return 400; //平板
    else return 500; //普通手机
  }
  getMatchesPageSwiperOFDogInfoWidth():string{
    if(this.breakpoint ==="md")return "80%"; //折叠屏
    else if(this.breakpoint === "lg") return "60%"; //平板
    else return "100%"; //普通手机
  }
  getMatchesPageButtonSize():number{
    if(this.breakpoint ==="md")return 60; //折叠屏
    else if(this.breakpoint === "lg") return 70; //平板
    else return 50; //普通手机
  }
  getMatchesPageButtonImgSize():number{
    if(this.breakpoint ==="md")return 30; //折叠屏
    else if(this.breakpoint === "lg") return 40; //平板
    else return 20; //普通手机
  }
  getMatchedPageWith():string{
    if(this.breakpoint ==="md")return "70%"; //折叠屏
    else if(this.breakpoint === "lg") return "50%"; //平板
    else return "86%"; //普通手机
  }
  getMatchedPageImageSize():number{
    if(this.breakpoint ==="md")return 80; //折叠屏
    else if(this.breakpoint === "lg") return 100; //平板
    else return 60; //普通手机
  }
  getMatchedPageImageBoxHeight():number{
    if(this.breakpoint ==="md")return 50; //折叠屏
    else if(this.breakpoint === "lg") return 60; //平板
    else return 40; //普通手机
  }
  getMatchedPageMarginTop():number{
    if(this.breakpoint ==="md")return 30; //折叠屏
    else if(this.breakpoint === "lg") return 50; //平板
    else return 20; //普通手机
  }

  //个人
  getProfilePageDogImgWidth():number{
    if(this.breakpoint ==="md")return 3; //折叠屏
    else if(this.breakpoint === "lg") return 4; //平板
    else return 2; //普通手机
  }

  getProfilePageLanes():number{
    if(this.breakpoint ==="md")return 3; //折叠屏
    else if(this.breakpoint === "lg") return 4; //平板
    else return 2; //普通手机
  }
  getProfileTopBoxFontSize():number{
    if(this.breakpoint ==="md")return 20; //折叠屏
    else if(this.breakpoint === "lg") return 30; //平板
    else return 24; //普通手机
  }
  getProfileTopBoxFontTitleSize():number{
    if(this.breakpoint ==="md")return 20; //折叠屏
    else if(this.breakpoint === "lg") return 30; //平板
    else return 24; //普通手机
  }
  getProfileTopBoxFontContentSize():number{
    if(this.breakpoint ==="md")return 18; //折叠屏
    else if(this.breakpoint === "lg") return 20; //平板
    else return 15; //普通手机
  }
  getProfileTopBoxHeight():string{
    if(this.breakpoint ==="md")return "30%"; //折叠屏
    else if(this.breakpoint === "lg") return "35%"; //平板
    else return "35%"; //普通手机
  }
  getFriendShopPageWidth():string{
    if(this.breakpoint ==="md")return "80%"; //折叠屏
    else if(this.breakpoint === "lg") return "60%"; //平板
    else return "90%"; //普通手机
  }
  getFriendShopImgHeight():number{
    if(this.breakpoint ==="md")return 600; //折叠屏
    else if(this.breakpoint === "lg") return 600;//平板
    else return 320; //普通手机
  }
  getChatBottomBarWidth():number{
    if(this.breakpoint ==="md")return 400; //折叠屏
    else if(this.breakpoint === "lg") return 540;//平板
    else return 200; //普通手机
  }

  //Tab
  getTabBarFontSize():number{
    if(this.breakpoint ==="md")return 18; //折叠屏
    else if(this.breakpoint === "lg") return 20;//平板
    else return 15; //普通手机
  }
  getTabBarImgSize():number{
    if(this.breakpoint ==="md")return 25; //折叠屏
    else if(this.breakpoint === "lg") return 40;//平板
    else return 20; //普通手机
  }
}