import 'package:flutter/material.dart';

class UserInfoWidget extends StatelessWidget 
{
  @override
  Widget build(BuildContext context) 
  {
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
                            subtitle: Text("Kathmandu"),
                          ),
                          ListTile
                          (
                            leading: Icon(Icons.email),
                            title: Text("Email"),
                            subtitle: Text("sudeptech@gmail.com"),
                          ),
                          ListTile
                          (
                            leading: Icon(Icons.phone),
                            title: Text("Phone"),
                            subtitle: Text("99--99876-56"),
                          ),
                          ListTile
                          (
                            leading: Icon(Icons.person),
                            title: Text("About Me"),
                            subtitle: Text(
                                "This is a about me link and you can khow about me in this section."),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}



