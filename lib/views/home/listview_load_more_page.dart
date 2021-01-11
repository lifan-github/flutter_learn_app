import 'package:flutter/material.dart';

class ListViewLoadMorePage extends StatefulWidget {
  @override
  _ListViewLoadMorePageState createState() => _ListViewLoadMorePageState();
}

class _ListViewLoadMorePageState extends State<ListViewLoadMorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('加载更多'),
      ),
      body: Text('下拉上滑加载更多'),
    );
  }
}