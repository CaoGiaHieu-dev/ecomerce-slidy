import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'header_controller.dart';
import 'package:ecomerce/helper/image.dart';

class HeaderPage extends StatefulWidget {
  final String image;
  const HeaderPage({Key key, this.image }) : super(key: key);

  @override
  _HeaderPageState createState() => _HeaderPageState();
}

class _HeaderPageState extends ModularState<HeaderPage, HeaderController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) 
  {
    return Container
    (
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.5 - 100,
      // height: double.infinity,
      // width: MediaQuery.of(context).size.width ,
      child: checkTypeImageNetworkSvg(this.widget.image)
      ? SvgPicture.network
      (
        "${this.widget.image}",
        fit: BoxFit.fill,
        placeholderBuilder: (context) 
        {
          return Center
          (
            child: CircularProgressIndicator(),
          );
        },
      )
      : CachedNetworkImage
      (
        height: double.infinity,
        width: double.infinity,
        imageUrl: "${this.widget.image}",
        alignment: Alignment.center,
        fit: BoxFit.fill,
        placeholder: (context, url) => Center(child: CircularProgressIndicator() ,),
        errorWidget: (context, url, error) => new Icon(Icons.error),
      ),
    );
  }
}
