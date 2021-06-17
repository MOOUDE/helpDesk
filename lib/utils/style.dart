import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:helpdesk/utils/colors.dart';

/// Class that contains all the different styles of an app
class Style {
  ///App LOGO PATH
  static const String LOGO_PATH = 'assets/icons/logo.svg';

  static const String DEFAULT_USER_IMG =
      "https://freepikpsd.com/media/2019/10/default-user-profile-image-png-6-Transparent-Images.png";

  /// Custom page transitions
  static final _pageTransitionsTheme = PageTransitionsTheme(
    builders: const {
      TargetPlatform.android: ZoomPageTransitionsBuilder(),
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
    },
  );

  /// Light style
  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.lightPrimaryColor,
    accentColor: AppColors.lightAccentColor,
    pageTransitionsTheme: _pageTransitionsTheme,
    textTheme: GoogleFonts.rubikTextTheme(ThemeData.light().textTheme),
  );

  ///app body text styles
  static final defaultBodyTextStyle = TextStyle(
    color: AppColors.defaultAppTextColor,
    fontSize: 14,
  );

  ///app heading styles
  static final headingTextStyle = TextStyle(
    color: AppColors.defaultAppTextColor.withOpacity(0.8),
    fontSize: 18,
  );
}
