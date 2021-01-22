
import 'package:ecomerce/app/modules/components/items/items_widget.dart';
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
                  child: ItemsWidget
                  (
                    image: data[index].image,
                    price: data[index].price,
                    title: data[index].title,
                  )
                );
              },
            );
          },
        ),
      ],
    );
  }
}