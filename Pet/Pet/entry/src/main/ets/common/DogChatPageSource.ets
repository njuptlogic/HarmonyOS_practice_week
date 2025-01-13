export   class  DogChatInfo{
  DogName?:string;
  DogImg?:Resource;
  UserName?:string;
  content?:string;
  time?:string;
}


export  class  DogChatSource implements IDataSource {
  DogArray:DogChatInfo[]=[
    { DogName:"球球",
      DogImg: $r("app.media.dog_3"),
      UserName:"Admin",
      content:"你好啊",
      time:"10:24AM"},

    { DogName:"皮皮",
      DogImg: $r("app.media.dog_4"),
      UserName:"Admin",
      content:"你好!",
      time:"12:10AM"},

    { DogName:"洛基",
      DogImg: $r("app.media.dog_2"),
      UserName:"Admin",
      content:"很高兴认识你！",
      time:"10:09AM"},

    { DogName:"米奇",
      DogImg: $r("app.media.dog_1"),
      UserName:"小女孩",
      content:"天气不错",
      time:"11:24AM"},

    { DogName:"软球",
      DogImg: $r("app.media.dog_b_2"),
      UserName:"小花",
      content:"你好啊",
      time:"11:14AM"},

    { DogName:"罗斯",
      DogImg: $r("app.media.notice_dog1"),
      UserName:"默认用户1",
      content:"你好啊",
      time:"19:44PM"},
    { DogName:"杰克",
      DogImg: $r("app.media.notice_dog2"),
      UserName:"默认用户2",
      content:"你好啊",
      time:"18:33PM"},
    { DogName:"二蛋",
      DogImg: $r("app.media.notice_dog3"),
      UserName:"小花",
      content:"你好啊",
      time:"13:14PM"},
    { DogName:"大黄",
      DogImg: $r("app.media.notice_dog4"),
      UserName:"大话",
      content:"还不错！",
      time:"14:14PM"},
  ]
  totalCount(): number {
    return this.DogArray.length;
  }

  getData(index: number): DogChatInfo {
    return this.DogArray[index];
  }

  registerDataChangeListener(listener: DataChangeListener): void {

  }

  unregisterDataChangeListener(listener: DataChangeListener): void {

  }

}