import 'package:enft/app/ui/gym_explore/gym_explore.dart';
import 'package:get/get.dart';

import 'package:enft/app/route/routes.dart';

// register
import 'package:enft/app/binding/splash.dart';
import 'package:enft/app/binding/getting_started.dart';
import 'package:enft/app/binding/klip.dart';
import 'package:enft/app/binding/register.dart';
import 'package:enft/app/binding/image.dart';
import 'package:enft/app/binding/location.dart';
import 'package:enft/app/binding/user.dart';

// register
import 'package:enft/app/ui/splash/splash.dart';
import 'package:enft/app/ui/getting_started/getting_started.dart';
import 'package:enft/app/ui/register/register.dart';
import 'package:enft/app/ui/register_profile/register_profile.dart';
import 'package:enft/app/ui/location/location.dart';

// after login
import 'package:enft/app/binding/home.dart';
import 'package:enft/app/binding/ticket.dart';
import 'package:enft/app/binding/post.dart';
import 'package:enft/app/binding/chat.dart';
import 'package:enft/app/binding/request_ticket.dart';

// after login
import 'package:enft/app/ui/home/home.dart';
import 'package:enft/app/ui/send_klay/send_klay.dart';
import 'package:enft/app/ui/send_ticket/send_ticket.dart';

// post
import 'package:enft/app/ui/request_ticket/request_ticket.dart';
import 'package:enft/app/ui/write_post/write_post.dart';

import '../binding/gym_explore.dart';

class AppRoutes implements Routes {
  static final routes = [
    GetPage(
        name: Routes.INITIAL,
        page: () => SplashPage(),
        bindings: [SplashBinding(), KlipBinding(), UserBinding(), ImageBinding(), GymExploreBinding()]),

    // Register pages
    GetPage(
        name: '/getting_started',
        page: () => GettingStartedPage(),
        bindings: [GettingStartedBinding(), KlipBinding(), RegisterBinding()]),
    GetPage(
        name: '/register',
        page: () => RegisterPage(),
        binding: RegisterBinding()),
    GetPage(
      name: '/register_profile',
      page: () => RegisterProfilePage(),
      bindings: [ImageBinding(), RegisterBinding()],
    ),
    GetPage(
        name: '/location',
        page: () => LocationPage(),
        bindings: [LocationBinding(), RegisterBinding(), UserBinding()]),

    // after login pages
    GetPage(name: '/home', page: () => HomePage(), bindings: [
      UserBinding(),
      HomeBinding(),
      TicketBinding(),
      GymExploreBinding(),
      PostBinding(),
      ChatBinding(),
    ]),
    GetPage(
        name: '/wallet/send_klay',
        page: () => SendKlayPage(),
        bindings: [KlipBinding()]),
    GetPage(
        name: '/wallet/send_ticket',
        page: () => SendTicketPage(),
        bindings: [UserBinding(), KlipBinding()]),
    GetPage(
        name: '/post/write',
        page: () => WritePostPage(),
        transition: Transition.downToUp,
        bindings: [ImageBinding()]),
    GetPage(
        name: '/post/gym_name/request_ticket',
        page: () => RequestTicketPage(),
        bindings: [RequestTicketBinding()]),
    GetPage(name: '/gym_explore', page: () => GymExplorePage(), bindings: [
      GymExploreBinding(),
    ]),
  ];
}
