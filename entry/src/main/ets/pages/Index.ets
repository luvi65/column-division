import { MyRouter, Router } from '../utils/router'

@Entry
@Component
struct Index {
  // 创建路由栈
  pageInfos: NavPathStack = new NavPathStack()
  // 自定义 router
  @State MyRouter: Router = MyRouter
  // 数据
  dataList: string[] = ["当前中国经济热点问答","推动民政事业高质量发展","中国汽车极致安全巅峰挑战"]

  aboutToAppear(): void {
    LocalStorage.getShared().setOrCreate("NavPathStack", this.pageInfos)
  }

  build() {
    Navigation(this.pageInfos){
      Column() {
        Text("今日新闻")
          .fontWeight(FontWeight.Bold)

        Column(){
          ForEach(this.dataList, (item: string) => {
            Row(){
              Row()
                .width(70)
                .height(70)
                .backgroundColor("#ddd")
                .borderRadius(8)
                .margin({right: 10})
              Text(item)
            }.width("100%")
            .margin({top: 15})
            .onClick(() => {
              MyRouter.pushDestinationByName("NewsPage", this.pageInfos)
            })
          })

          Row()
            .width("100%")
            .height(80)
            .borderRadius(8)
            .backgroundColor("#ddd")
            .margin({top: 15})
        }
        .margin({top: 20})
      }
      .padding({left: 15, right: 15})
      .height('100%')
      .width('100%')
    }
    .navBarWidth(this.MyRouter.navBarWidth)
    .animation({ duration: 300 })
    .hideToolBar(true)
    .hideTitleBar(true)
  }
}