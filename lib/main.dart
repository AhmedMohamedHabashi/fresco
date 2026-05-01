import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fresco/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const FrescoApp());
}
