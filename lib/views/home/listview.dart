import 'dart:convert';
import 'package:flutter/material.dart';

const CITY_NAMES = ['北京', '上海', '广州', '深圳', '杭州', '苏州', '成都', '武汉', '郑州'];

class ListViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListView列表'),
      ),
      body: ListView(
        // scrollDirection: Axis.horizontal, // 滚动方向
        children: _buildList(),
      ),
    );
  }

  List<Widget> _buildList(){
    return CITY_NAMES.map((city) => _item(city)).toList();
  }

  Widget _item(String city) {
    return Container(
      height: 160,
      margin: EdgeInsets.only(bottom: 5),
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Colors.teal),
      child: Text(
        city,
        style: TextStyle(color: Colors.white, fontSize: 20)
      ),
    );
  }
}