import 'package:ecomerce/app/modules/profile/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';


class LoginFormWidget extends StatelessWidget 
{
  @override
  Widget build(BuildContext context) 
  {
    final userStore = Provider.of<ProfileController>(context);
    return Center
    (
      child: Material
      (
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20.0),
        child: Container
        (
          margin: const EdgeInsets.all(16.0),
          decoration: BoxDecoration
          (
            color: HexColor("#f2eaec") ,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: ListView
          (
            shrinkWrap: true,
            padding: const EdgeInsets.all(16.0),
            children: <Widget>
            [
              const SizedBox(height: 10.0),
              TextField
              (
                decoration: InputDecoration
                (
                  hintText: "Enter email",
                  border: OutlineInputBorder(),
                ),
                controller: TextEditingController
                (
                  text: userStore.userName
                ),
                onChanged: (value) 
                {
                  userStore.userName = value;
                },
              ),
              const SizedBox(height: 10.0),
              TextField
              (
                obscureText: true,
                decoration: InputDecoration
                (
                  hintText: "Enter password",
                  border: OutlineInputBorder(),
                ),
                controller: TextEditingController
                (
                  text: userStore.passWord
                ),
                onChanged: (value) 
                {
                  userStore.passWord = value;
                },
              ),
              const SizedBox(height: 10.0),
              RaisedButton
              (
                color: HexColor("#ff0340"),
                textColor: Colors.white,
                elevation: 0, 
                shape: RoundedRectangleBorder
                (
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Text("Login"),
                onPressed: () 
                {
                  userStore.login() 
                  ? Modular.to.pop()
                  : print("error");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
