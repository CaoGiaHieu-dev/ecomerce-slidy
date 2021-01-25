import 'package:ecomerce/app/modules/cart/cart_controller.dart';
import 'package:ecomerce/app/modules/components/layout/layout_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import 'check_out_controller.dart';

class CheckOutPage extends StatefulWidget {
  final String title;
  const CheckOutPage({Key key, this.title = "CheckOut"}) : super(key: key);

  @override
  _CheckOutPageState createState() => _CheckOutPageState();
}

class _CheckOutPageState
    extends ModularState<CheckOutPage, CheckOutController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    final listCart = Provider.of<CartController>(context);
    return Scaffold
    (
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
              "Payment",
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
          child: Icon(Icons.cancel),
          color: HexColor("#f2eaec"),
          textColor: Colors.black,
          minWidth: 0,
          height: 40,
          onPressed: () 
          {
            Modular.to.pop();
          },
        ),
        child : Observer
        (
          builder: (_)
          {
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

            return Column
            (
              children: <Widget>
              [
                Container
                (
                  height: MediaQuery.of(context).size.height *0.25 -100,
                  decoration: BoxDecoration
                  (
                    border: Border.all(color: Colors.white),
                    shape: BoxShape.rectangle,
                  ),
                  child: Column
                  (
                    children:<Widget> 
                    [
                      SizedBox
                      (
                        height: 15,
                      ),
                      Container
                      (
                        margin: EdgeInsets.only
                        (
                          left: 20,
                        ),
                        alignment: Alignment.centerLeft,
                        child: Text
                        (
                          "Location",
                          style: TextStyle
                          (
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0,
                          ),
                          maxLines: 1,
                        ),
                      ),
                      SizedBox
                      (
                        height: 15,
                      ),
                      Row
                      (
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>
                        [
                          SizedBox(width: 20,),
                          Text
                          (
                            "193/22/10 Lê Hồng Phong",
                            style: TextStyle
                            (
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0
                            ),
                            maxLines: 2,
                            softWrap: true,
                          ),
                          Spacer(),
                          GestureDetector
                          (
                            onTap: ()=>null,
                            child: Text
                            (
                              "Changed",
                              style: TextStyle
                              (
                                color: HexColor("#ff0340"),
                                fontSize: 20
                              ),
                            ),
                          ),
                          SizedBox(width: 10,)
                        ],
                      ),
                    ],
                  ),
                ),
                Container
                (
                  height: MediaQuery.of(context).size.height *0.1,
                  decoration: BoxDecoration
                  (
                    border: Border.all(color: Colors.white),
                    shape: BoxShape.rectangle,
                  ),
                  child: Row
                  (
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>
                    [
                      SizedBox(width: 20,),
                      Text
                      (
                        "193/22/10 Lê Hồng Phong",
                        style: TextStyle
                        (
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0
                        ),
                        maxLines: 2,
                        softWrap: true,
                      ),
                      Spacer(),
                      GestureDetector
                      (
                        onTap: ()=>null,
                        child: Text
                        (
                          "Changed",
                          style: TextStyle
                          (
                            color: HexColor("#ff0340"),
                            fontSize: 20
                          ),
                        ),
                      ),
                      SizedBox(width: 10,)
                    ],
                  ),
                ),
              ],
            ); 
          }
        )
      )
    );
  }
}
