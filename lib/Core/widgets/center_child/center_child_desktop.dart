import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skywayproject/Core/theme/app_colors.dart';
import 'package:skywayproject/Core/theme/app_font_style.dart';
import 'package:skywayproject/Core/theme/app_shadows.dart';
import 'package:skywayproject/Core/widgets/buttons/buttons/app_carousel.dart';
import 'package:skywayproject/Core/widgets/center_child/widgets/tab_content.dart';

class CenterChildDesktop extends StatelessWidget {
  final AppCarouselController controller;

  const CenterChildDesktop({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top:300),
        height: 200,
        width:  1900,
        decoration: BoxDecoration(
          boxShadow: AppShadows.large,
          color: AppColors.buttonColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Column(
            children: [
              // Tab Bar
              SizedBox(
                height: 50,
                child: Row(
                  children: [
                    _buildTab(
                      index: 0,
                      icon: Icons.airplanemode_active_outlined,
                      label: "Ticket Purchase",
                      controller: controller,
                    ),
                    _buildTab(
                      index: 1,
                      icon: Icons.airline_seat_recline_normal,
                      label: "Online Check in",
                      controller: controller,
                    ),
                    _buildTab(
                      index: 2,
                      icon: Icons.view_list,
                      label: "My Trips",
                      controller: controller,
                    ),
                  ],
                ),
              ),

              // Tab Content
              Expanded(
                child: Obx(() {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: DesktopTabContent(
                      index: controller.selectedTab.value,
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }


  BorderRadius? _tabRadius(int index, int selectedIndex) {
    if (index != selectedIndex) return null;

    // اگر تب اول انتخاب شده
    if (index == 0) {
      return const BorderRadius.only(
        topLeft: Radius.circular(12),
      );
    }

    // اگر تب آخر انتخاب شده
    if (index == 2) {
      return const BorderRadius.only(
        topRight: Radius.circular(12),
      );
    }

    return null;
  }
  Widget _buildTab({
    required int index,
    required IconData icon,
    required String label,
    required AppCarouselController controller,
  }) {
    return Expanded(
      child: Obx(() {
        bool isSelected = controller.selectedTab.value == index;
        return MouseRegion(
          cursor: SystemMouseCursors.click,
          child: InkWell(
            onTap: () {
              controller.selectedTab.value = index;
            },
            child: Container(
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: isSelected
                    ? Colors.white.withOpacity(.7)
                    : AppColors.navy500,
                borderRadius: _tabRadius(
                  index,
                  controller.selectedTab.value,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    color: isSelected ? AppColors.navy500 : AppColors.buttonColor,
                    size: 24,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    label,
                    style: AppFontStyleColor.bigTextStyle(
                      isSelected ? AppColors.navy500 : AppColors.buttonColor,
                    ).copyWith(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}


