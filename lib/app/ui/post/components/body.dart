// import 'package:flutter/material.dart';
//
// import 'package:enft/app/constant/constant.dart';
// import 'package:blue/src/model/Post.dart';
// import 'package:blue/src/model/User.dart';
//
// import 'package:enft/app/ui/post/components/photo_swiper.dart';
// import 'package:enft/app/ui/post/components/writer_info.dart';
// import 'package:enft/app/ui/post/components/main_text.dart';
//
// class PostBody extends StatelessWidget {
//   final Post post;
//   final User user;
//
//   PostBody({Key? key, required this.post, required this.user}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           PhotoSwiper(photos: post.photos),
//           // SizedBox(height: kDefaultPadding,),
//           Padding(
//               padding: const EdgeInsets.all(kDefaultPadding),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   WriterInfo(user: user),
//                   Divider(
//                     thickness: 1,
//                   ),
//                   MainText(post: post)
//                 ],
//               ))
//         ],
//       ),
//     );
//   }
// }
