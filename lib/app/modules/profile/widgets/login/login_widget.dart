
import 'package:ecomerce/app/modules/profile/widgets/login/widgets/login_form/login_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';

class LoginWidget extends StatelessWidget 
{
  @override
  Widget build(BuildContext context) 
  {
    return 
      Stack
      (
        children: <Widget>
        [
          Container
          ( 
            decoration: BoxDecoration
            (
              image: DecorationImage
              (
                colorFilter: new ColorFilter.mode
                (
                  Colors.black.withOpacity(0.4), 
                  BlendMode.dstATop
                ),
                image: NetworkImage
                (
                  "https://raw.githubusercontent.com/lohanidamodar/flutter_ui_challenges/master/assets/hotel/room4.jpg"
                ),
                fit: BoxFit.fill
              ),
            ),
            child: Column
            (
              children: <Widget>
              [
                SizedBox
                (
                  height: MediaQuery.of(context).size.height *0.25,
                ),
                Expanded
                (
                  child: Column
                  (
                    children:<Widget>
                    [
                      Text
                      (
                        "Wellcome",
                        style: TextStyle
                        (
                          fontSize: 25.0, 
                          color: HexColor("#f2eaec"),
                          fontWeight: FontWeight.w700
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text
                      (
                        "You wasn't login ",
                        style: TextStyle
                        (
                          fontSize: 15.0, 
                          color: HexColor("#f2eaec"),
                          fontWeight: FontWeight.w700
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Row
                (
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>
                  [
                    Spacer(),
                    MaterialButton
                    (
                      padding: const EdgeInsets.only
                      (
                        top :8.0,
                        bottom:8.0,
                        left: 50,
                        right: 50,
                      ),
                      shape: RoundedRectangleBorder
                      (
                        borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: Text
                      (
                        "Login",
                        style: TextStyle
                        (
                          color: Colors.white
                        ),
                      ),
                      color: HexColor("#ff0340"),
                      textColor: Colors.black,
                      minWidth: 0,
                      height: 20,
                      onPressed: ()=> 
                      {
                        showDialog
                        (
                          context: context,
                          builder: (_)
                          {
                            return AnimatedSwitcher
                            (
                              duration:Duration(milliseconds: 300) ,
                              child: LoginFormWidget(),
                            );
                          }
                        )
                      }
                    ),
                    Spacer(),
                    MaterialButton
                    (
                      padding: const EdgeInsets.only
                      (
                        top :8.0,
                        bottom:8.0,
                        left: 50.0,
                        right: 50.0
                      ),
                      shape: RoundedRectangleBorder
                      (
                        borderRadius: BorderRadius.circular(10.0)
                      ),
                      child: Text
                      (
                        "Signup"
                      ),
                      color: HexColor("#f2eaec"),
                      textColor: Colors.black,
                      minWidth: 0,
                      height: 20,
                      onPressed: ()=> 
                      {
                        Modular.to.showDialog
                        (
                          child: LoginWidget()  
                        )
                      }
                    ),
                    Spacer(),
                  ],
                ),
                Spacer(),
                OutlineButton.icon
                (
                  borderSide: BorderSide
                  (
                    color: HexColor("#ff0340"),

                  ),
                  icon: Icon(FontAwesomeIcons.google),
                  padding: const EdgeInsets.only
                  (
                    top :8.0,
                    bottom:8.0,
                    left: 20.0,
                    right: 20.0
                  ),
                  shape: RoundedRectangleBorder
                  (
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                  label: Text
                  (
                    "Continue with Google",
                    style: TextStyle
                    (
                      fontSize: 15
                    ),
                  ),
                  color: HexColor("#ff0340"),
                  textColor: Colors.white,
                  
                  onPressed: () => null
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
          // Container
          // (
          //   child: AnimatedSwitcher
          //   (
          //     duration: Duration(milliseconds: 200),
          //     child: LoginWidget(),
          //   ),
          // )
        ],
    );
  }
}
