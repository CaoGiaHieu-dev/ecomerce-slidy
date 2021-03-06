
import 'package:ecomerce/app/modules/cart/cart_controller.dart';
import 'package:ecomerce/app/modules/check_out/widgets/edit_contact/edit_contact_widget.dart';
import 'package:ecomerce/app/modules/check_out/widgets/payment_type/payment_type_widget.dart';
import 'package:ecomerce/app/modules/components/google_map_picker/google_map_picker_controller.dart';
import 'package:ecomerce/app/modules/components/google_map_picker/google_map_picker_widget.dart';
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
import 'package:rflutter_alert/rflutter_alert.dart';

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
    final googleMapPicker = Provider.of<GoogleMapPickerController>(context);
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
                        EditContactWidget
                        (
                          leading: Icon
                          (
                            FontAwesomeIcons.searchLocation,
                            color: Colors.red,
                          ),
                          title: Text
                          (
                            googleMapPicker.selectedPlace != null 
                            ? googleMapPicker.selectedPlace.formattedAddress
                            : "${userStore.getUser.first.address.street} ${userStore.getUser.first.address.city}",
                            softWrap: true,
                            maxLines: 3,
                          ),
                          trailing: Icon(Icons.arrow_forward_ios),
                          ontap: () => Modular.to.push
                          (
                            MaterialPageRoute(builder: (context)=> GoogleMapPickerWidget())
                          )
                        ),
                        SizedBox(height: 20.0),
                        EditContactWidget
                        (
                          leading:Icon
                          (
                            FontAwesomeIcons.phone,
                            color: Colors.red,
                          ),
                          title: TextField
                          (
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration
                            (
                              hintText: "Enter phome number",
                              // border: OutlineInputBorder(),
                            ),
                            controller: TextEditingController
                            (
                              text: (controller.phoneNumber == null || controller.phoneNumber =="") 
                              ? userStore.getUser.first.phone
                              : controller.phoneNumber,
                            ),
                            onSubmitted: (value) 
                            {
                              controller.phoneNumber = value;
                            },
                          ),
                          // trailing: Icon(Icons.arrow_forward_ios),
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
                                ).whenComplete(() async 
                                {
                                  await _onAlertButtonPressed(context,controller.status);
                                  if(controller.status == "OK")
                                  {
                                    listCart.cart.clear();
                                    listCart.cartShow.clear();
                                  }
                                });
                                
                                // Navigator.popUntil(context, (Route<dynamic> route) => route.isFirst);
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


//alter
_onAlertButtonPressed(context,String status) 
{
  Alert
  (
    context: context,
    type: status =="OK" ?AlertType.success :  AlertType.error,
    title: "$status",
    desc:  status =="OK" ?"Susscess" : "Try again",
    buttons: 
    [
      DialogButton
      (
        child: Text
        (
          "OK",
          style: TextStyle
          (
            color: Colors.white, 
            fontSize: 20
          ),
        ),
        onPressed: ()
        {
          status =="OK" 
          ? Navigator.popUntil(context, (Route<dynamic> route) => route.isFirst)
          : Modular.to.pop();
        },
        width: 120,
      )
    ],
  ).show();
}