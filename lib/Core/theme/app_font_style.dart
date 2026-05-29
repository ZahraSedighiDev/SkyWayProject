import 'package:flutter/material.dart';
import 'package:skywayproject/Core/theme/app_colors.dart';
import 'package:skywayproject/Core/theme/app_font.dart';

import 'package:skywayproject/Core/theme/app_text_size.dart';

class AppFontStyle {
  const AppFontStyle._();

  static const TextStyle  smallTextStyle = TextStyle(
    fontFamily:  AppFont.fontFamily ,
    fontSize: AppTextSize.smallSize,
    fontWeight: AppFont.fontSizeSmall ,
  );
  static const TextStyle  mediumTextStyle = TextStyle(
    fontFamily: AppFont.fontFamily  ,
    fontSize:  AppTextSize.mediumSize,
    fontWeight:  AppFont.fontSizeNormal,
  );

  static const TextStyle  bigTextStyle = TextStyle(
    fontFamily: AppFont.fontFamily  ,
    fontSize: AppTextSize.biggest,
    fontWeight:  AppFont.fontSizeBold,
  );

  static const TextStyle  smallFooterTextStyle = TextStyle(
    fontFamily:AppFont.fontFamily  ,
    fontSize: AppTextSize.smallSize ,
    fontWeight: AppFont.fontSizeBold,
  );

// baraye on footer warning ast
  static const TextStyle  mediumFooterTextStyle = TextStyle(
    fontFamily:AppFont.fontFamily  ,
    fontSize: AppTextSize.mediumSize ,
    fontWeight:AppFont.fontSizeBold ,
  );


  static const TextStyle  bigFooterTextStyle = TextStyle(
    fontFamily: AppFont.fontFamily ,
    fontSize: AppTextSize.bigSize ,
    fontWeight: AppFont.fontSizeBold ,
  );


}


class AppFontStyleColor {
  final Color color;

  const AppFontStyleColor({this.color = AppColors.navy50});

  static TextStyle smallTextStyle(Color color) => TextStyle(
    fontFamily: AppFont.fontFamily,
    fontSize: AppTextSize.smallSize,
    fontWeight: AppFont.fontSizeSmall,
    color: color,
  );
  static TextStyle mediumTextStyle(Color color) => TextStyle(
    fontFamily: AppFont.fontFamily,
    fontSize: AppTextSize.mediumSize,
    fontWeight: AppFont.fontSizeNormal,
    color: color,
  );

  static TextStyle bigTextStyle(Color color) => TextStyle(
    fontFamily: AppFont.fontFamily,
    fontSize: AppTextSize.biggest,
    fontWeight: AppFont.fontSizeBold,
    color: color,
  );

  static TextStyle smallFooterTextStyle(Color color) => TextStyle(
    fontFamily: AppFont.fontFamily,
    fontSize: AppTextSize.smallSize,
    fontWeight: AppFont.fontSizeBold,
    color: color,
  );

// baraye on footer warning ast
  static TextStyle mediumFooterTextStyle(Color color) => TextStyle(
    fontFamily: AppFont.fontFamily,
    fontSize: AppTextSize.mediumSize,
    fontWeight: AppFont.fontSizeBold,
    color: color,
  );

  static TextStyle bigFooterTextStyle(Color color) => TextStyle(
    fontFamily: AppFont.fontFamily,
    fontSize: AppTextSize.bigSize,
    fontWeight: AppFont.fontSizeBold,
    color: color,
  );
}
