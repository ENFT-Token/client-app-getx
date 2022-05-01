import 'package:enft/app/data/model/klip.dart';

class User {
  late String nickname;
  late String sex;
  late Klip klip;

  User({nickname, sex, klip}) {
    this.nickname = nickname;
    this.sex = sex;
    this.klip = klip;
  }

  User.fromJson(Map<String, dynamic> json) {
    nickname = json['nickname'];
    sex = json['sex'];
    klip = Klip.fromJson(json['klip']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nickname'] = nickname;
    data['sex'] = sex;
    data['klip'] = klip.toJson();

    return data;
  }
}
