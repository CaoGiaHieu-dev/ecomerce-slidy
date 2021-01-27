import 'package:ecomerce/app/modules/cart/widgets/checkout/checkout_widget.dart';
import 'package:ecomerce/app/modules/components/items/items_widget.dart';
import 'package:ecomerce/app/modules/components/layout/layout_widget.dart';
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
      bottomNavigationBar: BottomAppBar
      (
        color: Colors.transparent,
        child: CheckoutWidget(),
      ),
      backgroundColor: Colors.white,
      body: LayoutWidget
      (
        padding: 10.0,
        titleheader: Container
        (
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.2,
          child: Center
          (
            child: Text
            (
              "Cart",
              style: TextStyle
              (
                color: HexColor("#ff0340"),
                fontSize: 30.0,
                shadows: 
                [
                  BoxShadow
                  (
                    color: Colors.black,
                    // offset: Offset(5.0, 5.0),
                    blurRadius: 1.0
                  )
                ]
              ),
            ),
          ),
        ),
        leading: MaterialButton
        (
          padding: const EdgeInsets.all(8.0),
          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0)),
          child: Icon(Icons.arrow_back_ios),
          color: HexColor("#f2eaec"),
          textColor: Colors.black,
          minWidth: 0,
          height: 40,
          onPressed: () 
          {
            Modular.to.pop();
          },
        ),
        // action: MaterialButton
        // (
        //   padding: const EdgeInsets.all(8.0),
        //   shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(10.0)),
        //   child: Icon(Icons.notifications_active_outlined),
        //   color: HexColor("#f2eaec"),
        //   textColor: Colors.black,
        //   minWidth: 0,
        //   height: 40,
        //   onPressed: () => null,
        // ),
        child: Observer
        (
          builder: (_)
          {
            if(listCart.listCart.isEmpty)
            {
              return Container
              ( 
                height: MediaQuery.of(context).size.height *0.75 -10,
                child: Center
                (
                  child: Text
                  (
                    "Your cart is empty"
                  ),
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
                  textLength: 10,
                );
              },
            ); 
          }
        ),
      ),
    );
  }
}
