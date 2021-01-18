import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'detail_controller.dart';

class DetailPage extends StatefulWidget {
  final String title;
  final String name;
  const DetailPage
  (
    {
      Key key, 
      this.title = "Detail",
      this.name,
    }
  ) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends ModularState<DetailPage, DetailController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>
        [
          Center
          (
            child: Text
            (
              "Name : ${widget.name}"
            ),
          )
        ],
      ),
    );
  }
}
