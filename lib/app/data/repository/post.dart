import 'dart:io';
import 'package:enft/app/data/provider/post_api.dart';

import '../model/post.dart';

class PostRepository {
  PostApiClient apiClient;

  PostRepository({required this.apiClient});

  writePost(Map<String, dynamic> data, List<File> images,
          String access_token) async =>
      await apiClient.writePost(data, images, access_token);

  getPost(String location) async {
    List result = await apiClient.getPost(location);

    List<Post> response = List<Post>.empty(growable: true);

    result.forEach((element) {
      List<File> images = List<File>.empty(growable: true);
      List temp = element['image'];

      temp.forEach((image) => images.add(File(image['image'])));

      response.add(Post.fromJson({
        'title': element['title'],
        'content': element['content'],
        'cost': element['cost'],
        'location': element['location'],
        'createAt': element['createAt'],
        'images': images,
        'nickname': element['writer']['nickname'],
        'profile': element['writer']['profile'],
        'address': element['writer']['address']
      }));
    });

    return response;
  }
}
