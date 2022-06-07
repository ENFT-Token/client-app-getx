import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'package:enft/app/constant/constant.dart';
import 'package:enft/app/controller/post_list.dart';
import 'package:enft/app/controller/image.dart';

import 'package:enft/app/ui/write_post/components/photo_swiper.dart';

import '../../deposit_klay/components/text_field_with_title.dart';
import '../../register/components/text_field_container.dart';

class WriteBody extends GetView<PostListController> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(kDefaultPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFieldWithTitle(
                  title: Text(
                    "제목",
                    style: TextStyle(
                      color: kSystemGray,
                      fontSize: 16,
                    ),
                  ),
                  child: TextFieldContainer(
                      child: TextField(
                    onChanged: (value) => controller.title = value,
                    onSubmitted: (value) => controller.title = value,
                    decoration: InputDecoration(
                        counterText: '',
                        hintText: "게시글 제목을 입력해주세요",
                        border: InputBorder.none),
                  )),
                ),
                TextFieldWithTitle(
                  title: Text(
                    "제목",
                    style: TextStyle(
                      color: kSystemGray,
                      fontSize: 16,
                    ),
                  ),
                  child: TextFieldContainer(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^(\d*)[\.]?(\d*)?$')),
                      ],
                      decoration: InputDecoration(
                          hintText: '가격(KLAY)을 입력해주세요',
                          border: InputBorder.none),
                      onChanged: (value) =>
                          controller.cost = double.parse(value),
                      onSubmitted: (value) =>
                          controller.cost = double.parse(value),
                    ),
                  ),
                ),
                TextFieldWithTitle(
                  title: Text(
                    "제목",
                    style: TextStyle(
                      color: kSystemGray,
                      fontSize: 16,
                    ),
                  ),
                  child: TextFieldContainer(
                    child: TextField(
                      maxLines: 10,
                      minLines: 1,
                      decoration: InputDecoration(
                          hintText: '내용을 압력해주세요', border: InputBorder.none),
                      onChanged: (value) => controller.content = value,
                      onSubmitted: (value) => controller.content = value,
                    ),
                  ),
                ),
                OutlinedButton(
                    onPressed: () async {
                      await ImageController.to.pickMultiImg().then((value) =>
                          value.forEach((e) => controller.images.add(e)));
                      //controller.images = await ImageController.to.pickMultiImg();
                      print(controller.images);
                    },
                    child: Text("이미지 업로드")),
              ],
            )));
  }
}
