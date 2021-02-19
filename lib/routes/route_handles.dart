import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn_app/flutter_demo/page_a.dart';
import 'package:flutter_learn_app/flutter_demo/page_b.dart';
import 'package:flutter_learn_app/flutter_demo/page_c.dart';
import 'package:flutter_learn_app/flutter_demo/page_empty.dart';

//空页面
var emptyHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return PageEmpty();
    });

//A页面
var aHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
      return HomePage();
    });

//B页面
var bHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
      return PageB();
    });

//C页面
var cHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> params) {
      return PageC();
    });