import 'dart:io';
import 'package:enft/app/data/model/user.dart';

class Post {
  late String title;
  late String content;
  late String cost;
  late DateTime createAt;
  late List<File> images;
  late String location;
  late String nickname;
  late File profile;
  late String address;

  Post(
      {required this.title,
      required this.content,
      required this.cost,
      required this.createAt,
      required this.images,
      required this.location,
      required this.nickname,
      required this.profile,
      required this.address});

  Post.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    content = json['content'];
    cost = json['cost'];
    createAt = DateTime.parse(json['createAt']);
    images = json['images'];
    location = json['location'];
    profile = File(json['profile']);
    nickname = json['nickname'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = content;
    data['content'] = content;
    data['cost'] = cost;
    data['createAt'] = createAt.toString();
    data['images'] = images;
    data['location'] = location;
    data['nickname'] = nickname;
    data['profile'] = profile.path;
    data['address'] = address;

    return data;
  }
}
