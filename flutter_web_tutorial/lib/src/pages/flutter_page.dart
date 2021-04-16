import 'package:flutter/material.dart';
import 'package:flutter_web_tutorial/src/controller/screen_layout_controller.dart';
import 'package:flutter_web_tutorial/src/pages/flutter_contents.dart';
import 'package:flutter_web_tutorial/src/template/default_template.dart';

class FlutterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTemplate(
      contents: FlutterContents(ScreenLayoutController.to.type.value),
    );
  }
}
