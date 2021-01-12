import 'package:flutter/material.dart';
import 'package:flutter_learn_app/common/iconfont.dart';

class IconFontPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('iconfont图标'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Icon(IconFont.icon_camera, color: Colors.red, size: 89.0),
            Icon(IconFont.icon_delete),
            Icon(IconFont.icon_ellipsis),
            Icon(IconFont.icon_left),
            Icon(IconFont.icon_right),
            Icon(IconFont.icon_success01),
            Icon(IconFont.icon_power),
            Icon(IconFont.icon_order02),
            Icon(IconFont.icon_list),
          ],
        ),
      ),
    );
  }
}
