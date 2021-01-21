import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecomerce/app/modules/product_in_category/product_in_category_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'category_controller.dart';

class CategoryPage extends StatefulWidget {
  final String title;
  const CategoryPage({Key key, this.title = "Category"}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends ModularState<CategoryPage, CategoryController> {
  final _controller = Modular.get<ProductInCategoryController>();
  @override
  Widget build(BuildContext context) 
  {
    return Column
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
            "Categories",
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
        Container
        (
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width ,
          height: MediaQuery.of(context).size.height * 0.25,
          
          child: Observer
          (
            builder: (context)
            {
              if(controller.categoryList.error != null)
              {
                return Text(("${controller.categoryList.error}"));
              }
              if(controller.categoryList.value == null)
              {
                return Center
                (
                  child: CircularProgressIndicator(),
                );
              }
              
              var data = controller.categoryList.value;

              return Swiper
              (
                
                pagination: new SwiperPagination(),
                autoplay: true,
                autoplayDelay: 1000 * 10  ,
                itemCount: data.length,
                
                itemBuilder: (context, index) 
                {
                  return GestureDetector
                  (
                    onTap: ()
                    {
                      _controller.fetchProduct(data[index].name) ;
                      Modular.to.pushNamed
                      (
                        "/category/:name",
                        // "/category/${data[index].name}",
                        arguments: data[index].name,
                      );
                    },
                    child: Container
                    (
                      decoration: BoxDecoration
                      (
                        borderRadius: BorderRadius.all
                        (
                          Radius.circular(25.0)
                        ),
                        shape: BoxShape.rectangle,
                        boxShadow: 
                        [
                          BoxShadow
                          (
                            color: Colors.white,
                            blurRadius: 10.0
                          )
                        ]
                      ),
                      child: Card
                      (
                        shadowColor: Colors.grey,
                        child: Stack
                        (
                          children: <Widget>
                          [
                            CachedNetworkImage
                            (
                              height: double.infinity,
                              width: double.infinity,
                              imageUrl: "https://casio.anhkhue.com/upload/images/SPHOT/1052x600-hot-4.jpg",
                              alignment: Alignment.center,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Center(child: CircularProgressIndicator() ,),
                              errorWidget: (context, url, error) => new Icon(Icons.error),
                            ),
                            Container
                            (
                              alignment: Alignment.center,
                              decoration: BoxDecoration
                              (
                                shape: BoxShape.rectangle,
                              ),
                              // child: Text
                              // (
                              //   "${data[index].name}",
                              //   style: TextStyle
                              //   (
                              //     fontSize: 15,
                              //     color: Colors.black,
                              //     fontWeight: FontWeight.bold,
                              //   ),
                              // ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
            
          ),
        ),
      ],
    );
  }
}
