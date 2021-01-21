import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'hot_items_controller.dart';

class HotItemsPage extends StatefulWidget {
  final String title;
  const HotItemsPage({Key key, this.title = "HotItems"}) : super(key: key);

  @override
  _HotItemsPageState createState() => _HotItemsPageState();
}

class _HotItemsPageState
    extends ModularState<HotItemsPage, HotItemsController> {
  //use 'controller' variable to access controller
  
  @override
  Widget build(BuildContext context) 
  {
    return Column
    (
      children: <Widget> 
      [
        SizedBox
        (
          height: 20,
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
            "Hot Products",
            style: TextStyle
            (
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
            ),
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
            if(controller.productList.value == null)
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
                                  data[index].title,
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
              },
            );
          },
        ),
      ],
    );
  }
}