import 'package:flutter/material.dart';
import 'package:flutter_web_tutorial/src/controller/screen_layout_controller.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class NavigationMenu extends GetView<ScreenLayoutController> {
  ScreenSizeType screenSizeType;
  NavigationMenu(this.screenSizeType);

  Widget menu(String menu, GestureTapCallback onTap) {
    return InkWell(
      mouseCursor: MaterialStateMouseCursor.clickable,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Text(
          menu,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _menuGroup() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        menu('홈', () {
          Get.toNamed('/');
        }),
        menu('블로그', () {
          launch(
              'https://www.notion.so/flutter-web-248761d54bd54c988b0516f1d36ddac1');
        }),
        menu('유튜브', () {
          launch('https://www.youtube.com/channel/UChLokSuNw20RhVnzXOs5A6g');
        }),
      ],
    );
  }

  Widget _mobileLayout() {
    return Container(
      child: Column(
        children: [
          Image.asset(
            "assets/images/logo.jpg",
            width: 80,
          ),
          SizedBox(
            height: 20,
          ),
          _menuGroup(),
        ],
      ),
    );
  }

  Widget _desktopLayout() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            "assets/images/logo.jpg",
            width: 80,
          ),
          _menuGroup(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (screenSizeType) {
      case ScreenSizeType.MOBILE:
        return _mobileLayout();
        break;
      case ScreenSizeType.TABLET:
        return _mobileLayout();
        break;
      case ScreenSizeType.DESKTOP:
        return _desktopLayout();
        break;
    }
  }
}
