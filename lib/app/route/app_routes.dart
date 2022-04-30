import 'package:get/get.dart';

import 'package:enft/app/route/routes.dart';

import 'package:enft/app/ui/home/home.dart';

class AppRoutes implements Routes {
  static final routes = [
    GetPage(name: Routes.INITIAL, page: () => HomePage()),
  ];
}