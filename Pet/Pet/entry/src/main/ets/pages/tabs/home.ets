
import { ItemType } from '../../models/types';
import { font } from '@kit.ArkUI';
@Preview
@Component

export default struct Home {
  @State swiperData:Array<Resource> = [
  $r("app.media.keep1"),
  $r("app.media.keep2"),
  $r("app.media.keep3")
  ]


  aboutToAppear() {
    // 注册黑色字体
    font.registerFont({
      familyName: 'myFont', // 注册的字体名称
      familySrc: '../../font/01.ttf' // font文件夹与pages目录同级
    })
  }

  @State message: string = '列表组件'

  @State listsData:Array<ItemType> =[
    { title:'糖糖',
      age:'1年3个月',
      img:$r('app.media.pet01')
    },
    {
      title:'梦露',
      age:'1年6个月',
      img:$r('app.media.pet02')
    },
    {
      title:'毛毛',
      age:'2年3个月',
      img:$r('app.media.pet03')
    },
    {
      title:'可乐',
      age:'8个月',
      img:$r('app.media.pet04')
    },]

  build() {
    Scroll(){
      Column(){
        Column() {
          Text('我的宠物')
            .fontSize('20fp')
            .fontWeight(FontWeight.Medium)
            .alignSelf(ItemAlign.Start)
            // .margin({bottom: 10})
          //列表
          List({space:12}){
            ForEach(this.listsData,(item:ItemType,index:number)=>{
              ListItem(){
                if(index == this.listsData.length-1){
                  Row(){
                    Stack(){
                      Image(item.img)
                        // .objectFit(ImageFit.Cover)
                        // .aspectRatio(1)
                        .borderRadius(30)
                        .height(240)
                        .width('100%')

                      Text(item.title).fontSize(15).position({x:10,y:240}).fontFamily('myFont') // 使用黑色字体
                      Text("年龄："+item.age).fontSize(15).position({x:10,y:260}).fontFamily('myFont') // 使用黑色字体
                    }
                  }
                  .height(320)
                  .backgroundColor('#6ec4d5')
                }else{
                  Row(){
                    Stack(){
                      Image(item.img)
                        .objectFit(ImageFit.Cover)
                        // .aspectRatio(1)
                        .borderRadius(30)
                        .height(260)
                        .width('100%')

                      Text(item.title).fontSize(15).position({x:10,y:260}).fontFamily('myFont') // 使用黑色字体
                      Text("年龄："+item.age).fontSize(15).position({x:10,y:280}).fontFamily('myFont') // 使用黑色字体
                    }
                  }
                  .height(320)
                  .backgroundColor('#6ec4d5')
                }


              }
              // .margin({left:'5vp',right:'5vp'})
            })
          }
          // .width('95%')

          //.margin('10vp')
          // .lanes(2)  //排列个数
        }
      }
    }
    .backgroundColor('#6ec4d5')
    .height('100%')
  }


}