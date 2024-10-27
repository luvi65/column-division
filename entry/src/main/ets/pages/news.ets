import { MyRouter } from '../utils/router';

@Builder
export function NewsBuilder(name: string, param: Object) {
  News()
}

@Preview
@Entry
@Component
struct News {
  @State message: string = 'Hello World';

  build() {
    // 目标页面需要使用 NavDestination 组件进行包裹
    NavDestination() {
      Stack({ alignContent: Alignment.Bottom }) {
        Column() {
          Text("这是新闻的详情页面")
            .width("100%")
            .fontSize(20)
            .fontWeight(FontWeight.Bold)

          Row() {
            Row()
              .width(50)
              .height(50)
              .backgroundColor("#ddd")
              .borderRadius(99)
              .margin({ right: 10 })
            Column() {
              Text("新闻商").width("100%")
                .fontSize(15)
              Text("2024/10/25 18:09").width("100%")
                .fontSize(13)
                .fontColor("#ff515151")
                .margin({ top: 5 })
            }
          }.width("100%")
          .margin({ top: 20 })

          Text("文章内容内容文章内容内容文章内容内容文章内容内容文章内容内容文章内容内容文章内容内容文章内容内容文章内容内容文章内容内容文章内容内容文章内容内容文章内容内容文章内容内容文章内容内容文章内容内容文章内容内容文章内容内容")
            .width("100%")
            .fontSize(15)
            .margin({ top: 25 })

          Row()
            .width("100%")
            .height(150)
            .backgroundColor("#ddd")
            .borderRadius(8)
            .margin({ top: 20 })
        }
        .padding({ left: 15, right: 15 })
        .width("100%")
        .height("100%")

        Row() {
          Text("点赞")
          Text("收藏")
          Text("评论")
        }
        .width("100%")
        .justifyContent(FlexAlign.SpaceAround)
        .backgroundColor("#eee")
        .height(50)
      }
    }
    .onBackPressed(() => {
      let pageInfos = LocalStorage.getShared().get("NavPathStack") as NavPathStack
      MyRouter.backPress(pageInfos)
      return true
    })
  }
}