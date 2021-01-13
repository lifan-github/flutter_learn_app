import 'package:dio/dio.dart';

/// 异步操作
/// Dart 使用 Future 对象来表示异步操作的结果
/// 可以用 async 和 await 关键字或 Future 类的相关 API 来配合使用 future
/// future 是 Future<T> 类的对象，其表示一个 T 类型的异步操作结果。
/// 如果异步操作不需要结果，则 future 的类型可为 Future<void>
/// Future.value() 创建一个返回指定的值value  var future=Future.value(1);
/// Future.delayed() 创建一个延迟执行的future。 利用Future延迟两秒后可以打印出字符串
///

import 'package:flutter/material.dart';

class ListViewLoadMorePage extends StatefulWidget {
  @override
  _ListViewLoadMorePageState createState() => _ListViewLoadMorePageState();
}

class _ListViewLoadMorePageState extends State<ListViewLoadMorePage> {
  bool isLoading = false;

  /// 获取列表信息 {count: 总数，curr_page：当前页码，limit_num：每页条数，items：[] 数组对象}
  UserListModel listInfo;
  List listInfoItems = [];

  ScrollController _scrollController = new ScrollController(); // new监听

  @override
  void initState() {
    super.initState();
    // 1、默认加载数据
    _getListData();

    // 2、监听加载数据
    _scrollController.addListener(() {
      // 滑动至最大距离
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print("loadMore------>>>>>加载更多");
        _getListData();
      }
    });
  }

  /// 获取数据列表
  Future _getListData() async {
    if(!isLoading){
      setState(() {
        isLoading = true;
      });
      Response response =
        await Dio().get("http://rap2api.taobao.org/app/mock/6511/list/get");
    print(response.data is Map); // 类型检测
    listInfo = UserListModel.fromJson(response.data);
    print('listInfo----$listInfo'); // 打印出 Instance of 'UserListModel' 说明成功
    print('总条数----${listInfo.count}');
    print('当前页码----${listInfo.currPage}');
    print('一页条数----${listInfo.limitNum}');
    print('items------->>${listInfo.items[0].name}');
    setState(() {
      // 合并数据 && isLoading = false;
      listInfoItems = [...listInfoItems, ...listInfo.items];
      isLoading = false;
    });
    }
  }

  // 解除监听
  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  // 下拉加载刷新
  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(seconds: 2), () {
      print('下拉刷新---清空所有重新渲染20条数据');
      setState(() {
        listInfoItems.clear();
        _getListData();
        return null;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('下拉 | 上滑加载'),
        ),
        body: new RefreshIndicator(
          child: ListView.builder(
            itemCount: listInfoItems.length + 1,
            itemBuilder: (context, index) {
              if (index == listInfoItems.length) {
                return _buildProgressIndicator();
              } else {
                return Card(
                  child: ListTile(
                    title: Text("${listInfoItems[index].name}"), // 一级标题
                    subtitle: Text("${listInfoItems[index].tel}"), // 二级标题
                    trailing: Icon(Icons.arrow_forward_ios), // 右侧图标
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
                    enabled: true,
                    onTap: () => print("$index被点击了"),
                    onLongPress: () => print("$index被长按了"),
                  ),
                );
              }
            },
            controller: _scrollController,
          ),
          onRefresh: _handleRefresh,
        ));
  }

  Widget _buildProgressIndicator() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Opacity(
          opacity: isLoading ? 1.0 : 0.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("加载中……"),
              CircularProgressIndicator()
            ],
          ),
        ),
      ),
    );
  }
}


/// model
class UserListModel {
  int count;
  int currPage;
  int limitNum;
  List<Items> items;

  UserListModel({this.count, this.currPage, this.limitNum, this.items});

  UserListModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    currPage = json['curr_page'];
    limitNum = json['limit_num'];
    if (json['items'] != null) {
      items = new List<Items>();
      json['items'].forEach((v) {
        items.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['curr_page'] = this.currPage;
    data['limit_num'] = this.limitNum;
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  int age;
  String name;
  int id;
  String tel;

  Items({this.age, this.name, this.id, this.tel});

  Items.fromJson(Map<String, dynamic> json) {
    age = json['age'];
    name = json['name'];
    id = json['id'];
    tel = json['tel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['age'] = this.age;
    data['name'] = this.name;
    data['id'] = this.id;
    data['tel'] = this.tel;
    return data;
  }
}
