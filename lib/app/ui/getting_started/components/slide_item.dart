import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

import 'package:enft/app/constant/constant.dart';

class SlideItem extends StatelessWidget {
  final int index;

  const SlideItem(this.index, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    // total height = width / 1.5 + kDefaultPadding * 3 + 34 + 24
    return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                width: width / 1.5,
                height: width / 1.5,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Lottie.asset(slideList[index].imageUrl)),
            const SizedBox(height: kDefaultPadding * 2),
            Text(slideList[index].title,
                style: TextStyle(
                  fontSize: 30,
                  color: Color(0xff216FEA),
                )),
            const SizedBox(height: kDefaultPadding),
            Text(
              slideList[index].descrption,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
              ),
            )
          ],
        ));
  }
}

class Slide {
  final String imageUrl;
  final String title;
  final String descrption;

  Slide({
    required this.imageUrl,
    required this.title,
    required this.descrption,
  });
}

final slideList = [
  Slide(
      imageUrl: 'assets/lottie/getting-started-coch.json',
      title: '안전한 헬스장',
      descrption: '고유한 QR코드로\n헬스장 무단이용을 방지합니다'),
  Slide(
      imageUrl: 'assets/lottie/getting-started-lifestyle.json',
      title: '온라인 이용권 양도',
      descrption: '서류 작성 없이 주변 동네 사람과\n이용권을 양도해보세요!'),
  Slide(
      imageUrl: 'assets/lottie/getting-started-treadmill.json',
      title: '시작해보세요!',
      descrption: '여러분의 소중한 운동을 위해서\n최선을 다하겠습니다.'),
];
