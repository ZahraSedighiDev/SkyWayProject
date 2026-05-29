import 'package:skywayproject/Core/widgets/center_child/mobile_tab_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skywayproject/Core/theme/app_colors.dart';
import 'package:skywayproject/Core/widgets/buttons/buttons/app_carousel.dart';
import 'package:skywayproject/Core/widgets/center_child/widgets/expandable_tab.dart';

class CenterChildMobile extends StatefulWidget {
  final AppCarouselController controller;

  const CenterChildMobile({
    super.key,
    required this.controller,
  });

  @override
  State<CenterChildMobile> createState() => _CenterChildMobileState();
}
class _CenterChildMobileState extends State<CenterChildMobile> {
  late final MobileTabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = Get.put(MobileTabController(), tag: 'mobile_tab');
  }

  @override
  void dispose() {
    // پاک کردن کنترلر وقتی widget dispose میشه
    Get.delete<MobileTabController>(tag: 'mobile_tab');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return buildMobileCenterChild(tabController);
  }

  Widget buildMobileCenterChild(MobileTabController controller) {
    return Container(
      margin: const EdgeInsets.only(top: 430),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.navy500,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// TAB 0
          MobileExpandableTab(
            index: 0,
            icon: Icons.airplanemode_active_outlined,
            title: 'Ticket Purchase'.tr,
            controller: controller,
          ),

          const SizedBox(height: 10),

          /// TAB 1
          MobileExpandableTab(
            index: 1,
            icon: Icons.airline_seat_recline_normal,
            title: 'Online Check-in'.tr,
            controller: controller,
          ),

          const SizedBox(height: 10),

          /// TAB 2
          MobileExpandableTab(
            index: 2,
            icon: Icons.view_list,
            title: 'My Trips'.tr,
            controller: controller,
          ),
        ],
      ),
    );
  }
}


Widget buildMobileCenterChild(MobileTabController controller) {
  return Container(
    margin: const EdgeInsets.only(top: 430),
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
      color: AppColors.navy500,
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [

        /// TAB 0
         MobileExpandableTab(
           index :0 ,
           icon: Icons.airplanemode_active_outlined,
           title: 'Ticket Purchase'.tr,
           controller: controller,
         ) ,


        const SizedBox(height: 10),

        /// TAB 1
        MobileExpandableTab(
          index: 1,
          icon: Icons.airline_seat_recline_normal,
          title: 'Online Check-in'.tr,
          controller: controller,
        ),

        const SizedBox(height: 10),

        /// TAB 2
        MobileExpandableTab(
          index: 2,
          icon: Icons.view_list,
          title: 'My Trips'.tr,
          controller: controller,
        ),
      ],
    ),
  );
}




