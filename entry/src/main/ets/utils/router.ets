/**
 * 简易 router 封装
 */
@Observed
export class Router {
  navBarWidth: string = "100%"

  /**
   * 跳转
   * @param name
   * @param pageInfos
   */
  pushDestinationByName(name: string, pageInfos: NavPathStack) {
    pageInfos.pushDestinationByName(name, null)
    this.calcNavBarWidth(pageInfos)
  }

  backPress(pageInfos: NavPathStack) {
    let popR: NavPathInfo | undefined = pageInfos.pop()
    this.calcNavBarWidth(pageInfos)
    return popR
  }

  calcNavBarWidth(pageInfos: NavPathStack) {
    if (pageInfos.getAllPathName().length == 0) {
      this.navBarWidth = "100%"
    } else {
      this.navBarWidth = "50%"
    }
    console.log("luvi pageInfos > " + JSON.stringify(pageInfos))
  }
}

export const MyRouter = new Router()