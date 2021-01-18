import 'package:cached_network_image/cached_network_image.dart';
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
  @override
  Widget build(BuildContext context) 
  {
    return Container
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
              return CachedNetworkImage
              (
                imageUrl: data[index].image,
                alignment: Alignment.center,
                placeholder: (context, url) => Center(child: CircularProgressIndicator() ,),
                errorWidget: (context, url, error) => new Icon(Icons.error),
              );
            },
          );
        },
        
      ),
    );
  }
}
