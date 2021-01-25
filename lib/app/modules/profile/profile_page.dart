import 'package:ecomerce/app/modules/profile/widgets/login/login_widget.dart';
import 'package:ecomerce/app/modules/profile/widgets/profile_header/profile_header_widget.dart';
import 'package:ecomerce/app/modules/profile/widgets/user_info/user_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:provider/provider.dart';

import 'profile_controller.dart';

class ProfilePage extends StatefulWidget {
  final String title;
  const ProfilePage({Key key, this.title = "Profile"}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends ModularState<ProfilePage, ProfileController> {
  //use 'controller' variable to access controller
  @override
  Widget build(BuildContext context)  
  {
    final userStore = Provider.of<ProfileController>(context);

    return Scaffold
    (
      body: Observer
      (
        builder: (_) => userStore.isLoading == false
        ? Observer
        (
          builder: (_) => userStore.isLogin
          ? SingleChildScrollView
          (
            child: Column
            (
              children: <Widget>
              [
                ProfileHeaderWidget
                (
                  avatar: NetworkImage("https://fakeimg.pl/250x100/"),
                  coverImage: NetworkImage("https://fakeimg.pl/250x100/"),
                  title: "${userStore.getUser.first.name.firstname} ${userStore.getUser.first.name.lastname}",
                  subtitle: "Gold Member",
                  actions: <Widget>
                  [
                    MaterialButton
                    (
                      color: Colors.white,
                      shape: CircleBorder(),
                      elevation: 0,
                      child: Icon(Icons.edit),
                      onPressed: () {},
                    )
                  ],
                ),
                const SizedBox(height: 10.0),
                UserInfoWidget(),
              ],
            ),
          )
          : LoginWidget()
        )
        : Center
        (
          child: CircularProgressIndicator(),
        )
      )
    ) ; 
  }
}


