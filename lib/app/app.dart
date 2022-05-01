import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:enft/app/binding/splash.dart';
import 'package:enft/app/route/app_routes.dart';

class EnftApp extends StatelessWidget {
  EnftApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Codelivery',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      initialRoute: AppRoutes.routes.first.toString(),
      initialBinding: InitialBinding(),
      getPages: AppRoutes.routes
    );
  }
}