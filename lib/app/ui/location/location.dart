import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:enft/app/controller/location.dart';
import 'package:enft/app/ui/location/components/body.dart';

class LocationPage extends GetView<LocationController> {
  const LocationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: buildAppBar(),
            body: LocationBody())));
  }

  AppBar buildAppBar() {
    return AppBar(
      title: TextField(
        textInputAction: TextInputAction.go,
        onChanged: (value) {
          if (value == "" && !controller.isEqualLists)
            controller.searchLocation(value);
        },
        onSubmitted: (value) => controller.searchLocation(value),
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.search),
          hintText: '지역을 입력해주세요. (동명(읍,면)으로 검색)',
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black12)),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black12),
          ),
          border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black12)),
        ),
      ),
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
    );
  }
}
