import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn_app/routes/tab_navigator.dart';
import 'package:flutter_learn_app/views/home/father_child_page.dart';
import 'package:flutter_learn_app/views/home/gridView.dart';
import 'package:flutter_learn_app/views/home/iconfont_page.dart';
import 'package:flutter_learn_app/views/home/listTile.dart';
import 'package:flutter_learn_app/views/home/listview.dart';
import 'package:flutter_learn_app/views/home/listview_load_more_page.dart';
import 'package:flutter_learn_app/views/home/local_cache_page.dart';
import 'package:flutter_learn_app/views/home/network.dart';
import 'package:flutter_learn_app/views/noRoute/no_route.dart';

// main界面
var mainHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return Tabnavigator();
});

//空页面
var emptyHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return NoRoute();
});

///
/// === 首页路由 ===
///

// 网络请求
var netWorkPageHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return NetworkPage();
});

// 父子组件之间传值
var fatherChildPageHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return FatherChildPage();
});

// 缓存设置获取
var localCachePageHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return LocalCachePage();
});

// 基础列表
var listviewPageHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return ListViewPage();
});

// 列表
var gridviewPageHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return GridViewPage();
});

// 列表翻页加载
var listviewLoadMorePageHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return ListViewLoadMorePage();
});

// list组件卡片
var listtilePageHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return ListTilePage();
});

// iconfont使用
var iconfontPageHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return IconFontPage();
});

// 国际化语言
var loaclizationsPageHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return IconFontPage();
});