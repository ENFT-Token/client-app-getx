import 'dart:io';

import 'package:flutter/material.dart';

import 'package:enft/app/data/model/message.dart';
import 'package:enft/app/ui/message/components/custom_stagger_grid.dart';

class ImageMessage extends StatelessWidget {
  const ImageMessage({Key? key, required this.message}) : super(key: key);

  final Message message;

  @override
  Widget build(BuildContext context) {
    return CustomStaggerGrid(images: message.images!);
  }
}
