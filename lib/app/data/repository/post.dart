import 'package:enft/app/data/provider/post_api.dart';

class PostRepository {
  PostApiClient apiClient;

  PostRepository({required this.apiClient});

  writePost(Map<String, dynamic> data, String access_token) async => await apiClient.writePost(data, access_token);
  getPost() async => await apiClient.getPost();
}