import 'package:flutter/material.dart';

class AssetsPage extends StatefulWidget {
  @override
  _AssetsPageState createState() => _AssetsPageState();
}

class _AssetsPageState extends State<AssetsPage> {
  @override
  void initState(){
    super.initState();
    print('资产界面----------------');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print('资产界面initState---之后执行，并此时可以获取其他 State');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: <Widget>[
          Text('资产界面'),
          RaisedButton(
            onPressed: () => Navigator.pushNamed(context, 'assets_details'),
            child: Text('点击进入详情'),
          )
        ]),
      ),
    );
  }
}
