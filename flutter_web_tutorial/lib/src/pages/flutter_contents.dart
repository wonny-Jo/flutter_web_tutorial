import 'package:flutter/material.dart';
import 'package:flutter_web_tutorial/src/components/right_menu.dart';
import 'package:flutter_web_tutorial/src/controller/screen_layout_controller.dart';

class FlutterContents extends StatelessWidget {
  final ScreenSizeType screenSizeType;

  FlutterContents(this.screenSizeType);
  final ScrollController scrollController = ScrollController();

  Widget _contentsDetail() {
    return SingleChildScrollView(
      controller: scrollController,
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'web 레이아웃 구성',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: screenSizeType == ScreenSizeType.MOBILE
                  ? TextAlign.center
                  : TextAlign.left,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'NavigationMenu를 관리하는 함수를 만들어주었다. Row를 활용하여 logo이미지와 menu 버튼을 넣어주었고 menu 항목에는 클릭시 동작여부를 추가하기 위해서 menu 함수를 만들었다. menu는 InkWell을 통하여 버튼 동작이 가능하도록 하였는데 이를 통해서 각 버튼을 통해서 페이지 연결이 가능하다.',
              style: TextStyle(
                fontSize: 14,
              ),
              textAlign: screenSizeType == ScreenSizeType.MOBILE
                  ? TextAlign.center
                  : TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }

  Widget _contents({bool hasScroll = true}) {
    if (hasScroll) {
      return Scrollbar(
          isAlwaysShown: true,
          controller: scrollController,
          child: _contentsDetail());
    } else {
      return _contentsDetail();
    }
  }

  Widget _mobileLayout() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: _contents(hasScroll: false),
          ),
        ],
      ),
    );
  }

  Widget _tabletLayout() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: _contents(),
          ),
          RightMenu(width: 100),
        ],
      ),
    );
  }

  Widget _desktopLayout() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: _contents(),
          ),
          RightMenu(),
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
        return _tabletLayout();
        break;
      case ScreenSizeType.DESKTOP:
        return _desktopLayout();
        break;
    }
  }
}
