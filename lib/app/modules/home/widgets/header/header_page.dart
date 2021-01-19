import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'header_controller.dart';

class HeaderPage extends StatefulWidget {
  final String title;
  const HeaderPage({Key key, this.title = "Header"}) : super(key: key);

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
      child: SvgPicture.network
      (
        ( "https://dev.w3.org/SVG/tools/svgweb/samples/svg-files/aa.svg"),
        fit: BoxFit.fill,
        placeholderBuilder: (context) 
        {
          return Center
          (
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
