import 'package:ecomerce/app/modules/cart/cart_controller.dart';
import 'package:ecomerce/helper/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

class ItemsWidget extends StatelessWidget 
{
  final String image;
  final String title;
  final double price;
  final arguments;
  final bool isCart;
  final int textLength;
  final data;

  const ItemsWidget
  (
    {
      Key key, 
      this.image, 
      this.title, 
      this.price, 
      this.arguments,
      this.isCart,
      this.textLength,
      this.data
    }
  ) : super(key: key);
  @override
  Widget build(BuildContext context) 
  {
    final listCart = Provider.of<CartController>(context);
    return GestureDetector 
    (
      onTap: () 
      {
        Modular.to.pushNamed
        (
          "/detail",
          arguments: arguments
        );            
      },
      child: Container
      (
        height: 200.0,
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        margin: EdgeInsets.only(bottom: 20.0,top : 20.0),
      
        child: Row
        (
          children: <Widget>
          [
            Expanded
            (
              child: Container
              (
                decoration: BoxDecoration
                (
                  image: DecorationImage
                  (
                    image: NetworkImage(this.image), 
                    fit: BoxFit.cover
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  boxShadow: 
                  [
                    BoxShadow
                    (
                      color: Colors.grey,
                      offset: Offset(5.0, 5.0),
                      blurRadius: 10.0
                    )
                  ]
                ),
              )
            ),
            Expanded
            (
              child: Container
              (
                margin: EdgeInsets.only
                (
                  top: 20.0, 
                  bottom: 20.0
                ),
                padding: EdgeInsets.only
                (
                  top: 10.0,
                  bottom: 10.0,
                  left: 10
                ),
                decoration: BoxDecoration
                (
                  borderRadius: BorderRadius.only
                  (
                    bottomRight: Radius.circular(10.0),
                    topRight: Radius.circular(10.0)
                  ),
                  color: Colors.white,
                  boxShadow: 
                  [
                    BoxShadow
                    (
                      color: Colors.grey,
                      offset: Offset(5.0, 5.0),
                      blurRadius: 10.0
                    )
                  ]
                ),
                child: Column
                (
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>
                  [
                    isCart 
                    ?Row
                    (
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>
                      [
                        Text
                        (
                          "${titleLength(this.title, textLength==null ? 50 : textLength)}",
                          maxLines: this.isCart ? 2 :3,
                          softWrap: true,
                          style: TextStyle
                          (
                            fontSize: 15.0, 
                            fontWeight: FontWeight.w700
                          ),
                        ),
                        Spacer(),
                        MaterialButton
                        (
                          padding: const EdgeInsets.all(8.0),
                          shape: RoundedRectangleBorder
                          (
                            borderRadius: BorderRadius.circular(10.0)
                          ),
                          child: Icon
                          (
                            Icons.delete,
                            size: 15,
                            color: Colors.red,
                          ),
                          color: HexColor("#f2eaec"),
                          textColor: Colors.black,
                          minWidth: 0,
                          height: 20,
                          onPressed: ()
                          {
                            listCart.deteleItems(data);
                          }
                        ),
                      ],
                    )
                    :Text
                    (
                      "${titleLength(this.title, textLength==null ? 50 : textLength)}",
                      maxLines: this.isCart ? 1 :3,
                      style: TextStyle
                      (
                        fontSize: 15.0, 
                        fontWeight: FontWeight.w700
                      ),
                    ),
                    // Spacer(),
                    this.isCart
                    ?Column
                    (
                      children: <Widget>
                      [
                        Text
                        (
                          "Price : \$${this.price.toStringAsFixed(2)}",
                            style: TextStyle
                            (
                              color: Colors.red,
                              fontSize: 15.0,
                            )
                        ),
                        SizedBox
                        (
                          height: 5,
                        ),
                        Observer
                        (
                          builder:(_) => Text
                          (
                            "Total : \$${(this.price * listCart.cart.where((element) => element.id==data.id).length).toStringAsFixed(2)}",
                              style: TextStyle
                              (
                                color: Colors.red,
                                fontSize: 15.0,
                              )
                          ),
                        ),
                      ],
                    )
                    :Column
                    (
                      children:<Widget> 
                      [
                        SizedBox
                        (
                          height: 50,
                        ),
                        Text
                        (
                          "\$${this.price}",
                            style: TextStyle
                            (
                              color: Colors.red,
                              fontSize: 30.0,
                            )
                        ),
                      ],
                    ),
                    Spacer(),
                    this.isCart
                    ? Row
                    (
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>
                      [ 
                        MaterialButton
                        (
                          padding: const EdgeInsets.all(8.0),
                          shape: RoundedRectangleBorder
                          (
                            borderRadius: BorderRadius.circular(10.0)
                          ),
                          child: Icon
                          (
                            Icons.remove,
                            size: 15,
                          ),
                          color: HexColor("#f2eaec"),
                          textColor: Colors.black,
                          minWidth: 0,
                          height: 20,
                          onPressed: ()
                          {
                            listCart.removeItems(data);
                          }
                        ),

                        SizedBox
                        (
                          width: 5,
                        ),
                        Observer
                        (
                          builder: (_) 
                          {
                            return Text
                            (
                              "${listCart.cart.where((element) => element.id==data.id).length}"
                            );  
                          },
                        ),
                        SizedBox
                        (
                          width: 5,
                        ),
                        MaterialButton
                        (
                          padding: const EdgeInsets.all(8.0),
                          shape: RoundedRectangleBorder
                          (
                            borderRadius: BorderRadius.circular(10.0)
                          ),
                          child: Icon
                          (
                            Icons.add,
                            size: 15,
                          ),
                          color: HexColor("#f2eaec"),
                          textColor: Colors.black,
                          minWidth: 0,
                          height: 20,
                          onPressed: () 
                          {
                            listCart.addToCart(data);
                          }
                        ),
                      ],
                    )
                    :SizedBox
                    (// height: 20.0,
                    ),
                    
                    // SizedBox
                    // (
                    //   height: 20.0,
                    // ),
                    // Text
                    // (
                    //   data[index].description,
                    //   style: TextStyle
                    //   (
                    //     fontSize: 18.0, 
                    //     color: Colors.grey, height: 1.5
                    //   )
                    // )
                  ],
                ),
              )
            )
          ]
        ),
      ),
    );
  }
}
