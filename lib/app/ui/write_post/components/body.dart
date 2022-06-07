import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import 'package:enft/app/constant/constant.dart';
import 'package:enft/app/controller/post_list.dart';
import 'package:enft/app/controller/image.dart';

import 'package:enft/app/ui/write_post/components/photo_swiper.dart';

import 'text_field_with_title.dart';
import 'text_field_container.dart';

class WriteBody extends GetView<PostListController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                SizedBox(
                  height: kDefaultPadding * 2,
                ),
                Obx(() => GestureDetector(
                    onTap: () async => await ImageController.to
                        .pickMultiImg()
                        .then((value) =>
                            value.forEach((e) => controller.images.add(e))),
                    child: SizedBox(
                        height: size.height * 0.25,
                        child: controller.images.isEmpty
                            ? ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 3,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                      padding: const EdgeInsets.only(
                                          right: kDefaultPadding),
                                      child: index == 0
                                          ? Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Container(
                                                  height: size.height * 0.25,
                                                  width: (size.width -
                                                          kDefaultPadding * 3) /
                                                      2,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      border: Border.all(
                                                          color: kPrimaryColor),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16)),
                                                ),
                                                Icon(Icons.add_rounded)
                                              ],
                                            )
                                          : Container(
                                              height: size.height * 0.25,
                                              width: (size.width -
                                                      kDefaultPadding * 3) /
                                                  2,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  border: Border.all(
                                                      color: kPrimaryColor),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16)),
                                            ));
                                })
                            : ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.images.length + 1,
                                itemBuilder: (BuildContext context, int index) {
                                  if (index == controller.images.length) {
                                    return Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Container(
                                          height: size.height * 0.25,
                                          width: (size.width -
                                                  kDefaultPadding * 3) /
                                              2,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                  color: kPrimaryColor),
                                              borderRadius:
                                                  BorderRadius.circular(16)),
                                        ),
                                        Icon(Icons.add_rounded)
                                      ],
                                    );
                                  } else {
                                    return Padding(
                                        padding: const EdgeInsets.only(
                                            right: kDefaultPadding),
                                        child: Container(
                                          height: size.height * 0.25,
                                          width: (size.width -
                                                  kDefaultPadding * 3) /
                                              2,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                color: kPrimaryColor),
                                            borderRadius:
                                                BorderRadius.circular(16),
                                            image: DecorationImage(
                                              image: FileImage(
                                                  controller.images[index]),
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ));
                                  }
                                })))),
              ],
            )));
  }
}
