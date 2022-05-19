import 'dart:io';

import 'package:enft/app/data/model/klip.dart';

class User {
  late String access_token;
  late String nickname;
  late String sex;
  late Klip klip;
  late File profile;
  late String location;

  User({access_token, nickname, sex, klip, profile, location}) {
    this.access_token = access_token;
    this.nickname = nickname;
    this.sex = sex;
    this.klip = klip;
    this.profile = profile;
    this.location = location;
  }

  User.fromJson(Map<String, dynamic> json) {
    access_token = json['access_token'];
    nickname = json['nickname'];
    sex = json['sex'];
    profile = json['profile'];
    location = json['location'];
    klip = Klip.fromJson(json['klip']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nickname'] = nickname;
    data['sex'] = sex;
    data['address'] = klip.address;
    data['profile'] = profile;
    data['location'] = location;

    return data;
  }
}
