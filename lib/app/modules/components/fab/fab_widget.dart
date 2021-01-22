import 'package:ecomerce/app/modules/cart/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

class FabWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) 
  {
    final listCart = Provider.of<CartController>(context); 
    return FloatingActionButton
    (
      onPressed: ()
      {
        Modular.to.pushNamed
        (
          "/cart"
        );
      },
      backgroundColor: HexColor("#f2eaec"),
      child: Stack
      (
        children: <Widget>
        [
          Container
          (
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration
            (
              color: HexColor("#f2eaec"), 
            ),
                          
            child: Icon
            (
              Icons.shopping_bag,
              color: HexColor("#ff0340"),
            ),
          ),
          Positioned
          (
            top: -5,
            right: -20,
            child: Container
            (
              height: 25,
              width: 50,
              child: Center
              (
                child: Observer
                (
                  builder:(_) => Text
                  (
                    // "${controller.listCart.length}",
                    listCart.listCart.length !=0 ?
                    "${listCart.listCart.length}"
                    :"",
                    // controller.value.toString(),
                    style: TextStyle
                    (
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: HexColor("#ff0340"),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
