
import 'package:fluro/fluro.dart';
import 'route_handles.dart';

class Routes {
  static String pageA = "/";
  static String pageB = "/b";
  static String pageC = "/c";

  static void configureRoutes(FluroRouter router) {
    router.define(pageA, handler: aHandler);
    router.define(pageB, handler: bHandler);
    router.define(pageC, handler: cHandler);
    router.notFoundHandler =emptyHandler;
  }
}