import 'package:flutter/material.dart';
import 'package:flutter_web_tutorial/src/pages/flutter_page.dart';
import 'package:get/get.dart';
import 'src/controller/screen_layout_controller.dart';
import 'src/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding: BindingsBuilder(() {
        Get.put(ScreenLayoutController());
      }),
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => HomePage(),
        ),
        GetPage(
          name: '/flutter',
          page: () => FlutterPage(),
        ),
      ],
      home: HomePage(),
    );
  }
}
