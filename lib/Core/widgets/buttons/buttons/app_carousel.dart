import 'dart:async';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:skywayproject/Core/theme/app_border_radius.dart';
import 'package:skywayproject/Core/theme/app_colors.dart';
import 'package:skywayproject/Core/widgets/buttons/cyber_neon_arrow_button/cyber_neon_arrow_button.dart';

class AppCarouselController extends GetxController {
  late PageController pageController;
  RxInt selectedTab = 0.obs;


  final int length;
  final double viewportFraction;
  final Duration autoPlayDuration;
  final bool staticMode;

  AppCarouselController({
    required this.length,
    required this.viewportFraction,
    required this.autoPlayDuration,
    required this.staticMode,
  });

  RxInt currentPage = 0.obs;
  Timer? _timer;
  Timer? _resetTimer;

  bool isUserScrolling = false;


  @override
  void onInit() {
    super.onInit();

    pageController = PageController(viewportFraction: viewportFraction);

    if (!staticMode) {
      _startAutoPlay();
    }
  }
  void selectTab(int index) {

    if (selectedTab.value == index) {
      selectedTab.value = -1;
      _resetTimer?.cancel();
      return;
    }

    selectedTab.value = index;
    _resetTimer?.cancel();

    _resetTimer = Timer(
      const Duration(seconds: 20),
          () {
        selectedTab.value = -1;
      },
    );
  }


  void _startAutoPlay() {
    _timer = Timer.periodic(autoPlayDuration, (timer) {
      if (isClosed || isUserScrolling || !pageController.hasClients) return;

      try {
        if (!pageController.position.haveDimensions) return;

        final next = (currentPage.value + 1) % length;

        pageController.animateToPage(
          next,
          duration: const Duration(milliseconds: 1200),
          curve: Curves.easeInOutCubic,
        );

        currentPage.value = next;
      } catch (_) {}
    });
  }

  void onPageChanged(int index) {
    currentPage.value = index;
  }

  void next() {
    final next = (currentPage.value + 1) % length;

    pageController.animateToPage(
      next,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );

    currentPage.value = next;
  }

  void previous() {
    final prev = (currentPage.value - 1 + length) % length;

    pageController.animateToPage(
      prev,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );

    currentPage.value = prev;
  }

  void onUserScrollStart() {
    isUserScrolling = true;
  }

  void onUserScrollEnd() {
    Future.delayed(const Duration(milliseconds: 300), () {
      isUserScrolling = false;
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    _resetTimer?.cancel();

    pageController.dispose();

    super.onClose();
  }

}

class AppCarousel extends StatefulWidget {
  final List<Widget> children;
  final double height;
  final double widte;
  final Duration autoPlayDuration;
  final BorderRadius radius;
  final bool staticMode;
  final Widget? centerChild;


  const AppCarousel({
    super.key,
    required this.children,
    this.height = 80,
    this.widte = 1.0,
    this.autoPlayDuration = const Duration(seconds: 2),
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
        viewportFraction: widget.widte,
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
      height: widget.height ,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          SizedBox(
            height: widget.height,
            child: NotificationListener<UserScrollNotification>(
              onNotification: (notification) {
                if (!widget.staticMode) {
                  if (notification.direction != ScrollDirection.idle) {
                    controller.onUserScrollStart();
                  } else {
                    controller.onUserScrollEnd();
                  }
                }
                return false;
              },
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(
                  dragDevices: {
                    PointerDeviceKind.touch,
                    PointerDeviceKind.mouse,
                    PointerDeviceKind.trackpad,
                  },
                ),
                child: PageView.builder(
                  dragStartBehavior: DragStartBehavior.down,
                  physics: const PageScrollPhysics(),
                  controller: controller.pageController,
                  onPageChanged: controller.onPageChanged,
                  itemCount: widget.children.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return AnimatedBuilder(
                      animation: controller.pageController,
                      child: widget.children[index],
                      builder: (context, child) {
                        double page = 0;

                        if (controller.pageController.hasClients &&
                            controller.pageController.position.haveDimensions) {
                          page = controller.pageController.page ?? 0;
                        }

                        final percent = (page - index).clamp(-1.0, 1.0);
                        final parallax = percent * 40;

                        return Transform.translate(
                          offset: Offset(parallax, 0),
                          child: child,
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),

          Positioned(
            left: 5,
            top: widget.height / 2 - 32,
            child: CyberNeonArrowButton(
              icon: Icons.chevron_left,
              onTap: controller.previous,
            ),
          ),
          Positioned(
            right: 5,
            top: widget.height / 2 - 32,
            child: CyberNeonArrowButton(
              icon: Icons.chevron_right,
              onTap: controller.next,
            ),
          ),

          if (widget.centerChild != null)
            Positioned(
              left: 50,
              right: 50,
              top: 0,
              bottom: -30,
              child: IgnorePointer(
                ignoring: false,
                child: Center(
                  child: SingleChildScrollView(
                    child: widget.centerChild!,
                  ),
                ),
              ),
            ),

          Positioned(
            bottom:110,
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
                    width: controller.currentPage.value == index ? 12 : 4,
                    decoration: BoxDecoration(
                      color: controller.currentPage.value == index
                          ? AppColors.navy500
                          : AppColors.eNamdColor,
                      borderRadius: AppBorderRadius.circularBo,
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }


}