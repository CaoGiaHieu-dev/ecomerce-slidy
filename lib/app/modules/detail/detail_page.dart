import 'package:ecomerce/app/shared/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'detail_controller.dart';

class DetailPage extends StatefulWidget {
  final ProductModel data;
  const DetailPage
  (
    {
      Key key, 
      this.data
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
      body: Column(
        children: <Widget>
        [
          Center
          (
            child: Text
            (
              "Name : ${widget.data.id}"
            ),
          )
        ],
      ),
    );
  }
}
