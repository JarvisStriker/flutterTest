import 'package:flutter/material.dart';

class _Support extends MaterialPageRoute<Null> {
  _Support()
  : super(builder: (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Support'),
        elevation: 1.0,
      ),);
  });
}