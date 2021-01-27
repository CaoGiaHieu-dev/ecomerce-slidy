import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class EditContactWidget extends StatelessWidget 
{
  final title ;
  final ontap;
  final leading;
  final trailing;
  final Size height;

  const EditContactWidget({Key key, this.title, this.ontap, this.leading, this.trailing, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) 
  {
    return Card
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
        height: this.height!=null ? this.height :MediaQuery.of(context).size.height *0.2 -100,
        child : ListTile
        (
          leading: this.leading ?? null,
          title: this.title,
          trailing: this.trailing ?? null,
          onTap: this.ontap ?? null,
        ),
      ),
    );
  }
}
