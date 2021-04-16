import 'package:flutter/material.dart';
import 'package:flutter_web_tutorial/src/template/default_template.dart';
import '../controller/screen_layout_controller.dart';
import 'root_contents.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTemplate(
      contents: RootContents(),
    );
  }
}
