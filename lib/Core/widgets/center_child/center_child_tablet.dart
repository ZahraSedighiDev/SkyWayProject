import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skywayproject/Core/theme/app_colors.dart';
import 'package:skywayproject/Core/theme/app_font_style.dart';
import 'package:skywayproject/Core/theme/app_shadows.dart';
import 'package:skywayproject/Core/widgets/buttons/buttons/app_carousel.dart';
import 'package:skywayproject/Core/widgets/center_child/widgets/tab_content.dart';

class CenterChildTablet extends StatelessWidget {
  final AppCarouselController controller;

  const CenterChildTablet({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 271 ,
       margin: const EdgeInsets.only(top: 400),
      constraints: const BoxConstraints(
        maxWidth:850 ,
      ),
      decoration: BoxDecoration(
        boxShadow: AppShadows.large ,
        color: AppColors.buttonColor,
        borderRadius:  BorderRadius.circular(12)

      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            Row(
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

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Obx(
                      () => AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    child: SizedBox(
                      width: double.infinity,
                      child: TabletTabContent(
                        key: ValueKey(controller.selectedTab.value),
                        index: controller.selectedTab.value,
                      ),
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),


    );
  }
}
Widget _buildTab({required int index,
  required IconData icon,
  required String label,
  required AppCarouselController controller
}) {
  return Expanded(
    child: Obx( () {
      bool isSelected = controller.selectedTab
          .value == index;
      return MouseRegion(
        cursor: SystemMouseCursors.click,
        child: InkWell(
          onTap: () {
            controller.selectedTab.value = index;
          },
          child: Container(
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: isSelected ?
              Colors.white :
              AppColors.navy500,


            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: isSelected ? AppColors.navy500 : AppColors.buttonColor),
                const SizedBox(width: 6),
                Text(
                  label,
                  style: AppFontStyleColor.bigTextStyle(isSelected ? AppColors.navy500 : AppColors.buttonColor),
                ),
              ],
            ),
          ),
        ),
      );
    }),
  );
}


