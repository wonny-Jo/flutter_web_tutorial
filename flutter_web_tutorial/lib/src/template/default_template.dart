import 'package:flutter/material.dart';
import 'package:flutter_web_tutorial/src/components/footer.dart';
import 'package:flutter_web_tutorial/src/components/navigation_menu.dart';
import 'package:flutter_web_tutorial/src/components/right_menu.dart';
import 'package:flutter_web_tutorial/src/controller/screen_layout_controller.dart';
import 'package:get/get.dart';

class DefaultTemplate extends StatelessWidget {
  Widget? contents;
  DefaultTemplate({this.contents});
  final GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();

  Widget _contentView() {
    List<Widget> list = [Expanded(child: contents!)];
    if (ScreenLayoutController.to.type.value != ScreenSizeType.MOBILE) {
      list.add(RightMenu(
        width: ScreenLayoutController.to.type.value == ScreenSizeType.TABLET
            ? 100
            : 150,
      ));
    }
    return Row(
      children: list,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              ScreenLayoutController.to.builder(constraints);
              return Container();
            },
          ),
          Obx(
            () => Scaffold(
              key: _key,
              drawer: Container(
                width: Get.size.width * 0.7,
                color: Colors.white,
                child: Container(
                  margin: const EdgeInsets.only(top: 50, left: 20),
                  child: RightMenu(),
                ),
              ),
              body: Container(
                alignment: Alignment.topCenter,
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 1280),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          InkWell(
                            onTap: () {
                              _key.currentState?.openDrawer();
                            },
                            child: Container(
                              width: 80,
                              height: 80,
                              child: Icon(Icons.menu),
                            ),
                          ),
                          NavigationMenu(ScreenLayoutController.to.type.value),
                        ],
                      ),
                      Expanded(child: _contentView()),
                      Footer(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
