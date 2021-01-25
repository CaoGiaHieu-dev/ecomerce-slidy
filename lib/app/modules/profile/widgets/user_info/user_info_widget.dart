import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../../profile_controller.dart';

class UserInfoWidget extends StatelessWidget 
{
  @override
  Widget build(BuildContext context) 
  {
    final userStore = Provider.of<ProfileController>(context);
    return Container
    (
      padding: EdgeInsets.all(10),
      child: Column
      (
        children: <Widget>
        [
          Container(
            padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
            alignment: Alignment.topLeft,
            child: Text
            (
              "User Information",
              style: TextStyle
              (
                color: Colors.black87,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Card
          (
            child: Container
            (
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(15),
              child: Column
              (
                children: <Widget>
                [
                  Column
                  (
                    children: <Widget>
                    [
                      ...ListTile.divideTiles
                      (
                        color: Colors.grey,
                        tiles: 
                        [
                          ListTile
                          (
                            contentPadding: EdgeInsets.symmetric
                            (
                                horizontal: 12, vertical: 4),
                            leading: Icon(Icons.location_on),
                            title: Text("Location"),
                            subtitle: Text("${userStore.getUser.first.address.number} ${userStore.getUser.first.address.city}"),
                          ),
                          ListTile
                          (
                            leading: Icon(Icons.email),
                            title: Text("Email"),
                            subtitle: Text("${userStore.getUser.first.email}"),
                          ),
                          ListTile
                          (
                            leading: Icon(Icons.phone),
                            title: Text("Phone"),
                            subtitle: Text("${userStore.getUser.first.phone}"),
                          ),
                          ListTile
                          (
                            leading: Icon(Icons.person),
                            title: Text("About Me"),
                            subtitle: Text
                            (
                              "This is a about me link and you can khow about me in this section."
                            ),
                          ),
                          
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 20,),
          MaterialButton
          (
            padding: EdgeInsets.symmetric
            (
              horizontal: 60,
              vertical: 15
            ),
            color: HexColor("#ff0340"),
            textColor: Colors.white,
            elevation: 0,
            shape: RoundedRectangleBorder
            (
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Text
            (
              "Log out",
              style: TextStyle
              (
                fontSize: 20
              ),
            ),
            onPressed: () 
            {
              userStore.logout();
            },
          )
        ],
      ),
    );
  }
}



