import 'package:ecomerce/app/modules/components/items/items_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'cart_controller.dart';

class CartPage extends StatefulWidget {
  final String title;
  const CartPage({Key key, this.title = "Cart"}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends ModularState<CartPage, CartController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) 
  {
    final listCart = Provider.of<CartController>(context);
    return Scaffold
    (
      backgroundColor: HexColor("#f2eaec"),
      appBar: AppBar
      (
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView
      (
        child: Observer
        (
          builder: (_)
          {
            if(listCart.listCart.isEmpty)
            {
              return Center
              (
                child: Text
                (
                  "Your cart is empty"
                ),
              );
            }

            int id ;
            var data = [];
            listCart.listCart.forEach
            (
              (element)
              {
                if(element.id != id)
                {
                  id = element.id;
                  data.add(element);
                }
              }
            );

            return ListView.builder
            (
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: data.length,
              itemBuilder: (context, index) 
              {
                // return Text("aaa");
                return ItemsWidget
                (
                  image: data[index].image,
                  price: data[index].price,
                  title: data[index].title,
                  arguments: data[index],
                  isCart: true,
                  data : data[index],
                  textLength: 15,
                );
              },
            ); 
          },
        ),
      ),
    );
  }
}
