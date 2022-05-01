import 'package:get/get.dart';

import 'package:enft/app/route/routes.dart';

import 'package:enft/app/binding/getting_started.dart';
import 'package:enft/app/binding/klip.dart';
import 'package:enft/app/binding/register.dart';
import 'package:enft/app/binding/user.dart';

import 'package:enft/app/ui/home/home.dart';
import 'package:enft/app/ui/splash/splash.dart';
import 'package:enft/app/ui/getting_started/getting_started.dart';
import 'package:enft/app/ui/register/register.dart';

class AppRoutes implements Routes {
  static final routes = [
    GetPage(name: Routes.INITIAL, page: () => SplashPage()),
    GetPage(
        name: '/getting_started',
        page: () => GettingStartedPage(),
        bindings: [
          GettingStartedBinding(),
          KlipBinding(),
        ]),
    GetPage(
      name: '/register',
      page: () => RegisterPage(),
      binding: RegisterBinding(),
    ),
    GetPage(name: '/home', page: () => HomePage()),
  ];
}
