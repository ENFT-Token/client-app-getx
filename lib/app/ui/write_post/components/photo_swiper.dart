import 'package:flutter/material.dart';

import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';

class PhotoSwiper extends StatelessWidget {
  const PhotoSwiper({Key? key, required this.photos}) : super(key: key);

  final List<String> photos;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 300,
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return Image.asset(
              photos[index],
              fit: BoxFit.fill,
            );
          },
          itemCount: photos.length,
          pagination: const SwiperPagination(),
        ));
  }
}
