import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:skywayproject/Core/theme/app_colors.dart';
import 'package:skywayproject/Core/theme/app_font_style.dart';
import 'package:skywayproject/Core/widgets/center_child/mobile_tab_controller.dart';
import 'package:skywayproject/Core/widgets/center_child/widgets/tab_content.dart';
import 'package:skywayproject/Core/widgets/center_child/mobile_tab_controller.dart';

class MobileExpandableTab extends StatelessWidget {

  final int index;
  final IconData icon;
  final String title;
  final MobileTabController controller;

  const MobileExpandableTab({
    super.key,
    required this.index,
    required this.icon,
    required this.title,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {

    return Obx(() {

      final bool isSelected =
          controller.selectedTab.value == index;

       final bool noSelection =
        controller.selectedTab.value == -1;




      return AnimatedOpacity(
        duration: const Duration(milliseconds: 300),

        opacity: noSelection || isSelected ? 1 : 0.4,

        child: AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,

          child: Column(
            children: [

              /// HEADER
              InkWell(
                borderRadius: BorderRadius.circular(10),

                onTap: () {
                 controller.selectTab(index);




                },

                child: Container(
                  height: 58,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 16),

                  decoration: BoxDecoration(
                    color: isSelected
                        ? Colors.white.withOpacity(.85)
                        : AppColors.navy500,

                    borderRadius: BorderRadius.circular(10),
                  ),

                  child: Row(
                    children: [

                      /// ICON
                      Icon(
                        icon,
                        color: isSelected
                            ? AppColors.navy500
                            : AppColors.buttonColor,
                      ),

                      const SizedBox(width: 12),

                      /// TITLE
                      Expanded(
                        child: Text(
                          title,
                          style: AppFontStyleColor.bigTextStyle(
                            isSelected
                                ? AppColors.navy500
                                : AppColors.buttonColor,
                          ),
                        ),
                      ),

                      /// EXPAND ICON
                      AnimatedRotation(
                        turns: isSelected ? 0.5 : 0,
                        duration:
                        const Duration(milliseconds: 300),

                        child: Icon(
                          Icons.keyboard_arrow_down,
                          color: isSelected
                              ? AppColors.navy500
                              : AppColors.buttonColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /// CONTENT
              if (isSelected) ...[
                const SizedBox(height: 12),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),

                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),

                  child:MobileTabContent(index: index,),
                ),
              ],
            ],
          ),
        ),
      );
    });
  }
}
