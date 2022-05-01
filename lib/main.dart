import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:enft/app/app.dart';

void main() async {
  // 화면 세로로만
  // 가로 추가하고 싶을 시에는 landscapeLeft이나 landscapeRight
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await dotenv.load(fileName: '.env');
  runApp(EnftApp());
}

