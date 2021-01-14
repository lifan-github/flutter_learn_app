import 'package:flutter_learn_app/routes/tab_navigator.dart';
import 'package:flutter_learn_app/views/assets/details.dart';
import 'package:flutter_learn_app/views/home/child_page.dart';
import 'package:flutter_learn_app/views/home/details.dart';
import 'package:flutter_learn_app/views/home/father_child_page.dart';
import 'package:flutter_learn_app/views/home/flutter_localizations_page.dart';
import 'package:flutter_learn_app/views/home/gridView.dart';
import 'package:flutter_learn_app/views/home/iconfont_page.dart';
import 'package:flutter_learn_app/views/home/listTile.dart';
import 'package:flutter_learn_app/views/home/listview.dart';
import 'package:flutter_learn_app/views/home/listview_load_more_page.dart';
import 'package:flutter_learn_app/views/home/local_cache_page.dart';
import 'package:flutter_learn_app/views/home/network.dart';
import 'package:flutter_learn_app/views/user/details.dart';

class RoutesConfig {
  static final routes = {
    "/": (context) => Tabnavigator(),
    "home_details": (context) => HomeDetails(),
    "network_page": (context) => NetworkPage(),
    "listview_page": (context) => ListViewPage(),
    "gridview_page": (context) => GridViewPage(),
    "assets_details": (context) => AssetsDetails(),
    "user_details": (context) => UserDetails(),
    "local_cache_page": (context) => LocalCachePage(),
    "listview_load_more_page": (context) => ListViewLoadMorePage(),
    "listtile_page": (context) => ListTilePage(),
    "iconfont_page": (context) => IconFontPage(),
    "loaclizations_page": (context) => LocalizationPage(),
    "father_child_page": (context) => FatherChildPage(),
    "child_page": (context) => ChildPage(),
  };
}