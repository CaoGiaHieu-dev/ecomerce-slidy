
import 'package:ecomerce/app/modules/components/fab/fab_widget.dart';
import 'package:ecomerce/app/modules/components/header/header_page.dart';
import 'package:ecomerce/app/modules/components/items/items_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hexcolor/hexcolor.dart';
import 'product_in_category_controller.dart';

class ProductInCategoryPage extends StatefulWidget {
  final String title;
  const ProductInCategoryPage
  (
    {Key key, 
    this.title
    }
  ): super(key: key);

  @override
  _ProductInCategoryPageState createState() => _ProductInCategoryPageState();
}

class _ProductInCategoryPageState
    extends ModularState<ProductInCategoryPage, ProductInCategoryController> {
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
              image: "https://casio.anhkhue.com/upload/images/BANNERPROMTION/DESKTOP/271x400-4.jpg",
              height: MediaQuery.of(context).size.height * 0.5 -80 ,
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
                          onPressed: () 
                          {
                            Navigator.of(context).pop();

                          } 
                        ),
                        Spacer(),
                        MaterialButton
                        (
                          padding: const EdgeInsets.all(8.0),
                          shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                          child: Icon(Icons.person_outline_outlined),
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
                            "${this.widget.title}",
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
                          height: 20,
                        ),
                        Observer
                        (
                          builder: (_) 
                          {
                            if(controller.productList.error != null)
                            {
                              return Text(("${controller.productList.error}"));
                            }
                            if(controller.productList.value == null || controller.productList.value.length == 0)
                            {
                              return Center
                              (
                                child: CircularProgressIndicator(),
                              );
                            }
                            
                            var data = controller.productList.value;

                            return ListView.builder
                            (
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: data.length,
                              itemBuilder: (context, index) 
                              {
                                return ItemsWidget
                                (
                                  image: data[index].image,
                                  price: data[index].price,
                                  title: data[index].title,
                                  arguments: data[index]
                                );
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  )
                ]
              )
            )
          ],
        ),
      ),
    );
  }
}
