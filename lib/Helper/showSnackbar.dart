import 'package:flutter/material.dart';
import 'package:offiql/Extension/theme.dart';

import '../Utils/customize_style.dart';

void showSnackBar(String message, BuildContext context,
    {Color? bgColor,
    void Function()? onTap,
    String? title,
    bool actionNeeded = false}) {
  OffiqlCustomizeStyle appStyle = OffiqlCustomizeStyle();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: appStyle.subHeaderStyle(color: context.textColor),
      ),
      duration: Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      backgroundColor: bgColor ?? context.cardBg,
      shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(appStyle.sizes.horizontalBlockSize * 4)),
      margin: EdgeInsets.symmetric(
          vertical: appStyle.sizes.verticalBlockSize * 2,
          horizontal: appStyle.sizes.horizontalBlockSize * 4),
      action: actionNeeded
          ? SnackBarAction(
              label: title ?? "",
              onPressed: onTap ?? () {},
              textColor: Colors.black,
            )
          : null,
    ),
  );
}
