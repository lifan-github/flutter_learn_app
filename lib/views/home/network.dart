import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class NetworkPage extends StatefulWidget {
  @override
  _NetworkPageState createState() => _NetworkPageState();
}

class _NetworkPageState extends State<NetworkPage> {
  UserInfoModel user;

  void getUserInfo() async {
    try {
      Response response =
          await Dio().get("http://rap2api.taobao.org/app/mock/6511/user/info");
          print('response-->>$response');
      user = UserInfoModel.fromJson(response.data);
      print(user.name);
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('网络请求'),
      ),
      body: Container(
        child: Column(
          children: [
            RaisedButton(
              onPressed: () => getUserInfo(),
              child: Text('点击我获取姓名'),
            ),
            Text("姓名:" + (user != null &&user.name!=null ? user.name : "暂无")),
          ],
        ),
      ),
    );
  }
}

// UserInfoModel
class UserInfoModel {
  String name;
  int age;
  String address;

  UserInfoModel({this.name, this.age, this.address});

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    age = json['age'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['age'] = this.age;
    data['address'] = this.address;
    return data;
  }
}
