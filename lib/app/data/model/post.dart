import 'package:enft/app/data/model/user.dart';

class Post {
  late String title;
  late String content;
  late String cost;
  // late List<String> images;
  late User user;

  Post({title, content, cost, images, user}) {
    this.title = title;
    this.content = content;
    this.cost = cost;
    // this.images = images;
    this.user = user;
  }

  Post.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    content = json['content'];
    cost = json['cost'];
    // images = json['images'];
    user = User.fromJson(json['user']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = content;
    data['content'] = content;
    data['cost'] = cost;
    // data['location'] = user.location;
    // data['images'] = images;
    data['access_token'] = user.access_token;

    return data;
  }
}
