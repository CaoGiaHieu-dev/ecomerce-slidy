import 'package:ecomerce/app/modules/cart/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

class CheckoutWidget extends StatelessWidget 
{
  @override
  Widget build(BuildContext context) 
  {
    final listCart = Provider.of<CartController>(context);
    return Container
    (
      padding: EdgeInsets.symmetric
      (
        horizontal: 20,
        vertical: 20
      ),
      decoration: BoxDecoration
      (
        color: HexColor("#f2eaec"),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.only
        (
          topLeft: Radius.circular(45.0),
          topRight: Radius.circular(45.0)
        ),
        boxShadow: 
        [
          BoxShadow
          (
            color: Colors.black,
            // offset: Offset(5.0, 5.0),
            blurRadius: 15.0
          )
        ]
      ),
      child: SafeArea
      (
        child: Row
        (
          children: <Widget>
          [
            Column
            (
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>
              [
                Text
                (
                  "Total : ",
                  style: TextStyle
                  (
                    fontSize: 20.0, 
                    fontWeight: FontWeight.w700
                  ),
                ),
                SizedBox(height: 10,),
                Observer
                (
                  
                  builder:(_) 
                  {
                    double totalPrice = 0;
                    listCart.listCart.forEach
                    (
                      (element)
                      {
                        totalPrice += element.price;
                      }
                    );
                    return Text
                    (
                      "\$${totalPrice.toStringAsFixed(2)} ",
                      style: TextStyle
                      (
                        fontSize: 15.0,
                        color: HexColor("#ff0340")
                      ),
                    );
                  } 
                ),
              ],
            ),
            Spacer(),
            MaterialButton
            (
              padding: const EdgeInsets.only
              (
                top :8.0,
                bottom:8.0,
                left: 30.0,
                right: 30.0
              ),
              shape: RoundedRectangleBorder
              (
                borderRadius: BorderRadius.circular(10.0)
              ),
              child: Text
              (
                "Check Out"
              ),
              color: HexColor("#ff0340"),
              textColor: Colors.black,
              minWidth: 0,
              height: 50,
              onPressed: ()
              {

              }
            ),
          ],
        ),
      ),
    );
  }
}
