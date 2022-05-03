import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeController();

  List<BottomNavigationBarItem> items = const [
    BottomNavigationBarItem(icon: Icon(Icons.smartphone_rounded), label: '이용권'),
    BottomNavigationBarItem(
        icon: Icon(Icons.account_balance_wallet_rounded), label: '지갑'),
    BottomNavigationBarItem(icon: Icon(Icons.view_list_rounded), label: '게시글'),
    BottomNavigationBarItem(icon: Icon(Icons.chat_rounded), label: '채팅'),
    BottomNavigationBarItem(icon: Icon(Icons.people), label: '내 정보'),
  ];
  RxInt _currentIndex = 0.obs;

  get currentIndex => _currentIndex.value;

  set currentIndex(value) => _currentIndex.value = value;
}
