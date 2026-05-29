
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:skywayproject/Core/footer.dart';
import 'package:skywayproject/Core/theme/app_font_style.dart';
import 'package:skywayproject/Core/theme/app_icons.dart';
import 'package:skywayproject/Core/widgets/center_child/center_child.dart';
import 'package:skywayproject/Core/widgets/header/header.dart';
import 'package:skywayproject/Core/theme/app_border_radius.dart';
import 'package:skywayproject/Core/theme/app_colors.dart';
import 'package:skywayproject/Core/theme/app_spacing.dart';
import 'package:skywayproject/Core/widgets/buttons/buttons/app_carousel.dart';
import 'package:skywayproject/Features/Destinations/Destinations_View/Destinations_View.dart';
import 'package:skywayproject/Features/HomeAuth/View_Model/auth_view_model.dart';
import 'package:skywayproject/Features/SpecialPhotosAndTexts/SpecialPhotosAndTexts_View/SpecialPhotosAndTexts_View.dart';
import 'package:skywayproject/Features/WinnersNameAuth/WinnersNameAuth_View/WinnersNameAuth_View.dart';

class HomeView extends GetView<AuthViewModel> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final skyway = Get.find<AuthViewModel>();
    final carouselController = Get.put(AppCarouselController( length: 3 ,
      staticMode: false ,
      autoPlayDuration: const Duration(seconds: 3),
      viewportFraction: 1.0

    ));
    final headerController = Get.put(AppHeaderController());
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
              controller: headerController.scrollController,
              physics: const ClampingScrollPhysics(),
              child: Column(
                children: [
                   AppCarousel(
                      widte: 1,
                      height: 500,
                    centerChild:CenterChild(controller: carouselController),



              children: [
                        Image.asset("assets/Images/banner4.jpeg", fit: BoxFit.cover),
                        Image.asset("assets/Images/banner2.jpeg", fit: BoxFit.cover),
                        Image.asset("assets/Images/banner3.jpeg", fit: BoxFit.cover),
                      ],
                    ),


                  Column(
                    children: [
                      const SizedBox(height:  100,),
                      Obx( () {
                        switch(skyway.pageIndex.value){
                          case 0 :
                            return const HomePage();
                          case 1 :
                            return const WinnersnameauthView();
                          case 2 :
                            return const SpecialphotosandtextsView();
                          case 3 :
                            return const SpecialphotosandtextsView();
                          case 4 :
                            return const DestinationsView();
                          case 5 :
                            return const DestinationsView();


                          default :
                            return const HomePage();
                        }
                      })
                    ],
                  ),
                  Footer(scrollController: headerController.scrollController),

                ],
              )),
          // code

          const AppHeader(),

        ],
      ),
    );
  }

}
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final skyway = Get.find<AuthViewModel>();
    return  Column(
      children: [
        Padding(
          padding:const EdgeInsets.only(left: 50 , right:  50 , top:2 ),
          child: GestureDetector(
            onTap: (){
              skyway.setPage(1);
            },
            child:  Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.d8, vertical: AppSpacing.d5
                  ),
                  decoration: const BoxDecoration(
                      color: AppColors.navy500,
                      borderRadius: AppBorderRadius.medium),
                  child: Row(
                    mainAxisAlignment:
                          width < 400 ? MainAxisAlignment.start : MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                           if (width >= 500)
                             Icon(Icons.airline_seat_recline_normal_outlined , color: AppColors.buttonColor,
                               size: width <850 ?
                               AppSpacing.d3 :
                               AppSpacing.d10,),
                         if (width  >= 500)
                          Icon(Icons.arrow_right_alt , color: AppColors.buttonColor,
                            size: width <850 ?
                            AppSpacing.d3 :
                            AppSpacing.d10,
                          ),
                          if (width  >= 500)

                            Icon(Icons.airline_seat_recline_extra_outlined , color: AppColors.buttonColor,
                            size: width <850 ?
                            AppSpacing.d3 :
                            AppSpacing.d10,
                          ),


                        ],
                      ),
                      Text(
                               "Free Flight Class Upgrade with Online Booking",
                               style: width < 200
                                   ? AppFontStyle.smallTextStyle
                                   : width < 600
                                   ? AppFontStyle.mediumTextStyle
                                   : AppFontStyle.bigTextStyle,
                               maxLines: width < 200 ? 2 : 1,
                               overflow: TextOverflow.ellipsis,
                             ),




                      if (MediaQuery.of(context).size.width > 850)
                        ElevatedButton(
                          onPressed: () {
                            skyway.setPage(1);
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text('Winners List'),
                        ),


                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
         const SizedBox(height: 30,),
         Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                CustomActionCard(
                    svgPath: AppIcons.airplaneCard,
                    title: 'Skyway Fleet',
                    onCardTap: (){
                      skyway.setPage(2);
                    },
                    onTextTap: (){
                      skyway.setPage(2);
                    }),

                CustomActionCard(
                    svgPath: AppIcons.airplaneSeat,
                    title: "Seats Situation",
                    onCardTap: (){
                      skyway.pageIndex(3);
                    },
                    onTextTap: (){
                      skyway.pageIndex(3);
                    }),

                CustomActionCard(
                  svgPath: AppIcons.localDestinations,
                  title: 'Local Destinations',
                  onCardTap: (){
                    skyway.pageIndex(4);
                  },
                  onTextTap:  (){
                    skyway.pageIndex(4);
                  }, ),

                CustomActionCard(
                  svgPath: AppIcons.internationalDestinations,
                  title: "Intenational Destinations",
                  onCardTap:  (){
                    skyway.pageIndex(5);
                  },
                  onTextTap: (){
                    skyway.pageIndex(5);
                  },),
              ],


        ),
        const SizedBox(height: 30,),
        

      ],
    );
  }
}

class CustomActionCard extends StatefulWidget {
  final String svgPath;
  final String title;
  final VoidCallback onCardTap;
  final VoidCallback onTextTap;
  final Color? cardColor;
  final double iconSize;

  const CustomActionCard({
    super.key,
    required this.svgPath,
    required this.title,
    required this.onCardTap,
    required this.onTextTap,
    this.cardColor,
    this.iconSize = 40,
  });

  @override
  State<CustomActionCard> createState() => _CustomActionCardState();
}
class _CustomActionCardState extends State<CustomActionCard> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        MouseRegion(
          onEnter: (_) => setState(() => _isHovering = true),
          onExit: (_) => setState(() => _isHovering = false),
          child: GestureDetector(
            onTap: widget.onCardTap,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              transform: Matrix4.translationValues(
                0, // X
                _isHovering ? -10 : 0,
                0, // Z
              ),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: widget.cardColor ?? Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(_isHovering ? 0.15 : 0.05),
                    blurRadius: _isHovering ? 15 : 10,
                    offset: Offset(0, _isHovering ? 8 : 4),
                  ),
                ],
              ),
              child: SvgPicture.asset(
                widget.svgPath,
                width:  width < 1260 ?
                50 :
                150,
                height: width < 1260 ?
                50 :
                150,

              ),
            ),
          ),
        ),

        const SizedBox(height: 12),

         InkWell(
          onTap: widget.onTextTap,
          borderRadius: BorderRadius.circular(4),
          hoverColor: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Text(
              widget.title,
              style: TextStyle(
                fontSize: width <1260 ?
                10 : 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
        ),
      ],
    );
  }
}



