import 'package:get/get.dart';

import 'package:enft/app/route/routes.dart';

import 'package:enft/app/binding/getting_started.dart';
import 'package:enft/app/binding/klip.dart';
import 'package:enft/app/binding/register.dart';
import 'package:enft/app/binding/image.dart';
import 'package:enft/app/binding/location.dart';
import 'package:enft/app/binding/user.dart';

import 'package:enft/app/ui/home/home.dart';
import 'package:enft/app/ui/splash/splash.dart';
import 'package:enft/app/ui/getting_started/getting_started.dart';
import 'package:enft/app/ui/register/register.dart';
import 'package:enft/app/ui/register_profile/register_profile.dart';
import 'package:enft/app/ui/location/location.dart';

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
        binding: RegisterBinding()),
    GetPage(
      name: '/register_profile',
      page: () => RegisterProfilePage(),
      binding: ImageBinding(),
    ),
    GetPage(
        name: '/location',
        page: () => LocationPage(),
        binding: LocationBinding()),
    GetPage(name: '/home', page: () => HomePage()),
  ];
}
