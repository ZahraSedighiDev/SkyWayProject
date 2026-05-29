import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skywayproject/Core/theme/app_colors.dart';
import 'package:skywayproject/Core/widgets/buttons/buttons/app_carousel.dart';


class AppCarousel extends StatefulWidget {
  final List<Widget> children;
  final double height;
  final Duration autoPlayDuration;
  final BorderRadius radius;
  final bool staticMode;
  final Widget? centerChild;

  const AppCarousel({
    super.key,
    required this.children,
    this.height = 300,
    this.autoPlayDuration = const Duration(seconds: 3),
    this.radius = BorderRadius.zero,
    this.staticMode = false,
    this.centerChild,
  });

  @override
  State<AppCarousel> createState() => _AppCarouselState();
}
class _AppCarouselState extends State<AppCarousel> {
  late final String controllerTag;
  late final AppCarouselController controller;

  @override
  void initState() {
    super.initState();

    controllerTag = widget.hashCode.toString();

    controller = Get.put(
      AppCarouselController(
        length: widget.children.length,
        viewportFraction: 1,
        autoPlayDuration: widget.autoPlayDuration,
        staticMode: widget.staticMode,
      ),
      tag: controllerTag,
    );
  }

  @override
  void dispose() {
    Get.delete<AppCarouselController>(tag: controllerTag);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height + (widget.centerChild != null ? 120 : 20),
      width: double.infinity,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox(
            height: widget.height,
            width: double.infinity,
            child: Stack(
              children: [
                Positioned.fill(
                  child: ScrollConfiguration(
                    behavior: ScrollConfiguration.of(context).copyWith(
                      dragDevices: {
                        PointerDeviceKind.touch,
                        PointerDeviceKind.mouse,
                        PointerDeviceKind.trackpad,
                      },
                    ),
                    child: PageView.builder(
                      physics: const AlwaysScrollableScrollPhysics(),
                      controller: controller.pageController,
                      itemCount: widget.children.length,
                      onPageChanged: controller.onPageChanged,
                      itemBuilder: (context, index) {
                        return ClipRRect(
                          borderRadius: widget.radius,
                          child: widget.children[index],
                        );
                      },
                    ),
                  ),
                ),

                // کد صحیح برای دکمه چپ
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child:_sideButton(
                      icon: Icons.chevron_left,
                      onTap: controller.previous,
                    ),
                  ),
                ),

                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: _sideButton(
                      icon: Icons.chevron_right,
                      onTap: controller.next,
                    ),
                  ),
                ),


                Positioned(
                  bottom: 70,
                  left: 0,
                  right: 0,
                  child: Obx(() {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        widget.children.length,
                            (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          height: 4,
                          width: controller.currentPage.value == index ? 20 : 6,
                          decoration: BoxDecoration(
                            color: controller.currentPage.value == index
                                ? AppColors.navy500
                                : Colors.grey.shade400,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),

          if (widget.centerChild != null)
            Positioned(
              left: 0,
              right: 0,
              bottom: -100,
              child: Center(
                child: SizedBox(
                  width: 500,
                  height: 200,
                  child: widget.centerChild!,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _sideButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    final isHover = false.obs;

    return MouseRegion(
      onEnter: (_) => isHover.value = true,
      onExit: (_) => isHover.value = false,
      child: Obx(() {
        // حذف Center اضافی چون با Align هماهنگ شده است
        return GestureDetector(
          behavior: HitTestBehavior.opaque, // تغییر به opaque برای دقت بهتر دکمه
          onTap: onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(isHover.value ? 0.25 : 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              color: Colors.white,
              size: 28,
            ),
          ),
        );
      }),
    );
  }
}

