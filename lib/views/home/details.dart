import 'package:flutter/material.dart';
import 'package:flutter_learn_app/model/home_model.dart';
import 'package:provider/provider.dart';

class HomeDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _counter = Provider.of<CounterModel>(context);
    print('_counter---------${_counter.value}');
    return Scaffold(
      appBar: AppBar(
        title: Text('详情页'),
      ),
      body: Container(
        child: Center(
            child: Column(
          children: <Widget>[
            Text('详情页'),
            Text('value:${_counter.value}'),
            RaisedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('返回值上一页'),
            )
          ],
        )),
      ),
    );
  }
}
