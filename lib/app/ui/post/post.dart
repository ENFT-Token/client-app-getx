
// import 'package:flutter/material.dart';
//
// import 'package:enft/app/constant/constant.dart';
// import 'package:blue/src/model/Post.dart';
// import 'package:blue/src/model/User.dart';
//
// import 'package:enft/app/ui/post/components/body.dart';
//
// class PostPage extends StatelessWidget {
//   final Post post;
//   final User user;
//
//   PostPage({Key? key, required this.post, required this.user})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//         bottomNavigationBar: buildBottomNavigationBar(),
//         body: PostBody(post: post, user: user));
//   }
//
//   BottomAppBar buildBottomNavigationBar() {
//     return BottomAppBar(
//         color: Colors.white,
//         elevation: 0,
//         child: Column(mainAxisSize: MainAxisSize.min, children: [
//           const Divider(
//             height: 1,
//             thickness: 1,
//           ),
//           Padding(
//             padding: const EdgeInsets.all(kDefaultPadding),
//             child: Row(
//               children: [
//                 InkWell(
//                     onTap: () {},
//                     child: const Icon(Icons.favorite_border_rounded)),
//                 const SizedBox(width: kDefaultPadding / 2),
//                 const SizedBox(
//                     height: 40,
//                     child: VerticalDivider(
//                       thickness: 1,
//                     )),
//                 const SizedBox(width: kDefaultPadding / 2),
//                 Expanded(
//                     child: Text(currencyFormat(postList[0].price),
//                         style: const TextStyle(
//                             fontWeight: FontWeight.bold, fontSize: 18))),
//                 OutlinedButton(
//                   onPressed: () {},
//                   style: ButtonStyle(
//                     backgroundColor: MaterialStateProperty.all(kPrimaryColor),
//                     foregroundColor: MaterialStateProperty.all(Colors.white),
//                   ),
//                   child: const Text(
//                     "채팅으로 거래하기",
//                     style: TextStyle(fontSize: 16.0),
//                   ),
//                 )
//               ],
//             ),
//           )
//         ]));
//   }
// }
