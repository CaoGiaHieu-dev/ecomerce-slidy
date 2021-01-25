import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class LayoutWidget extends StatelessWidget 
{
  final Widget child ;
  final Widget titleheader;
  final Widget leading ;
  final Widget action;
  final double padding;

  const LayoutWidget({Key key, this.titleheader, this.leading, this.action, this.child, this.padding}) : super(key: key);
  @override
  Widget build(BuildContext context) 
  {
    return SingleChildScrollView
    (
      child: Stack
      (
        children: <Widget>
        [
          this.titleheader,
          SafeArea
          (
            child: Column
            (
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children : <Widget>
              [
                Padding
                (
                  padding: const EdgeInsets.all(8.0),
                  child: Row
                  (
                    children: <Widget>
                    [
                      this.leading == null ?Spacer() : this.leading ,
                      Spacer(),
                      this.action == null ?Spacer() : this.action ,
                    ]
                  ),
                ),
                SizedBox
                (
                  height: padding!=null ? padding : MediaQuery.of(context).size.height * 0.25,
                ),
                Container
                (
                  // height: 300.0 *6 - 200,
                  decoration: BoxDecoration
                  (
                    borderRadius: BorderRadius.only
                    (
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                      
                    ),
                    color: HexColor("#f2eaec")
                  ),
                  child: this.child
                )
              ]
            )
          )
        ],
      ),
    );
  }
}
