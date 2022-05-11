// import 'package:flutter/material.dart';
//
// import 'package:blue/src/helper.dart';
// import 'package:blue/src/model/Post.dart';
//
// class MainText extends StatelessWidget {
//   final Post post;
//
//   const MainText({Key? key, required this.post}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(post.title,
//             style: const TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 20,
//                 color: Colors.black)),
//         const SizedBox(
//           height: kDefaultPadding,
//         ),
//         Text(
//           distanceTimeFromNow(post.time),
//           style: TextStyle(color: Colors.grey.shade600),
//         ),
//         const SizedBox(
//           height: kDefaultPadding,
//         ),
//         Text(
//           post.description,
//           style: const TextStyle(fontSize: 16, color: Colors.black),
//         ),
//         const SizedBox(
//           height: kDefaultPadding,
//         ),
//         // Row(
//         //   children: [
//         //     Text(
//         //       countText,
//         //       style: TextStyle(color: Colors.grey.shade600),
//         //     )
//         //   ],
//         // )
//       ],
//     );
//   }
// }
