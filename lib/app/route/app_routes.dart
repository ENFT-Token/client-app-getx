import 'package:get/get.dart';

import 'package:enft/app/route/routes.dart';

import 'package:enft/app/ui/home/home.dart';
import 'package:enft/app/ui/splash/splash.dart';

class AppRoutes implements Routes {
  static final routes = [
    GetPage(name: Routes.INITIAL, page: () => SplashPage()),
    GetPage(name: '/home', page: () => HomePage()),
  ];
}