
import 'package:fluro/fluro.dart';
import 'route_handles.dart';

class Routes {
  static String pageMain = "/";
  static String netWorkPage = "/network_page";
  static String fatherChildPage = "/father_child_page";
  static String localCachePage = "/local_cache_page";
  static String listviewPage = "/listview_page";
  static String gridviewPage = "/gridview_page";
  static String listviewLoadMorePage = "/listview_load_more_page";
  static String listtilePage = "/listtile_page";
  static String iconfontPage = "/iconfont_page";
  static String loaclizationsPage = "/loaclizations_page";

  static void configureRoutes(FluroRouter router) {
    // tab 主路由
    router.define(pageMain, handler: mainHandler);
    // 404 
    router.notFoundHandler = emptyHandler;

    /// ============================ home界面及子路由
    // 网络请求路由
    router.define(netWorkPage, handler: netWorkPageHandler);
    // 父子组件之间传值
    router.define(fatherChildPage, handler: fatherChildPageHandler);
    // 缓存设置获取
    router.define(localCachePage, handler: localCachePageHandler);
    // 列表组件
    router.define(listviewPage, handler: listviewPageHandler);
    // 网格列表组件
    router.define(gridviewPage, handler: gridviewPageHandler);
    // 翻页加载
    router.define(listviewLoadMorePage, handler: listviewLoadMorePageHandler);
    // list组件卡片
    router.define(listtilePage, handler: listtilePageHandler);
    // iconfont使用
    router.define(iconfontPage, handler: iconfontPageHandler);
    // 国际化语言
    router.define(loaclizationsPage, handler: loaclizationsPageHandler);
  }
}