import 'package:ecomerce/app/app_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/shared/UserPreferences.dart';

void main() async
{ 
  WidgetsFlutterBinding.ensureInitialized();
  await UserPrefrences().init();
  runApp
  (
    ModularApp
    (
      module: AppModule()
    )
  );
} 
