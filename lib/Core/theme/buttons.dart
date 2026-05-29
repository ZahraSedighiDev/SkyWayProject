import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:skywayproject/Core/theme/app_colors.dart';
import 'package:skywayproject/Core/theme/app_icon_sizes.dart';
import 'package:skywayproject/Core/theme/app_icons.dart';
import 'package:skywayproject/Core/theme/app_spacing.dart';
import 'package:skywayproject/Core/theme/app_text_size.dart';

class Textbuttons extends StatefulWidget {
  final String Textt ;
  final Function() onClicked;
  const Textbuttons({super.key , required this.onClicked , required this.Textt});
  @override
  State<Textbuttons> createState() => TextbuttonsState();
}
class TextbuttonsState extends State<Textbuttons> {
Color _textColor = AppColors.buttonColor;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double fontSize = screenWidth < 1000 ? AppTextSize.smallSize : AppTextSize.bigSize ;
    return MouseRegion(
      onEnter: (e){
        setState(() {
          _textColor = AppColors.hoveredColor;
        });
      },
      onExit: (e){
        setState(() {
          _textColor = AppColors.buttonColor;
        });
      },
      child: GestureDetector(
        onTap: (){
          widget.onClicked();
        },
        child: Text(widget.Textt.tr , style:  TextStyle(fontSize: fontSize , color: _textColor),),
      ),
    );
  }
}


class Guides extends StatefulWidget {
  final String textte;
  const Guides({super.key , required this.textte});

  @override
  State<Guides> createState() => _GuidesState();
}
class _GuidesState extends State<Guides> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double fontSize = screenWidth < 1000 ? AppTextSize.smallSize : AppTextSize.bigSize;
    return Text(widget.textte.tr , style: TextStyle(color: AppColors.textColor1, fontSize: fontSize),);
  }
}

class TextAndIconButtons extends StatefulWidget {
  final String textt;
  final IconData iconn;
  final Function() onClickeed;
  const TextAndIconButtons({super.key , required this.textt , required this.iconn , required this.onClickeed});

  @override
  State<TextAndIconButtons> createState() => TextAndIconButtonsState();
}
class TextAndIconButtonsState extends State<TextAndIconButtons> {
  Color _buttonColor = AppColors.buttonColor;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double iconSize = screenWidth <1000 ?  AppIconSize.t1 : AppIconSize.t2 ;
    double fontSize = screenWidth <1000 ?   AppTextSize.smallSize :  AppTextSize.bigSize ;
    return MouseRegion(
      onExit: (e){
        setState(() {
          _buttonColor= AppColors.buttonColor;
        });
      },
      onEnter: (e){
        setState(() {
          _buttonColor= AppColors.hoveredColor;
        });
      },
      child: GestureDetector(
        onTap:(){
          widget.onClickeed();
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(widget.iconn , size: iconSize, color: _buttonColor, ),
            const Padding(padding: EdgeInsets.only(right: AppSpacing.d1)),
            Text(widget.textt.tr , style: TextStyle(fontSize: fontSize , color: _buttonColor),)
          ],
        ),
      ),
    );
  }
}

class SvgButton extends StatefulWidget {
  final double widthh ;
  final double heightt ;
  final Function() onClicked;
  const SvgButton({super.key , required this.widthh , required this.heightt , required this.onClicked});

  @override
  State<SvgButton> createState() => SvgButtonState();
}
class SvgButtonState extends State<SvgButton> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double svgWidth  = screenWidth < 1000 ? AppIconSize.w2 : AppIconSize.w3 ;
    double svgHeight = screenWidth < 1000 ? 40 : 80 ;
    double fontSSize = screenWidth < 1000 ? AppTextSize.smallSize  : AppTextSize.bigSize ;
    return GestureDetector(
      onTap: (){
        widget.onClicked();
      },
      child: Row(
        children: [
          SvgPicture.asset( AppIcons.eNamad , width:  svgWidth, height: svgHeight),
          const Padding(padding: EdgeInsets.only(right: AppSpacing.d3 )),
          Text("eNamad".tr , style: TextStyle(color: AppColors.eNamdColor , fontSize:  fontSSize ,
              fontWeight: FontWeight.bold),),
        ],
      )
    );
  }
}
