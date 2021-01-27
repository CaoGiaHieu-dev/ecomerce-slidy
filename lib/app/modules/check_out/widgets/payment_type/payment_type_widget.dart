import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class PaymentTypeWidget extends StatelessWidget 
{
  final String paymentTitle;
  final String subTitle;
  final bool onSelected;

  const PaymentTypeWidget({Key key, this.paymentTitle, this.subTitle, this.onSelected}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded
    (
      child: Card
      (
        margin: EdgeInsets.symmetric
        (
          vertical: 8.0,
          horizontal: 8.0,
        ),
        color: this.onSelected ? HexColor("#0ce5e1") : HexColor("#f2eaec"),
        elevation: 0,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder
        (
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container
        (
          height: MediaQuery.of(context).size.height * 0.2 -100,
          child : Column
          (
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>
            [
              Text
              (
                "${this.paymentTitle}",
                style: TextStyle
                (
                  fontSize: 20.0
                ),
              ),
              const SizedBox(height: 5.0),
              Text
              (
                "${this.subTitle}",
                style: TextStyle
                (
                  color: Colors.grey,
                  fontSize: 12.0,
                ),
              )
            ],
          ),
        ),
      ) 
    );
  }
}
