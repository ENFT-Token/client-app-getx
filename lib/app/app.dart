import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:enft/app/binding/splash.dart';
import 'package:enft/app/route/app_routes.dart';

class EnftApp extends StatelessWidget {
  EnftApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ENFT',
      theme: ThemeData(
        primaryColor: Colors.lightGreen,
      ),
      initialRoute: AppRoutes.routes.first.toString(),
      initialBinding: SplashBinding(),
      getPages: AppRoutes.routes
    );
  }
}