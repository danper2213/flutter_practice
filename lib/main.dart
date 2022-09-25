import 'package:flutter/material.dart';
import 'package:flutter_practice/binding.dart';
import 'package:flutter_practice/theme_custom.dart';
import 'package:flutter_practice/views/home.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeCustom.blueTheme,
      home: const Home(),
      initialBinding: Binding(),
    );
  }
}
