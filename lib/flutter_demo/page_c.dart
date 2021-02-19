import 'package:flutter/material.dart';

class PageC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PageC'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                onPressed: () => Navigator.pop(context),
                child: Text('PageC'),
              )
            ],
          )
        ),
      ),
    );
  }
}