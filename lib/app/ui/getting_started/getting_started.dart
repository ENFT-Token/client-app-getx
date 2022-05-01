import 'package:flutter/material.dart';

import 'package:enft/app/ui/getting_started/components/body.dart';

class GettingStartedPage extends StatelessWidget {
  GettingStartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GettingStartedBody(),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.of(context).push(
      //         // MaterialPageRoute(builder: (context) => HomePage(title: "")));
      //         MaterialPageRoute(builder: (context) => RegisterPage()));
      //   },
      // ),
    );
  }
}
// class GettingStartedPage extends StatefulWidget {
//   const GettingStartedPage({Key? key, required this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   State<GettingStartedPage> createState() => _GettingStartedPageState();
// }
//
// class _GettingStartedPageState extends State<GettingStartedPage> {
//   late LoadingHud hud;
//
//   @override
//   void initState() {
//     hud = LoadingHud(context);
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     double belowSlideDotsHeight = 94.0; // 88+6
//     double pageViewHeight = 304.0; // 200 + 16*2 + 24 + 16 + 16*2
//     double paddingSlideDotsFromBtn = (height -
//             (belowSlideDotsHeight + pageViewHeight + kDefaultPadding * 2)) /
//         4;
//
//     Future<void> accessLocation() async {
//       hud.showHud();
//       Location location = Location();
//
//       bool _serviceEnabled;
//       PermissionStatus _permissionGranted;
//
//       _serviceEnabled = await location.serviceEnabled();
//       if (!_serviceEnabled) {
//         _serviceEnabled = await location.requestService();
//         if (!_serviceEnabled) {
//           hud.hideHud();
//           return;
//         }
//       }
//
//       _permissionGranted = await location.hasPermission();
//       if (_permissionGranted == PermissionStatus.denied) {
//         _permissionGranted = await location.requestPermission();
//         if (_permissionGranted != PermissionStatus.granted) {
//           hud.hideHud();
//           return;
//         }
//       }
//
//       LocationData _locationData;
//       _locationData = await location.getLocation();
//
//       try {
//         context.read<LocationProvider>().addressList = (await fetchData(
//             5,
//             _locationData.longitude.toString(),
//             _locationData.latitude.toString()));
//       } catch (e) {
//         hud.hideHud();
//         return;
//       }
//
//       hud.hideHud();
//       Navigator.of(context).push(MaterialPageRoute(
//         builder: (context) => const LocationPage(),
//       ));
//     }
//
//     return Scaffold(
//       body: Stack(children: [
//         Padding(
//           padding: const EdgeInsets.all(kDefaultPadding),
//           child: Column(
//             children: <Widget>[
//               Expanded(child: StartedPageView()),
//               SizedBox(height: paddingSlideDotsFromBtn),
//               LoginField(press: accessLocation)
//             ],
//           ),
//         )
//       ]),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.of(context).push(
//               // MaterialPageRoute(builder: (context) => HomePage(title: "")));
//               MaterialPageRoute(builder: (context) => RegisterPage()));
//         },
//       ),
//     );
//   }
// }
