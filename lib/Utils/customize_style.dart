import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:offiql/Utils/sizes.dart';

import 'colors.dart';

class OffiqlCustomizeStyle {
  late final OffiqlSizes sizes;

  OffiqlCustomizeStyle()
      : sizes = OffiqlSizes(constraints: null, orientation: null);

  OffiqlCustomizeStyle.init(BoxConstraints constraints, Orientation orientation)
      : sizes = OffiqlSizes(constraints: constraints, orientation: orientation);

  // Text Styles
  Text offiqlHeader(
    String text, {
    int? maxLinesOfText,
    Color? textColor,
    double? fontSize,
    TextOverflow? onOverFlow,
    TextAlign? textAlign,
    TextStyle? textStyle,
    FontWeight? fontWeight2,
    bool isLevelTwo = false,
  }) {
    return Text(
      text,
      maxLines: maxLinesOfText,
      overflow: onOverFlow,
      textAlign: textAlign ?? TextAlign.left,
      style: textStyle ??
          headerStyle(
              fontWeight: fontWeight2, color: textColor, size: fontSize),
    );
  }

  Text offiqlSubHeader(String text,
      {int? maxLinesOfText,
      Color? textColor,
      double? fontSize,
      TextOverflow? onOverFlow,
      TextAlign? textAlign,
      TextStyle? textStyle}) {
    return Text(
      text,
      // maxLines: maxLinesOfText ?? 1,
      // overflow: onOverFlow ?? TextOverflow.visible,
      textAlign: textAlign ?? TextAlign.left,
      style: textStyle ?? subHeaderStyle(color: textColor, size: fontSize),
    );
  }

  Text body(String text, {TextAlign? textAlign, TextStyle? textStyle}) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.left,
      style: textStyle ?? bodyStyle(),
    );
  }

  bodyStyle({Color? color, FontWeight? fontWeight, double? fontSize}) {
    return TextStyle(
        fontSize: 2.0 * sizes.textMultiplier,
        color: color ?? Colors.black,
        fontWeight: fontWeight ?? FontWeight.bold);
  }

  TextStyle headerStyle({Color? color, FontWeight? fontWeight, double? size}) {
    return TextStyle(
      fontSize: size ?? 2.2 * sizes.textMultiplier,
      fontWeight: fontWeight ?? FontWeight.bold,
      color: color ?? Colors.white,
    );
  }

  TextStyle levelTwoHeader({Color? darkModeColor, Color? lightModeColor}) {
    return TextStyle(
      fontSize: 1.8 * sizes.textMultiplier,
      fontWeight: FontWeight.normal,
      color: Colors.white,
    );
  }

  TextStyle subHeaderStyle(
      {Color? color, FontWeight? fontWeight, double? size}) {
    return TextStyle(
      fontSize: size ?? 1.5 * sizes.textMultiplier,
      fontWeight: fontWeight ?? FontWeight.normal,
      color: color ?? Colors.black,
    );
  }

  Image offiqlImage(String imagePath,
      {double? widthInPercent,
      Key? imageKey,
      double? heightInPercent,
      BoxFit? fitting}) {
    return Image.asset(
      key: imageKey,
      imagePath,
      width: widthInPercent == null
          ? null
          : sizes.horizontalBlockSize * widthInPercent,
      height: heightInPercent == null
          ? null
          : sizes.verticalBlockSize * heightInPercent,
      fit: fitting ?? BoxFit.contain,
    );
  }

  // Button Styles
  Widget offiqlElevatedButton({
    required VoidCallback onPressed,
    BorderRadius? borderRadiusOfButton,
    Color? backgroundColor,
    Gradient? gradient,
    double? widthInPercent,
    double? heightInPercent,
    Color? borderColor,
    double? borderWidth,
    required Widget childOfButton,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: borderRadiusOfButton ??
            BorderRadius.circular(sizes.horizontalBlockSize * 4),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shadowColor: Colors.transparent, // Remove shadow if gradient is used
          shape: RoundedRectangleBorder(
            borderRadius: borderRadiusOfButton ??
                BorderRadius.circular(sizes.horizontalBlockSize * 4),
            side: borderColor != null
                ? BorderSide(color: borderColor, width: borderWidth ?? 1)
                : BorderSide.none,
          ),
          minimumSize: widthInPercent != null
              ? Size(
                  sizes.horizontalBlockSize * widthInPercent,
                  sizes.verticalBlockSize * (heightInPercent ?? 6.5),
                )
              : null,
        ),
        onPressed: onPressed,
        child: childOfButton,
      ),
    );
  }

// Icon Styles
  IconButton offiqlIconButton(
    IconData iconData, {
    required VoidCallback onPressed, // Click functionality
    Color? color,
    double? sizeOfIcon,
  }) {
    return IconButton(
      icon: offiqlIcon(
        iconData,
        color: color,
        sizeOfIcon: sizeOfIcon,
      ),
      onPressed: onPressed,
    );
  }

  Icon offiqlIcon(IconData iconData, {Color? color, double? sizeOfIcon}) {
    return Icon(
      iconData,
      size: sizeOfIcon ?? 2.0 * sizes.textMultiplier,
      color: color ?? Colors.white,
    );
  }

  Widget offiqlVerticalGap({double? verticalGapSizeInPercent}) {
    return SizedBox(
      height: sizes.getVerticalGapSize(
          verticalGapSizeInPercent:
              verticalGapSizeInPercent ?? sizes.verticalBlockSize),
    );
  }

  Expanded offiqlVerticalGapExpanded() {
    return const Expanded(
      child: SizedBox.shrink(),
    );
  }

  Widget offiqlHorizontalGap({double? horizontalGapSizeInPercent}) {
    return SizedBox(
      width: sizes.getHorizontalGapSize(
          horizontalGapSizeInPercent:
              horizontalGapSizeInPercent ?? sizes.horizontalBlockSize),
    );
  }

  Widget offiqlGapSize(
      {required double horizontalGapSizeInPercent,
      required double verticalGapSizeInPercent}) {
    return SizedBox(
      width: sizes.getHorizontalGapSize(
          horizontalGapSizeInPercent: horizontalGapSizeInPercent),
      height: sizes.getVerticalGapSize(
          verticalGapSizeInPercent: verticalGapSizeInPercent),
    );
  }

  // Padding of all screen
  EdgeInsets offiqlAllScreenPadding({double? ver, double? hor}) {
    return EdgeInsets.symmetric(
        horizontal: sizes.horizontalBlockSize * (hor ?? 4),
        vertical: sizes.horizontalBlockSize * (ver ?? 2));
  }

  LottieBuilder offiqlLottieImage(String imagePath,
      {double widthInPercent = 20, AnimationController? animationController}) {
    return Lottie.asset(
      imagePath,
      width: sizes.horizontalBlockSize * widthInPercent,
      fit: BoxFit.cover,
      controller: animationController,
      onLoaded: (composition) {
        if (animationController != null) {
          animationController.duration = composition.duration;
        }
      },
    );
  }
  // Margin of all screen
  EdgeInsets offiqlTextFieldContainerPadding() {
    return EdgeInsets.symmetric(
        horizontal: sizes.horizontalBlockSize * 4,
        vertical: sizes.horizontalBlockSize * 1.5);
  }

  BorderRadius offiqlTextFieldBorderRadius() {
    return BorderRadius.circular(sizes.textMultiplier * 2);
  }

  // TextField Styles
  TextField offiqlTextField({
    required TextEditingController controller,
    TextCapitalization? textCapitalization,
    Function(String text)? onChangedText,
    Color? textColor,
    double? textSize,
    VoidCallback? onPrefixIconPressed,
    IconData? prefixIcon,
    Color? colorPrefix,
    IconData? suffixIcon,
    Color? colorSuffix,
    IconData? suffixIcon2,
    Color? colorSuffix2,
    VoidCallback? onSuffixIconPressed,
    VoidCallback? onSuffixIcon2Pressed,
    String? hintText,
    Color? hintColor,
    String? labelText,
    String? helperText,
    Color? helperColor,
    int? helperMaxLines,
    FocusNode? focusNode,
    TextInputType? keyboardType,
    Color? cursorColor,
    bool multiLine = true,
    bool outerBorder = true,
    bool focusOuterBorder = true,
    EdgeInsets? contentPadding,
    bool obscureText = false,
    bool enabled = true,
    Color? focusColor,
    Color? unFocusColor,
  }) {
    return TextField(
      controller: controller,
      textCapitalization: TextCapitalization.sentences,
      onChanged: onChangedText,
      maxLines: multiLine ? 4 : 1,
      minLines: 1,
      focusNode: focusNode,
      keyboardType: keyboardType ?? TextInputType.text,
      enabled: enabled,
      obscureText: obscureText,
      style: subHeaderStyle(color: textColor, size: textSize),
      cursorColor: cursorColor ?? pureLightOrangeColor,
      decoration: InputDecoration(
        prefixIcon: prefixIcon != null
            ? IconButton(
                onPressed: onPrefixIconPressed,
                icon: offiqlIcon(
                  prefixIcon,
                  sizeOfIcon: 3.0 * sizes.textMultiplier,
                  color: colorPrefix,
                ),
              )
            : null,
        suffixIcon: suffixIcon != null || suffixIcon2 != null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (suffixIcon != null)
                    IconButton(
                      onPressed: onSuffixIconPressed,
                      icon: offiqlIcon(
                        suffixIcon,
                        sizeOfIcon: 3.0 * sizes.textMultiplier,
                        color: colorSuffix,
                      ),
                    ),
                  if (suffixIcon2 != null)
                    IconButton(
                      onPressed: onSuffixIcon2Pressed,
                      icon: offiqlIcon(
                        suffixIcon2,
                        sizeOfIcon: 3.0 * sizes.textMultiplier,
                        color: colorSuffix2,
                      ),
                    ),
                ],
              )
            : null,
        alignLabelWithHint: true,
        labelText: labelText,
        hintText: hintText,
        hintStyle: TextStyle(
          color: hintColor ?? hintTextColor,
          fontSize: 16.0,
        ),
        contentPadding: contentPadding ?? offiqlTextFieldContainerPadding(),
        enabledBorder: OutlineInputBorder(
          borderRadius: offiqlTextFieldBorderRadius(),
          borderSide: outerBorder
              ? BorderSide(
                  color: unFocusColor ?? receiverBubbleDark, width: 1.5)
              : BorderSide.none,
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: offiqlTextFieldBorderRadius(),
          borderSide: outerBorder
              ? BorderSide(
                  color: unFocusColor ?? receiverBubbleDark, width: 1.5)
              : BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: offiqlTextFieldBorderRadius(),
          borderSide: focusOuterBorder
              ? BorderSide(width: 1.5, color: focusColor ?? greyColor)
              : BorderSide.none,
        ),
      ),
    );
  }

  Widget offiqlShadedIconButton({
    required VoidCallback onPressed,
    required IconData icon,
    Color? iconColor,
    Color? backgroundColor,
    Color? borderColor,
    double? iconSize,
  }) {
    return Container(
        decoration: BoxDecoration(
            color: backgroundColor,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade800,
                spreadRadius: 1,
              ),
            ]),
        child: offiqlIconButton(
          icon,
          onPressed: onPressed,
          color: iconColor,
          sizeOfIcon: iconSize,
        ));
  }
}
