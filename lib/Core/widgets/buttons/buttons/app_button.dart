import 'package:flutter/material.dart';
import 'package:skywayproject/Core/theme/app_colors.dart';
import 'package:skywayproject/Core/theme/app_font.dart';
import 'package:skywayproject/Core/theme/app_font_style.dart';
import 'package:skywayproject/Core/theme/app_text_size.dart';

enum ButtonType {
  solid, //with box
  onlyText,
  ghost;

  ButtonStyleConfig style(ButtonColor color) {
    switch (this) {
      case ButtonType.solid:
        switch (color) {
          case ButtonColor.mainSolid:
            return ButtonStyleConfig(
              backgroundColor: AppColors.hoveredColor,
              textColor: AppColors.buttonColor,
              borderColor: AppColors.textColor1,
            );

          case ButtonColor.ocClickedSolid:
            return ButtonStyleConfig(
              backgroundColor: AppColors.buttonColor,
              textColor: AppColors.hoveredColor,
              borderColor: AppColors.navy200,
            );

          default:
            throw Exception("Invalid color for solid button");
        }

      case ButtonType.onlyText:
        switch (color) {
          case ButtonColor.mainOnlyText:
            return ButtonStyleConfig(
              backgroundColor: Colors.transparent,
              textColor: AppColors.buttonColor,
              borderColor: Colors.transparent,
            );

          case ButtonColor.ocClickedOnlyText:
            return ButtonStyleConfig(
              backgroundColor: Colors.transparent,
              textColor: AppColors.hoveredColor,
              borderColor: Colors.transparent,
            );

          default:
            throw Exception("Invalid color for text button");
        }

      case ButtonType.ghost:
        switch (color) {
          case ButtonColor.mainGhost:
            return ButtonStyleConfig(
              backgroundColor: Colors.transparent,
              textColor: AppColors.navy500,
              borderColor: Colors.transparent,
            );

          case ButtonColor.onClikckedGhost:
            return ButtonStyleConfig(
              backgroundColor: Colors.transparent,
              textColor: AppColors.navy500,
              borderColor: Colors.transparent,
            );

          default:
            throw Exception("Invalid color for ghost button");
        }
    }
  }
} //types
enum ButtonColor {
  mainSolid,
  ocClickedSolid,
  mainOnlyText,
  ocClickedOnlyText,
  mainGhost,
  onClikckedGhost;
} //colors

enum ButtonSize {
  small(AppFontStyle.smallFooterTextStyle),
  medium(AppFontStyle.mediumFooterTextStyle),
  large(AppFontStyle.bigFooterTextStyle);

  final TextStyle textStyle;
  const ButtonSize(this.textStyle);
} //sizes

class ButtonStyleConfig {
  final Color backgroundColor;

  final Color textColor;

  final Color borderColor;

  ButtonStyleConfig(
      {required this.backgroundColor,
        required this.textColor,
        required this.borderColor});
}

final Map<ButtonType, Map<ButtonColor, ButtonStyleConfig>> forButtons = {
  ButtonType.solid: {
    ButtonColor.mainSolid: ButtonStyleConfig(
        backgroundColor: AppColors.hoveredColor,
        textColor: AppColors.buttonColor,
        borderColor: AppColors.textColor1),
    ButtonColor.ocClickedSolid: ButtonStyleConfig(
        backgroundColor: AppColors.buttonColor,
        textColor: AppColors.hoveredColor,
        borderColor: AppColors.navy200)
  },
  ButtonType.onlyText: {
    ButtonColor.mainOnlyText: ButtonStyleConfig(
        backgroundColor: Colors.transparent,
        textColor: AppColors.buttonColor,
        borderColor: Colors.transparent),
    ButtonColor.ocClickedOnlyText: ButtonStyleConfig(
        backgroundColor: Colors.transparent,
        textColor: AppColors.hoveredColor,
        borderColor: Colors.transparent)
  },
  ButtonType.ghost: {
    ButtonColor.mainGhost: ButtonStyleConfig(
        backgroundColor: Colors.transparent,
        textColor: AppColors.navy500,
        borderColor: Colors.transparent),
    ButtonColor.onClikckedGhost: ButtonStyleConfig(
        backgroundColor: Colors.transparent,
        textColor: AppColors.navy500,
        borderColor: Colors.transparent)
  }
};

class HeaderActionButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;

  const HeaderActionButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  State<HeaderActionButton> createState() => HeaderActionButtonState();
}

class HeaderActionButtonState extends State<HeaderActionButton> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHover = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHover = false;
        });
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(
              color: AppColors.hoveredColor,
              width: 1.5,
            ),
          ),
          child: Text(
            widget.text,
            style: const TextStyle(
                color: AppColors.textColor1,
                fontSize: AppTextSize.bigSize,
                fontWeight: AppFont.fontSizeBold),
          ),
        ),
      ),
    );
  }
}

