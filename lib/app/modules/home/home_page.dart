import 'package:ecomerce/app/modules/components/fab/fab_widget.dart';
import 'package:ecomerce/app/modules/components/header/header_page.dart';
import 'package:ecomerce/app/modules/home/widgets/category/category_page.dart';
import 'package:ecomerce/app/modules/home/widgets/hot_items/hot_items_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hexcolor/hexcolor.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold
    (
      floatingActionButton: FabWidget(),
      body: SingleChildScrollView
      (
        child: Stack
        (
          children: <Widget>
          [
            HeaderPage
            (
              image: "https://dev.w3.org/SVG/tools/svgweb/samples/svg-files/aa.svg",
            ),
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
                        Spacer(),
                        MaterialButton
                        (
                          padding: const EdgeInsets.all(8.0),
                          shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                          child: Icon(Icons.notifications_active_outlined),
                          color: HexColor("#f2eaec"),
                          textColor: Colors.black,
                          minWidth: 0,
                          height: 40,
                          onPressed: () => null,
                        ),
                      ]
                    ),
                  ),
                  SizedBox
                  (
                    height: MediaQuery.of(context).size.height * 0.25,
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
                    child: Column
                    (
                      children: <Widget>
                      [
                        CategoryPage(),
                        HotItemsPage(),
                      ],
                    ),
                  )
                ]
              )
            )
          ],
        ),
      )
    );
  }
}
