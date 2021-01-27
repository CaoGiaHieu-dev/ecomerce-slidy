
import 'package:ecomerce/app/modules/components/fab/fab_widget.dart';
import 'package:ecomerce/app/modules/components/layout/layout_widget.dart';
import 'package:ecomerce/app/modules/profile/profile_controller.dart';
import 'package:ecomerce/app/modules/profile/widgets/login/login_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import 'history_controller.dart';

class HistoryPage extends StatefulWidget {
  final int userId;
  const HistoryPage({Key key, this.userId }) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends ModularState<HistoryPage, HistoryController> 
{
  //use 'controller' variable to access controller
  
  @override
  Widget build(BuildContext context) 
  {
    final history = Provider.of<HistoryController>(context);
    final userStore =Provider.of<ProfileController>(context);
    return Scaffold
    (
      backgroundColor: Colors.white,
      floatingActionButton: FabWidget(),
      body: Observer
      (
        builder: (_) 
        {
          if( userStore.isLoading == false  )
          {
            return Observer
            (
              builder: (_)
              {
                if(userStore.isLogin || userStore.login())
                {
                  history.fetchUserCart(userStore.getUser.first.id);
                  return LayoutWidget
                  (
                    bgColor: Colors.white,
                    padding: MediaQuery.of(context).size.height *0.1,
                    titleheader: Container
                    (
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: Center
                      (
                        child: Text
                        (
                          "History",
                          style: TextStyle
                          (
                            color: HexColor("#ff0340"),
                            fontSize: 30.0,
                            shadows: 
                            [
                              BoxShadow
                              (
                                color: Colors.black,
                                // offset: Offset(5.0, 5.0),
                                blurRadius: 1.0
                              )
                            ]
                          ),
                        ),
                      ),
                    ),
                    child:  Column
                    (
                      children: <Widget>
                      [
                        Observer
                        (
                          builder:(_) 
                          {
                            if( history.isLoading ==false)
                            {
                              return ListView.builder
                              (
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: history.cartList.value.length,
                                itemBuilder: (context, index) 
                                {
                                  return Card
                                  (
                                    margin: const EdgeInsets.all(10),
                                    color:  HexColor("#f2eaec"),
                                    elevation: 0,
                                    clipBehavior: Clip.antiAlias,
                                    shape: RoundedRectangleBorder
                                    (
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    child: Container
                                    (
                                      height: MediaQuery.of(context).size.height *0.2 -100,
                                      child : ListTile
                                      (
                                        title: Text
                                        (
                                          "${history.cartList.value[index].date.substring(0,10) + ' ' + history.cartList.value[index].date.substring(11,19)}"
                                        ),
                                        subtitle: Text
                                        (
                                          "Total product : ${history.cartList.value[index].products.length}"
                                        ),
                                        trailing: Icon(Icons.arrow_forward_ios),
                                        onTap: ()=> null,
                                      ),
                                    ),
                                  );
                                },
                              );
                            }
                            else
                            {
                              return Center
                              (
                                child :  CircularProgressIndicator()
                              );
                            }
                          }
                        )
                      ],
                    ),

                  );
                }
                else
                {
                  return LoginWidget();
                }
              },
            );
          }
          else
          {
            return Center
            (
              child: CircularProgressIndicator(),
            );
          }
        }
      )
    );
  }
}
