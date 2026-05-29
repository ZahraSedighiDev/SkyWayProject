import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:skywayproject/Core/routes/app_pages.dart';
import 'package:skywayproject/Core/routes/app_route.dart';
import 'package:skywayproject/Core/theme/app_colors.dart';
import 'package:skywayproject/Core/theme/app_font.dart';
import 'package:skywayproject/Core/theme/app_icons.dart';
import 'package:skywayproject/Core/widgets/buttons/loader/loader.dart';
import 'package:skywayproject/Core/widgets/buttons/translation/translation.dart';
//final GlobalKey<HomePageControllerState> homepagekey = GlobalKey();
//final pageScrollController = ScrollController();

void main (){
  runApp(const Skyway());
}


class Skyway extends StatelessWidget {
  const Skyway({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: MyTranslations(),
      locale: const Locale("en"),
      fallbackLocale: const Locale("fa"),

      theme: ThemeData(
        fontFamily: AppFont.fontFamily,
      ),

      home: const SplashPage(),
      getPages: AppPages.pages,
    );
  }
}

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}
class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds:3), () {
      Get.offAllNamed('/auth');
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: AppColors.hoveredColor,
        //AppColors.backgroundColor,
        body: SizedBox.expand(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AppIcons.skyWayLogo,
                  width: screenWidth * .35,
                  colorFilter: const ColorFilter.mode(AppColors.backgroundColor, BlendMode.srcIn),
                ),
                const SizedBox(height: 10,),
                const AirplaneWaveProLoader(
                  color:  AppColors.backgroundColor,
                )
              ],
            ),
          ),
    );
  }
}



////////////////////////////////////