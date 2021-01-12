import 'package:flutter/material.dart';

class ListTilePage extends StatefulWidget {
  @override
  _ListTilePageState createState() => _ListTilePageState();
}

class _ListTilePageState extends State<ListTilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListTile列表块'),
      ),
      body: Column(
        children: <Widget>[
          Text('普通列表'),
          ListTileItem(),
          Text('卡片形势的列表'),
          CardListTileItem(),
        ],
      ),
    );
  }
}

// 普通列表
class ListTileItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.phone), // 左侧图标
            title: Text("卜大爷 $index"), // 一级标题
            subtitle: Text("010-12345678"), // 二级标题
            trailing: Icon(Icons.arrow_forward_ios), // 右侧图标
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
            enabled: true,
            onTap: () => print("$index被点击了"),
            onLongPress: () => print("$index被长按了"),
          );
        },
      ),
    );
  }
}

// 卡片形势的列表
class CardListTileItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Icon(Icons.phone), // 左侧图标
              title: Text("卜大爷 $index"), // 一级标题
              subtitle: Text("010-12345678"), // 二级标题
              trailing: Icon(Icons.arrow_forward_ios), // 右侧图标
              contentPadding: EdgeInsets.symmetric(horizontal: 20.0),
              enabled: true,
              onTap: () => print("$index被点击了"),
              onLongPress: () => print("$index被长按了"),
            ),
          );
        },
      ),
    );
  }
}


/// 注意问题
/// Flutter的盒子约束
/// 由Expanded widget引发的思考
/// Expanded widget作用是给子 widget 分配剩余的空间，也就是只要给ListView指定高度即可。
/// 当然也就可以在ListView外层嵌套一个限定高度的Container widget。
/// Column在纵向上面是无限制的，而ListView在其滚动方向上也是无限制。
/// 而上面这句话也解释了，一个本身试图占用尽可能大的渲染盒在给定无边界约束时不会有用，在debug模式下，会抛出异常
/// 所以当我们给ListView外层嵌套了Expanded或者限高的Container，避免了一个不限制高度的widget直接被嵌套于另外一个不限高的widget中，
/// 在VSCode终端直接运行flutter run 控制台是没有任何打印信息，只有在debug模式下，控制台会打印异常。