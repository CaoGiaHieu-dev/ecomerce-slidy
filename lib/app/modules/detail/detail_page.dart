
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecomerce/app/modules/cart/cart_controller.dart';
import 'package:ecomerce/app/shared/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
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
    final listCart = Provider.of<CartController>(context);
    return Scaffold
    (
      body: Stack
      (
        fit: StackFit.expand,
        children: <Widget>
        [
          Hero
          (
            tag: "image${this.widget.data.id}",
            child: CachedNetworkImage
            (
              imageUrl: "${this.widget.data.image}",
              fit: BoxFit.cover,
              placeholder: (context, url) 
              {
                return Center
                (
                  child: CircularProgressIndicator(),
                );
              },
              errorWidget: (context, url, error) 
              {
                return Center
                (
                  child: Icon
                  (
                    Icons.error
                  ),
                ); 
              },
            ),
          ),
          Container
          (
            padding: const EdgeInsets.all(16.0),
            width: double.infinity,
            height: double.infinity,
            child: Column
            (
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>
              [
                SizedBox
                (
                  height: 20.0,
                ),
                Padding
                (
                  padding: const EdgeInsets.only
                  (
                    top: 30.0
                  ),
                  child: Row
                  (
                    children: <Widget>
                    [
                      MaterialButton
                      (
                        padding: const EdgeInsets.all(8.0),
                        shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                        child: Icon(Icons.arrow_back_ios),
                        color: HexColor("#f2eaec"),
                        textColor: Colors.black,
                        minWidth: 0,
                        height: 40,
                        onPressed: () => Navigator.pop(context)
                      ),
                      Spacer(),
                      Stack
                      (
                        children: <Widget>
                        [
                          MaterialButton
                          (
                            padding: const EdgeInsets.all(8.0),
                            shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                            child: Icon(Icons.shopping_bag),
                            color: HexColor("#f2eaec"),
                            textColor: Colors.black,
                            minWidth: 0,
                            height: 40,
                            onPressed: ()
                            {
                              Modular.to.pushNamed
                              (
                                "/cart"
                              );
                            }
                          ),
                          if (listCart.listCart !=null)
                            Positioned
                            (
                              top: 1,
                              right: -5,
                              child: Container
                              (
                                height: 20,
                                width: 40,
                                // decoration: BoxDecoration
                                // (
                                //   color: HexColor("#f2eaec"),
                                //   shape: BoxShape.circle,
                                //   border: Border.all
                                //   (
                                //     width: 1.5, 
                                //     color: Colors.transparent
                                //   ),
                                // ),
                                child: Center
                                (
                                  child: Observer
                                  (
                                    builder:(_) => Text
                                    (
                                      listCart.listCart.length !=0 ?
                                      "${listCart.listCart.length}"
                                      :"",
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
                    ]
                  ),
                ),
                Spacer(),
                SizedBox(height: 10.0),
                //title
                Hero(
                  tag: "title${this.widget.data.id}",
                  child: Material
                  (
                    type: MaterialType.transparency,
                    child: Text
                    (
                      this.widget.data.title ,
                      style: TextStyle
                      (
                        color: HexColor("#45969b"),
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                ),

                SizedBox
                (
                  height: 20.0
                ),

                //price
                Hero
                (
                  tag: "price${this.widget.data.id}",
                  child: Material
                  (
                    type: MaterialType.transparency,
                    child: Text
                    (
                      "\$${this.widget.data.price}" ,
                      textAlign: TextAlign.start, 
                      style: TextStyle
                      (
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: HexColor("#ff0340")
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),

                // //description
                // Hero
                // (
                //   tag: "description${this.widget.data.id}",
                //   child: Material
                //   (
                //     type: MaterialType.transparency,
                //     child: Text
                //     (
                //       "${this.widget.data.description}" ,
                //       textAlign: TextAlign.start, 
                //       style: TextStyle
                //       (
                //         fontSize: 30.0,
                //         fontWeight: FontWeight.bold,
                //         color: HexColor("#ff0340")
                //       ),
                //     ),
                //   ),
                // ),
                Row
                (
                  children: <Widget>
                  [
                    Expanded
                    (
                      child: Container
                      (
                        color: Colors.transparent,
                        padding: EdgeInsets.symmetric
                        (
                          horizontal: 20,
                          vertical: 10
                        ),
                        child: RaisedButton
                        (
                          shape: RoundedRectangleBorder
                          (
                            borderRadius: BorderRadius.circular(40.0)
                          ),
                          onPressed: ()
                          {
                            listCart.addToCart(this.widget.data);
                            // controller.text();
                          },
                          child: Text
                          (
                            "Add to cart"
                          ),
                          textColor: HexColor("#ff0340"),
                          color: HexColor("#f2eaec"),
                        ),
                      )
                    )
                  ],
                )
              ],
            ),
          )
        ],
      )
    );
  }
}
