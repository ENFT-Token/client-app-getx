// import 'package:flutter/material.dart';
//
// import 'package:enft/app/constant/constant.dart';
// import 'package:blue/src/model/User.dart';
//
// class WriterInfo extends StatelessWidget {
//   const WriterInfo({Key? key, required this.user}) : super(key: key);
//
//   final User user;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//         padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
//         child: Row(
//           children: [
//             InkWell(
//               onTap: () {},
//               child: Container(
//                 height: 40,
//                 width: 40,
//                 decoration: BoxDecoration(
//                     shape: BoxShape.circle,
//                     image: DecorationImage(image: AssetImage(user.profile))),
//               ),
//             ),
//             const SizedBox(
//               width: kDefaultPadding / 2,
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   user.nickname,
//                   style: const TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18,
//                   ),
//                 ),
//                 const SizedBox(
//                   height: kDefaultPadding / 4,
//                 ),
//                 Text(
//                   user.location,
//                   style: TextStyle(color: Colors.grey.shade700, fontSize: 14),
//                 )
//               ],
//             )
//           ],
//         ));
//   }
// }
