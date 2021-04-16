import 'package:flutter/material.dart';
import 'package:flutter_web_tutorial/src/controller/screen_layout_controller.dart';
import 'package:get/get.dart';

class RootContents extends GetView<ScreenLayoutController> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Other researchers (Désilets et al., 2005)',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                textAlign: controller.type.value == ScreenSizeType.MOBILE
                    ? TextAlign.center
                    : TextAlign.left,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Other researchers (Désilets et al., 2005) mention that the ease in accessing a wiki tool and the ability to use it without needing specialized software makes wiki use accessible to a broad user base. Wiki features mentioned in this context are the easy access regardless of place and time (Cabiness, Donovan, & Green, 2013), asynchronous communication (Hsu, 2007) and the use of a Web-based interface (Roussinos & Jimoyiannis, 2013). These features enhance participation and the value of technology in education',
                style: TextStyle(
                  fontSize: 14,
                ),
                textAlign: controller.type.value == ScreenSizeType.MOBILE
                    ? TextAlign.center
                    : TextAlign.left,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
