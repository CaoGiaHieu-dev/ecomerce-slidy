
import 'package:ecomerce/app/modules/cart/cart_controller.dart';
import 'package:ecomerce/app/modules/check_out/payment_type/payment_type_widget.dart';
import 'package:ecomerce/app/modules/components/layout/layout_widget.dart';
import 'package:ecomerce/app/modules/profile/profile_controller.dart';
import 'package:ecomerce/app/modules/profile/widgets/login/login_widget.dart';
import 'package:ecomerce/app/shared/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
  Widget build(BuildContext context) 
  {
    final listCart = Provider.of<CartController>(context);
    final userStore =Provider.of<ProfileController>(context);
    return Scaffold
    (
      backgroundColor: Colors.white,
      body: Observer
      (
        builder: (_) 
        {
          if( userStore.isLoading == false  )
          {
            return Observer
            (
              builder:(_)
              {
                if(userStore.isLogin || userStore.login())
                {
                  return LayoutWidget
                  (
                    bgColor: Colors.white,
                    padding: 10.0,
                    titleheader: Container
                    (
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: Center
                      (
                        child: Text
                        (
                          "Check Out",
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
                    child : Column
                    (
                      children: <Widget>
                      [
                        Text
                        (
                          "Choose your plan",
                          style: TextStyle
                          (
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0,
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Row
                        (
                          children: <Widget>
                          [
                            SizedBox(width: 30,),
                            PaymentTypeWidget
                            (
                              onSelected: true,
                              paymentTitle: "COD",
                              subTitle: "Free Ship",
                            ),
                            PaymentTypeWidget
                            (
                              onSelected: false,
                              paymentTitle: "Master Card",
                              subTitle: "10%",
                            ),
                            SizedBox(width: 30,),
                          ],
                        ),
                        SizedBox(height: 20.0),
                        Card
                        (
                          margin: const EdgeInsets.all(0),
                          color:  HexColor("#f2eaec"),
                          elevation: 0,
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder
                          (
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Container
                          (
                            height: MediaQuery.of(context).size.height *0.2 -100,
                            child : ListTile
                            (
                            leading: Icon
                            (
                              FontAwesomeIcons.searchLocation,
                              color: Colors.red,
                            ),
                            title: Text
                            (
                              "${userStore.getUser.first.address.street} ${userStore.getUser.first.address.city}",
                              softWrap: true,
                              maxLines: 3,
                            ),
                            trailing: Icon(Icons.arrow_forward_ios),
                          ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Card
                        (
                          margin: const EdgeInsets.all(0),
                          color:  HexColor("#f2eaec"),
                          elevation: 0,
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder
                          (
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Container
                          (
                            height: MediaQuery.of(context).size.height *0.2 -100,
                            child : ListTile
                            (
                              leading: Icon
                              (
                                FontAwesomeIcons.phone,
                                color: Colors.red,
                              ),
                              title: TextField
                              (
                                decoration: InputDecoration
                                (
                                  hintText: "Enter phome number",
                                  // border: OutlineInputBorder(),
                                ),
                                controller: TextEditingController
                                (
                                  text: userStore.getUser.first.phone
                                ),
                                onChanged: (value) 
                                {

                                },
                              ),
                              // trailing: Icon(Icons.arrow_forward_ios),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Observer
                        (
                          builder: (_)
                          {
                            double totalPrice = 0;
                            listCart.listCart.forEach
                            (
                              (element)
                              {
                                totalPrice += element.price;
                              }
                            );
                            return Column
                            (
                              children: <Widget>
                              [
                                ...ListTile.divideTiles
                                (
                                  color: Colors.grey,
                                  tiles : 
                                  [
                                    ListTile
                                    (
                                      contentPadding: EdgeInsets.symmetric
                                      (
                                        horizontal: 12, 
                                        vertical: 4
                                      ),
                                      leading: Icon(FontAwesomeIcons.moneyBillAlt),
                                      title: Text("Sub Total"),
                                      trailing: Text
                                      (
                                        "\$${totalPrice.toStringAsFixed(2)} ",
                                      ),
                                    ),

                                    ListTile
                                    (
                                      contentPadding: EdgeInsets.symmetric
                                      (
                                        horizontal: 12, 
                                        vertical: 4
                                      ),
                                      leading: Icon(FontAwesomeIcons.exchangeAlt),
                                      title: Text("Fee"),
                                      trailing: Text("0"),
                                    ),

                                    ListTile
                                    (
                                      contentPadding: EdgeInsets.symmetric
                                      (
                                        horizontal: 12, 
                                        vertical: 4
                                      ),
                                      leading: Icon(FontAwesomeIcons.moneyBill),
                                      title: Text("Total"),
                                      trailing: Text
                                      (
                                        "\$${totalPrice.toStringAsFixed(2)} ",
                                      ),
                                    ),
                                  ]
                                ),
                              ],
                            );
                            
                          }
                        ),
                        SizedBox(height: 20.0),
                        Row
                        (
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>
                          [
                            MaterialButton
                            (
                              padding: const EdgeInsets.only
                              (
                                top :8.0,
                                bottom:8.0,
                                left: 50,
                                right: 50,
                              ),
                              shape: RoundedRectangleBorder
                              (
                                borderRadius: BorderRadius.circular(10.0)
                              ),
                              child: Text
                              (
                                "Complete",
                                style: TextStyle
                                (
                                  color: Colors.white,
                                  fontSize: 15.0
                                ),
                              ),
                              color: HexColor("#ff0340"),
                              textColor: Colors.black,
                              minWidth: 0,
                              height: 20,
                              onPressed: ()
                              {
                                List<Products> productList =[];
                                listCart.cart.forEach
                                (
                                  (element) 
                                  { 
                                    productList.add
                                    (
                                      Products.fromJson
                                      ( 
                                        {
                                          "productId": element.id,
                                          "quantity": listCart.listCart.where((value) => value.id==element.id).length
                                        },
                                      )
                                    );
                                  }
                                );
                                var now = new DateTime.now();
                                controller.payment
                                (
                                  CartModel
                                  (
                                    date: now.millisecondsSinceEpoch.toString(),
                                    iV: userStore.getUser.first.iV,
                                    userId: userStore.getUser.first.id,
                                    products: productList
                                  ),
                                );
                                Navigator.popUntil(context, (Route<dynamic> route) => route.isFirst);
                              }
                            ),
                          ]
                        )
                      ]
                    )
                  );           
                }
                else
                {
                  return LoginWidget();
                }
              } 
            );      
          }
          else
          {
            return Center
            (
              child: CircularProgressIndicator(),
            );
          }
        }
      ) 
    );
  }
}
