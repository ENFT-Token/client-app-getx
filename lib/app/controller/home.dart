import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeController();

  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
        icon: Image.asset(
          'assets/icons/coupon.png',
          height: 33,
          width: 33,
          fit: BoxFit.contain,
        ),
        label: '이용권'),
    BottomNavigationBarItem(
        icon: Image.asset(
          'assets/icons/wallet.png',
          height: 33,
          width: 27,
          fit: BoxFit.contain,
        ),
        label: '지갑'),
    BottomNavigationBarItem(
        icon: Image.asset(
          'assets/icons/list.png',
          height: 33,
          width: 27,
          fit: BoxFit.fitWidth,
        ),
        label: '게시글'),
    BottomNavigationBarItem(
        icon: Image.asset(
          'assets/icons/chat.png',
          height: 33,
          width: 27,
          fit: BoxFit.fitWidth,
        ),
        label: '채팅'),
    BottomNavigationBarItem(
        icon: Image.asset(
          'assets/icons/person.png',
          height: 33,
          width: 33,
          fit: BoxFit.fitWidth,
        ),
        label: '내 정보'),
  ];
  RxInt _currentIndex = 0.obs;

  get currentIndex => _currentIndex.value;

  set currentIndex(value) => _currentIndex.value = value;
}
