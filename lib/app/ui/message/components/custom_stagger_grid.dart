import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CustomStaggerGrid extends StatelessWidget {
  CustomStaggerGrid({Key? key, required this.images}) : super(key: key);

  final List<dynamic> images;
  int crossAxisCellCount = 0;
  int mainAxisCellCount = 0;

  @override
  Widget build(BuildContext context) {
    if (images.length == 1) {
      return Container(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.55),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.memory(
              base64Decode(images[0])
            )),
      );
    }
    return ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.8,
                maxWidth: MediaQuery.of(context).size.width * 0.55),
            child: StaggeredGrid.count(
                crossAxisCount: 6,
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
                children: List.generate(images.length, (index) {
                  if (images.length % 3 == 1) {
                    if (images.length == 4) {
                      crossAxisCellCount = 3;
                      mainAxisCellCount = 3;
                    } else if (index < images.length - 4) {
                      crossAxisCellCount = 2;
                      mainAxisCellCount = 2;
                    } else {
                      crossAxisCellCount = 3;
                      mainAxisCellCount = 2;
                    }
                  } else if (images.length % 3 == 2) {
                    if (images.length == 2) {
                      crossAxisCellCount = 3;
                      mainAxisCellCount = 3;
                    }
                    else if (index < images.length - 2) {
                      crossAxisCellCount = 2;
                      mainAxisCellCount = 2;
                    } else {
                      crossAxisCellCount = 3;
                      mainAxisCellCount = 2;
                    }
                  } else {
                    crossAxisCellCount = 2;
                    mainAxisCellCount = 2;
                  }
                  return StaggeredGridTile.count(
                    crossAxisCellCount: crossAxisCellCount,
                    mainAxisCellCount: mainAxisCellCount,
                    child: Tile(image: images[index]),
                  );
                }))));
  }
}

class Tile extends StatelessWidget {
  const Tile({Key? key, required this.image}) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Image.memory(base64Decode(image), fit: BoxFit.cover));
  }
}
