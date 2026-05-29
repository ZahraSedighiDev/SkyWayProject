import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skywayproject/Core/theme/app_colors.dart';
import 'package:skywayproject/Core/theme/app_icon_sizes.dart';
import 'package:skywayproject/Core/theme/app_icons.dart';
import 'package:skywayproject/Core/theme/app_spacing.dart';
import 'package:skywayproject/Core/theme/app_text_size.dart';
import 'package:skywayproject/Core/theme/buttons.dart';
class GoUpButton extends StatefulWidget {
  final ScrollController scrollController;
  const GoUpButton({super.key ,
    required this.scrollController,  });

  @override
  State<GoUpButton> createState() => GoUpButtonState();
}
class GoUpButtonState extends State<GoUpButton> {
  Color _svgColor = AppColors.buttonColor;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;

    double goupWidth = screenWidth < 722 ? AppIconSize.w1 : AppIconSize.w2;
    double goupHeight = screenWidth < 722 ? AppIconSize.w1 : AppIconSize.w2;

    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _svgColor = AppColors.hoveredColor;
        });
      },
      onExit: (_) {
        setState(() {
          _svgColor = AppColors.buttonColor;
        });
      },
      child: InkWell(
        onTap: () {
          widget.scrollController.animateTo(
            0,
            duration: const Duration(milliseconds: 600),
            curve: Curves.elasticOut,
          );
        },
        child: SvgPicture.asset(
          AppIcons.goUp,
          width: goupWidth,
          height: goupHeight,
          colorFilter: ColorFilter.mode(_svgColor, BlendMode.srcIn),
        ),
      ),
    );
  }
}


class Guidefield extends StatefulWidget {
  const Guidefield({super.key});

  @override
  State<Guidefield> createState() => GuidefieldState();
}
class GuidefieldState extends State<Guidefield> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(padding: EdgeInsets.only(top: AppSpacing.d5)),
        const Guides(textte: "Guide"),
        const Padding(padding: EdgeInsets.only(top: AppSpacing.d5)),
        Textbuttons(onClicked: (){}, Textt: "Booking"),
        const Padding(padding: EdgeInsets.only(top: AppSpacing.d5)),
        Textbuttons(onClicked: (){}, Textt: "Ticket Change"),
        const Padding(padding: EdgeInsets.only(top: AppSpacing.d5)),
        Textbuttons(onClicked: (){}, Textt: "Ticket Refund"),
        const Padding(padding: EdgeInsets.only(top: AppSpacing.d5)),
        Textbuttons(onClicked: (){}, Textt: "Online Check-in"),
        const Padding(padding: EdgeInsets.only(top: AppSpacing.d5)),
        Textbuttons(onClicked: (){}, Textt: "Airport Transfer")
      ],
    );
  }
}

class CustomerServices extends StatefulWidget {
  const CustomerServices({super.key});

  @override
  State<CustomerServices> createState() => CustomerServicesState();
}
class CustomerServicesState extends State<CustomerServices> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(padding: EdgeInsets.only(top: AppSpacing.d5)),
        const Guides(textte: "CustomerServices"),
        const Padding(padding: EdgeInsets.only(top: AppSpacing.d5)),
        Textbuttons(onClicked: (){}, Textt: "Contact us"),
        const Padding(padding: EdgeInsets.only(top: AppSpacing.d5)),
        Textbuttons(onClicked: (){}, Textt: "Voice of customer"),
        const Padding(padding: EdgeInsets.only(top: AppSpacing.d5)),
        Textbuttons(onClicked: (){}, Textt: "FAQ"),
        const Padding(padding: EdgeInsets.only(top: AppSpacing.d5)),
        Textbuttons(onClicked: (){}, Textt: "Survey"),
        const Padding(padding: EdgeInsets.only(top: AppSpacing.d5)),
        Textbuttons(onClicked: (){}, Textt: "Luggage  Case")
      ],
    );
  }
}

class SkywayGroup extends StatefulWidget {
  const SkywayGroup({super.key});

  @override
  State<SkywayGroup> createState() => SkywayGroupState();
}
class SkywayGroupState extends State<SkywayGroup> {
  @override
  Widget build(BuildContext context) {
    return   Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(padding: EdgeInsets.only(top: AppSpacing.d5)),
        const Guides(textte: "SkywayGroup"),
        const Padding(padding: EdgeInsets.only(top: AppSpacing.d5)),
        Textbuttons(onClicked: (){}, Textt: "Hanger"),
        const Padding(padding: EdgeInsets.only(top: AppSpacing.d5)),
        Textbuttons(onClicked: (){}, Textt: "Sales offices"),
        const Padding(padding: EdgeInsets.only(top: AppSpacing.d5)),
        Textbuttons(onClicked: (){}, Textt: "Insurance"),
        const Padding(padding: EdgeInsets.only(top: AppSpacing.d5)),
        TextAndIconButtons(textt: "Skyway university", iconn: AppIcons.launchIcon , onClickeed: (){}),
        const Padding(padding: EdgeInsets.only(top: AppSpacing.d5)),
        TextAndIconButtons(textt: "Language evaluation center", iconn: AppIcons.launchIcon , onClickeed: (){})

      ],
    );
  }
}

class SkywayAirline extends StatefulWidget {
  const SkywayAirline({super.key});

  @override
  State<SkywayAirline> createState() => SkywayAirlineState();
}
class SkywayAirlineState extends State<SkywayAirline> {
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(padding: EdgeInsets.only(top: AppSpacing.d4)),
          const Guides(textte: "SkywayAirline"),
          const Padding(padding: EdgeInsets.only(top: AppSpacing.d5)),
          Textbuttons(onClicked: (){}, Textt: "About us"),
          const Padding(padding: EdgeInsets.only(top: AppSpacing.d5)),
          Textbuttons(onClicked: (){}, Textt: "News"),
          const Padding(padding: EdgeInsets.only(top: AppSpacing.d5)),
          TextAndIconButtons(textt:"Job oppurtunities" , iconn:AppIcons.launchIcon , onClickeed: (){}),
          const Padding(padding: EdgeInsets.only(top: AppSpacing.d5)),
          Textbuttons(onClicked: (){}, Textt: ""),
          const Padding(padding: EdgeInsets.only(top: AppSpacing.d5)),
          Textbuttons(onClicked: (){}, Textt: "")

        ],
    );
  }
}

class SocialIconsRow extends StatelessWidget {
  const SocialIconsRow({super.key});

  @override
  Widget build(BuildContext context) {
    final icons = [
      AppIcons.instagram,
      AppIcons.linkedin,
      AppIcons.telegram ,
      AppIcons.twitter ,
      AppIcons.youtube ,
    ];

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final path in icons) ...[
          HoverableSvgIcon(
            path: path,
            normalColor: AppColors.buttonColor,
            hoverColor: AppColors.hoveredColor,
          ),
         const SizedBox(width: AppSpacing.d2),
        ],
      ],
    );
  }
}
class HoverableSvgIcon extends StatefulWidget {
  final String path;
  final Color normalColor;
  final Color hoverColor;

  const HoverableSvgIcon({
    super.key,
    required this.path,
    required this.normalColor,
    required this.hoverColor,
  });

  @override
  State<HoverableSvgIcon> createState() => HoverableSvgIconState();
}
class HoverableSvgIconState extends State<HoverableSvgIcon> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double iconSize = screenWidth < 1000 ? AppIconSize.t3  : AppIconSize.t4 ;
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 20),
        curve: Curves.easeInOut,
        child: SvgPicture.asset(
          widget.path,
          width: iconSize,
          height: iconSize,
          colorFilter: ColorFilter.mode(
            _isHovered ? widget.hoverColor : widget.normalColor,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}

class Footer extends StatefulWidget {
  final ScrollController scrollController;
   const Footer({super.key ,    required this.scrollController,

  });

  @override
  State<Footer> createState() => FooterState();
}
class FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    if ( width >= 722){
      return _buildDesktopFooter(width);
    }
    return _buildMobileFooter(width);
  }
  Widget _buildDesktopFooter(double width){
    double width = MediaQuery.sizeOf(context).width;
    double screenHeight = width < 1000 ? 400 : 450 ;
    double fontSize = screenHeight  <1000 ? AppTextSize.smallSize: AppTextSize.mediumSize;
    return  Container(
      width: width,
      height: screenHeight,
      margin: const EdgeInsets.only(top: AppSpacing.large),
      padding: const EdgeInsets.only(left: AppSpacing.d5 , right: AppSpacing.d5 ),
      color: AppColors.footerBackground,
      child:
      Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Guidefield(),
              const Padding(padding: EdgeInsets.only(right: AppSpacing.d12)),
              const CustomerServices(),
              const Padding(padding: EdgeInsets.only(right: AppSpacing.d12)),
              const SkywayGroup(),
              const Padding(padding: EdgeInsets.only(right: AppSpacing.d12)),
              const SkywayAirline(),
              const Padding(padding: EdgeInsets.only(right: AppSpacing.d9)),
              Column(
                children: [
                  Column(
                    children: [
                      SvgPicture.asset( AppIcons.skyWayLogo , width: AppIconSize.w6 , height:AppIconSize.h3,),
                      SvgButton(widthh: AppIconSize.w4, heightt: AppIconSize.h2, onClicked: (){})
                    ],
                  )
                ],
              ),
            ],
          ),
         
           const Padding(padding: EdgeInsets.only(bottom: AppSpacing.d6)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: AppSpacing.d9),
                child: GoUpButton(scrollController: widget.scrollController,),
              ),

              Divider(
                color: AppColors.hoveredColor.withOpacity(.5),
                thickness: 2,
                indent:40,
                endIndent: 40,
              ),
            ]
          ),
          Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(padding: EdgeInsets.only(right: AppSpacing.d9,),),
                Textbuttons(onClicked: (){}, Textt: "Terms & Conditions"),
                const Padding(padding: EdgeInsets.only(right: AppSpacing.d5)),
                Textbuttons(onClicked: (){}, Textt: "Privacy"),
                const Padding(padding:EdgeInsets.only(right: 100)),
                const SocialIconsRow(),
                const Padding(padding: EdgeInsets.only(right:100)),
                Text(
                  "© 2025 SkyWay Airline\nAll rights reserved",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: AppColors.buttonColor,
                    fontSize: fontSize ,
                    height: 1.6,
                  ),
                ),

              ]),

        ],
      ),
    );
  }

  Widget _buildMobileFooter(double width ) {
    return Container(
      width: width,
      margin: const EdgeInsets.only(top: AppSpacing.large),
      padding: const EdgeInsets.only(left: AppSpacing.d5 , right: AppSpacing.d5 ),
      color: AppColors.textColor1.withOpacity(.7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppIcons.skyWayLogo,
            width: AppIconSize.w5,
            height: AppIconSize.h2,
          ),
          const SizedBox(height: AppSpacing.d6),

          const SocialIconsRow(),
          const SizedBox(height: AppSpacing.d8),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Guidefield(),
              Padding(padding: EdgeInsets.only(right:AppSpacing.d16)),
              CustomerServices(),
              Padding(padding: EdgeInsets.only(right:AppSpacing.d17))
            ],
          ),
          const Padding(padding: EdgeInsets.only(bottom: AppSpacing.d8)),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SkywayGroup(),
              Padding(padding: EdgeInsets.only(right: AppSpacing.d5)),
              SkywayAirline(),
              Padding(padding: EdgeInsets.only(right: AppSpacing.d11))
            ],
          ),
          const SizedBox(height: AppSpacing.d8),

          Padding(padding: const EdgeInsets.only( left:300) ,
            child: GoUpButton(scrollController: widget.scrollController),
          ),


          Divider(
            color: AppColors.buttonColor.withOpacity(0.3),
            thickness: 1,
            indent: 40,
            endIndent: 40,
          ),

          const SizedBox(height: AppSpacing.d6),

          Wrap(
            spacing: AppSpacing.d6,
            alignment: WrapAlignment.center,
            children: [
              Textbuttons(onClicked: () {}, Textt: "Terms & Conditions"),
              Textbuttons(onClicked: () {}, Textt: "Privacy"),
            ],
          ),

          const SizedBox(height: AppSpacing.d7),

          const Text(
            "© 2025 SkyWay Airlines\nAll rights reserved",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.buttonColor,
              fontSize: AppTextSize.mediumSize,
              height: 1.6,
            ),
          ),

          const SizedBox(height: AppSpacing.d7),
        ],
      ),
    );
  }

  // ignore: unused_element
  Widget _buildTest() => const SizedBox.shrink();
}