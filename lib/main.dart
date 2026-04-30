import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fresco/app.dart';

void main() async {
  int i = 10;
  print(i);

  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const FrescoApp());
}
