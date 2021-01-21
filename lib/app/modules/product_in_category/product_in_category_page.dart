import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ecomerce/helper/string.dart';
import 'product_in_category_controller.dart';
import 'package:ecomerce/app/modules/widgets/header/header_page.dart';

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
      floatingActionButton: FloatingActionButton
      (
        onPressed: ()
        {
          // Modular.to.pushNamed("/detail/${controller.value}");
        },
        backgroundColor: HexColor("#f2eaec"),
        child: Icon
        (
          Icons.shopping_bag,
          color: HexColor("#ff0340"),
        ),
      ),
      body: SingleChildScrollView
      (
        child: Stack
        (
          children: <Widget>
          [
            HeaderPage
            (
              image: "https://casio.anhkhue.com/upload/images/SPHOT/1052x600-hot-4.jpg"
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
                                return GestureDetector
                                (
                                  onTap: ()
                                  {
                                    Modular.to.pushNamed
                                    (
                                      "/detail",
                                      arguments: data[index]
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
                                                image: NetworkImage(data[index].image), 
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
                                                  titleLength(data[index].title,50),
                                                  style: TextStyle
                                                  (
                                                    fontSize: 15.0, 
                                                    fontWeight: FontWeight.w700
                                                  ),
                                                ),
                                                Spacer(),
                                                Text
                                                (
                                                  "\$${data[index].price.toString()}",
                                                    style: TextStyle
                                                    (
                                                      color: Colors.red,
                                                      fontSize: 30.0,
                                                    )
                                                ),
                                              ],
                                            ),
                                          )
                                        )
                                      ]
                                    ),
                                  ),
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
