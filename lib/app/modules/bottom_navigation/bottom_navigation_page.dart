import 'package:ecomerce/app/modules/history/history_module.dart';
import 'package:ecomerce/app/modules/home/home_module.dart';
import 'package:ecomerce/app/modules/profile/profile_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'bottom_navigation_controller.dart';

class BottomNavigationPage extends StatefulWidget {
  final String title;
  const BottomNavigationPage({Key key, this.title = "BottomNavigation"})
      : super(key: key);

  @override
  _BottomNavigationPageState createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState
    extends ModularState<BottomNavigationPage, BottomNavigationController> {
  //use 'controller' variable to access controller
  final routerListController = RouterOutletListController();
  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      body: Container
      (
        child:  RouterOutletList
        (
          controller: routerListController,
          modules: <ChildModule>
          [
            HomeModule(),
            HistoryModule(),
            ProfileModule(),
          ],
        ),
      ),
      bottomNavigationBar: Observer
      (
        builder: (_)
        {
          return BottomNavigationBar
          (
            items:  
            [
              BottomNavigationBarItem
              (
                icon: Icon(Icons.home),
                label: "Home",
              ),
              BottomNavigationBarItem
              (
                icon: Icon(Icons.history),
                label: "History",
              ),
              BottomNavigationBarItem
              (
                icon: Icon(Icons.person_pin_rounded),
                label: "Account",
              ),
            ],
            currentIndex: controller.tabIndex,
            onTap: (value) 
            {
              if(value == controller.tabIndex)
              {
                Modular.navigator.popUntil
                (
                  (route) => route.isFirst
                );
              }
              else
              {
                routerListController.changeModule(value);
                controller.setCurrnetIndex(value);
              }
            },
          );
        },
      ),
    );
  }
}
