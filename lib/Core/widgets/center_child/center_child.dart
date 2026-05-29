import 'package:flutter/material.dart';
import 'package:skywayproject/Core/widgets/buttons/buttons/app_carousel.dart';
import 'package:skywayproject/Core/widgets/center_child/center_child_desktop.dart';
import 'package:skywayproject/Core/widgets/center_child/center_child_mobile.dart';
import 'package:skywayproject/Core/widgets/center_child/center_child_tablet.dart';
class CenterChild extends StatelessWidget {
  final AppCarouselController controller;

  const CenterChild({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width < 740) {
      return CenterChildMobile(controller: controller);
    } else if (width < 1260) {
      return CenterChildTablet(controller: controller);
    } else {
      return CenterChildDesktop(controller: controller);
    }
  }
}
