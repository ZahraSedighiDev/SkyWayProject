import 'dart:async';
import 'package:skywayproject/Core/theme/app_spacing.dart';
import 'package:skywayproject/Core/widgets/header/app_menu_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:skywayproject/Core/theme/app_colors.dart';
import 'package:skywayproject/Core/theme/app_font_style.dart';
import 'package:skywayproject/Core/theme/app_icons.dart';
import 'package:skywayproject/Core/widgets/buttons/buttons/app_button.dart';
import 'package:skywayproject/Core/widgets/header/app_menu_models.dart';
import 'package:skywayproject/Core/widgets/language_switche/language_switche.dart';

class AppHeaderController extends GetxController {

  final List<MainMenuItem> menuItems = AppMenuConfig.menuItems;

  final ScrollController scrollController = ScrollController();

final RxBool headerVisible = true.obs;
final RxBool isAtTop = true.obs;

final RxInt selectedIndex = (-1).obs;
final RxBool submenuOpen = false.obs;

double lastOffset = 0;

Timer? inactivityTimer ;

@override
void onInit() {
scrollController.addListener(_scrollListener);
super.onInit();
}

void resetInactivityTimer(){
  inactivityTimer?.cancel();
  inactivityTimer = Timer(const Duration(seconds: 15) , (){
    closeSubmenu();
    headerVisible.value = true ;
  });
}

void toggleSubmenu(int index) {
  resetInactivityTimer();

if (selectedIndex.value == index) {
submenuOpen.value = !submenuOpen.value;
} else {
selectedIndex.value = index;
submenuOpen.value = true;
}
}

void closeSubmenu() {
submenuOpen.value = false;
selectedIndex.value = -1;
inactivityTimer?.cancel();
}

void _scrollListener() {
resetInactivityTimer();

final offset = scrollController.offset;

isAtTop.value = offset <= 0;

final isScrollingDown = offset > lastOffset;
final isScrollingUp = offset < lastOffset;

if (offset > 60 && isScrollingDown) {
headerVisible.value = false;
}

if (isScrollingUp) {
headerVisible.value = true;
}

lastOffset = offset;
}

@override
void onClose() {
scrollController.dispose();
super.onClose();
}
}

class AppHeader extends StatefulWidget {
const AppHeader({super.key});

@override
State<AppHeader> createState() => _AppHeaderState();
}
class _AppHeaderState extends State<AppHeader> {
final AppHeaderController controller = Get.find<AppHeaderController>();


final GlobalKey stackKey = GlobalKey();

late List<GlobalKey> itemKeys;

@override
void initState() {
  super.initState();

  itemKeys = List.generate(
    controller.menuItems.length,
        (_) => GlobalKey(),
  );
}



double underlineLeft = 0;
double underlineWidth = 0;

void _updateUnderline(int index) {
final itemBox =
itemKeys[index].currentContext!.findRenderObject() as RenderBox;

final stackBox =
stackKey.currentContext!.findRenderObject() as RenderBox;

final position = itemBox.localToGlobal(
Offset.zero,
ancestor: stackBox,
);

setState(() {
underlineLeft = position.dx;
underlineWidth = itemBox.size.width;
});
}

@override
Widget build(BuildContext context) {
WidgetsBinding.instance.addPostFrameCallback((_) {
if (controller.selectedIndex.value != -1) {
_updateUnderline(controller.selectedIndex.value);
}
});

return Obx(() {
final textColor = controller.isAtTop.value && !controller.submenuOpen.value
? AppColors.buttonColor
    : AppColors.hoveredColor;

final logoColor = controller.isAtTop.value && !controller.submenuOpen.value
? AppColors.buttonColor
    : AppColors.hoveredColor;
double w = MediaQuery.of(context).size.width;
bool isDesktop = w >= 1260;
bool isTablet = w >= 720 && w < 1260;

SvgPicture.asset(
  AppIcons.skyWayLogo,
  height: isDesktop ? 100 : isTablet ? 100 : 80,
  width: isDesktop ? 100 : isTablet ? 100 : 80,
);

Widget header;
if (w < 720) {
  header = _buildMobileHeader(textColor, logoColor);
} else if (w < 1260) {
  header = _buildTabletHeader(textColor, logoColor);
} else {
  header = _buildDesktopHeader(textColor, logoColor);
}

return Column(
  mainAxisSize: MainAxisSize.min,
  children: [
    header,
    _buildSubmenuArea(),
  ],
);

});
}
Widget _buildDesktopHeader(Color textColor, Color logoColor) {
  return AnimatedSlide(
    offset: controller.headerVisible.value ? Offset.zero : const Offset(0, -1),
    duration: const Duration(milliseconds: 300),
    child: AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 80),
      decoration: BoxDecoration(
        color: controller.isAtTop.value && !controller.submenuOpen.value
            ? Colors.transparent
            : Colors.white.withOpacity(.9),
      ),
      child: Row(
        children: [
          /// Logo
          SvgPicture.asset(AppIcons.skyWayLogo, height:100, width:100),

          /// Menu (Takes all center space)
          Expanded(
            child: Stack(
              key: stackKey,
              children: [
                Row(
                  children: List.generate(
                    controller.menuItems.length,
                        (index) => _buildLi(controller.menuItems[index], index, textColor),
                  ),
                )
                ,

                AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeOut,
                  left: controller.selectedIndex.value == -1
                      ? 0
                      : underlineLeft,
                  bottom: 0,
                  child: AnimatedContainer(
                    height: 3,
                    width: controller.selectedIndex.value == -1
                        ? 0
                        : underlineWidth,
                    color: AppColors.navy500,
                    duration: const Duration(milliseconds: 300),
                  ),
                ),
              ],
            ),
          ),

          /// RIGHT SECTION – FIXED WIDTH BUT FLEXIBLE
          Row(
            mainAxisSize: MainAxisSize.min,    // 🔥 جلوگیری از پر کردن کل فضا
            children: [
              const LanguageSwitcher(),
              const SizedBox(width: 10),
              HeaderActionButton(
                text: "Log in/ Register",
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
Widget _buildTabletHeader(Color textColor, Color logoColor) {
  return AnimatedContainer(
    duration: const Duration(milliseconds: 250),
    height: 70,
    padding: const EdgeInsets.symmetric(horizontal: 40),
    decoration: BoxDecoration(
      color: controller.isAtTop.value && !controller.submenuOpen.value
          ? Colors.transparent
          : Colors.white,
      border: Border(
        bottom: BorderSide(
          color: Colors.grey.shade200,
          width: 1,
        ),
      ),
      boxShadow: controller.isAtTop.value
          ? []
          : [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 10,
          offset: const Offset(0, 4),
        )
      ],
    ),
    child: Row(
      children: [
        /// Logo
        SvgPicture.asset(
          AppIcons.skyWayLogo,
          height: 60,
          width: 120,
        ),

        const SizedBox(width: 30),

        Expanded(
          child: Row(
            children: [
              ...List.generate(2, (index) {
                final item = controller.menuItems[index];
                return GestureDetector(
                  onTap: () {
                    controller.toggleSubmenu(index);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      item.labelKey.tr
                      ,
                      style: AppFontStyle.bigTextStyle.copyWith(color: textColor),
                    ),
                  ),
                );
              }),

              /// "More" button → opens bottom sheet
              GestureDetector(
                onTap: () {
                  _openTabletMoreMenu(context);
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    children: [
                      Text(
                        "More",
                        style: AppFontStyle.bigTextStyle.copyWith(color: textColor),
                      ),
                      Icon(Icons.keyboard_arrow_down, color: textColor),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

        /// Right section
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const LanguageSwitcher(),
            const SizedBox(width: 12),
            HeaderActionButton(
              text: "Log in / Register",
              onTap: () {},
            ),
          ],
        ),
      ],
    ),
  );
}
Widget _buildMobileHeader(Color textColor, Color logoColor) {
return AnimatedSlide(
offset: controller.headerVisible.value ? Offset.zero : const Offset(0, -1),
duration: const Duration(milliseconds: 300),
child: AnimatedContainer(
duration: const Duration(milliseconds: 250),
height: 80,
padding: const EdgeInsets.symmetric(horizontal: 20),
decoration: BoxDecoration(
color: controller.isAtTop.value && !controller.submenuOpen.value
? Colors.transparent
    : Colors.white,
border: Border(
bottom: BorderSide(
color: Colors.grey.shade200,
width: 1,
),
),
boxShadow: controller.isAtTop.value
? []
    : [
BoxShadow(
color: Colors.black.withOpacity(0.05),
blurRadius: 10,
offset: const Offset(0, 4),
)
],

),
child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
Align(
alignment: Alignment.centerLeft,
child:   SvgPicture.asset(
AppIcons.skyWayLogo,
height:100,
width: 200,
),
),
Align(
alignment: Alignment.centerRight,
child: Row(
children: [
  const LanguageSwitcher(),
HeaderActionButton(text: "Log in/ Register", onTap: () {}),
Padding(padding: const EdgeInsets.only(right:10) ,
  child: IconButton(
  icon: Icon(Icons.menu, color: textColor, size: 30),
  onPressed: () {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      isScrollControlled: true, // برای محتوای بلند
      builder: (BuildContext context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ListView( // استفاده از ListView برای قابلیت اسکرول
              shrinkWrap: true,
              children: controller.menuItems.map((menuItem) {
          final List<SubMenuItem> submenu = menuItem.subMenu;
          final String title = menuItem.labelKey.tr;

          if (submenu.isEmpty) {
          return ListTile(
          title: Text(title, style: const TextStyle(fontSize: 16)),
          onTap: () {
          Navigator.pop(context);
          controller.resetInactivityTimer();
          },
          );
          } else {
          return ExpansionTile(
          title: Text(title, style: const TextStyle(fontSize: 16)),
          children: submenu.map((subItem) {
          return ListTile(
          contentPadding: const EdgeInsets.only(left: 32),
          title: Text(subItem.labelKey.tr),
          onTap: () {
          Navigator.pop(context);
          controller.resetInactivityTimer();

          Get.toNamed(subItem.route!);

          },
          );
          }).toList(),
          );
          }
          }).toList(),

            ),
          ),
        );
      },
    );
  },
),)
],
),
)

],
),
),
);
}
Widget _buildLi(MainMenuItem item, int index, Color color) {
  return GestureDetector(
    onTap: () {
      controller.resetInactivityTimer();
      controller.toggleSubmenu(index);
      _updateUnderline(index);
    },
    child: Container(
      key: itemKeys[index],
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        item.labelKey.tr,
        style: AppFontStyle.bigTextStyle.copyWith(color: color),
      ),
    ),
  );
}
Widget _buildSubmenuArea() {
  return Obx(() {
    final open = controller.submenuOpen.value;
    final selectedIndex = controller.selectedIndex.value;

    if (!open || selectedIndex == -1) return const SizedBox.shrink();

    final submenuItems = controller.menuItems[selectedIndex].subMenu;

    // استفاده از AnimatedSize برای تنظیم خودکار ارتفاع به جای ارتفاع ثابت
    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      alignment: Alignment.topCenter,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.98),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: AppSpacing.d22),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.d10, vertical: AppSpacing.d8), // پدینگ عمودی بیشتر
              child: Wrap(
                spacing: AppSpacing.d6, // فاصله افقی بین ستون‌ها
                runSpacing: AppSpacing.d7, // فاصله عمودی بین ردیف‌ها
                alignment: WrapAlignment.center,
                children: submenuItems.map((subItem) {
                  return InkWell(
                    onTap: () {
                      controller.closeSubmenu();
                      if (subItem.route != null) {
                        Get.toNamed(subItem.route!);
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(AppSpacing.d2),
                      child: SizedBox(
                        width: AppSpacing.d21,
                        child: Text(
                          subItem.labelKey.tr,
                          textAlign: TextAlign.center, // وسط‌چین کردن متن در ستون
                          style: AppFontStyle.mediumTextStyle.copyWith(
                            color: AppColors.navy500,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  });
}
void _openTabletMoreMenu(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    builder: (_) {
      return ListView(
        padding: const EdgeInsets.all(16),
        children: controller.menuItems
        .asMap()
          .entries
          .skip(2)
          .map((entry){

            final index = entry.key ;
            final item = entry.value;




            return ListTile(
          title: Text(item.labelKey.tr
          ),
          onTap: () {
            Navigator.pop(context);
            controller.toggleSubmenu(index);
          },
        );})
            .toList(),
      );
    },
  );
}
}
