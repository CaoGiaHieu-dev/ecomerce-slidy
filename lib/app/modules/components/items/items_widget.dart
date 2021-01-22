import 'package:ecomerce/helper/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ItemsWidget extends StatelessWidget 
{
  final String image;
  final String title;
  final double price;
  final arguments;

  const ItemsWidget({Key key, this.image, this.title, this.price, this.arguments}) : super(key: key);
  @override
  Widget build(BuildContext context) 
  {
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
                margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                padding: EdgeInsets.all(20.0),
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
                    Text
                    (
                      "${titleLength(this.title, 50)}",
                      style: TextStyle
                      (
                        fontSize: 15.0, 
                        fontWeight: FontWeight.w700
                      ),
                    ),
                    Spacer(),
                    Text
                    (
                      "\$${this.price.toString()}",
                        style: TextStyle
                        (
                          color: Colors.red,
                          fontSize: 30.0,
                        )
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
