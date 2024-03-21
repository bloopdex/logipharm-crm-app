import 'package:crm/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'const.dart';

class AppTheme {
  static TextTheme lightTextTheme() => const TextTheme(
        // Figma: titleH1
        displayLarge: TextStyle(
          fontSize: 32,
          height: 0.94,
          fontWeight: FontWeight.w600,
        ),
        // Figma: titleH2
        displayMedium: TextStyle(
          fontSize: 30,
          height: 1.2,
          fontWeight: FontWeight.w500,
        ),
        // Custom style not directly in TextTheme: titleH4
        displaySmall: TextStyle(
          fontSize: 22,
          height: 1.18,
          fontWeight: FontWeight.w600,
        ),
        // Custom style not directly in TextTheme: titleH6
        headlineMedium: TextStyle(
          fontSize: 18,
          height: 1.33,
          fontWeight: FontWeight.w600,
        ),
        // Custom style not directly in TextTheme: titleH8
        headlineSmall: TextStyle(
          fontSize: 16,
          height: 1.63,
          fontWeight: FontWeight.w600,
        ),
        // Figma: paragraphMid
        bodyLarge: TextStyle(
          fontSize: 18,
          height: 1.39,
          fontWeight: FontWeight.w400,
        ),
        // Custom style not directly in TextTheme: paragraphSm1
        bodyMedium: TextStyle(
          fontSize: 16,
          height: 1.25,
          fontWeight: FontWeight.w400,
        ),
        // Figma: paragraphSm2
        titleMedium: TextStyle(
          fontSize: 14,
          height: 1.21,
          fontWeight: FontWeight.w400,
        ),
        // Custom style for buttons not directly in TextTheme: buttonDefault
        labelLarge: TextStyle(
          fontSize: 18,
          height: 1.11,
          fontWeight: FontWeight.w600,
        ),
        // Custom style not directly in TextTheme: buttonSmall
        bodySmall: TextStyle(
          fontSize: 16,
          height: 1.63,
          fontWeight: FontWeight.w600,
        ),
        // Custom style not directly in TextTheme: notationSm
        labelSmall: TextStyle(
          fontSize: 14,
          height: 1,
          fontWeight: FontWeight.w500,
        ),
      );

  static ThemeData lightTheme() => ThemeData(
        brightness: Brightness.light,
        primaryColor: kCeruleanBlue,
        scaffoldBackgroundColor: Colors.white,
        textTheme: lightTextTheme(),
        fontFamily: 'Montserrat',
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        dialogBackgroundColor: Colors.white,
        dialogTheme: DialogTheme(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(ScreenUtil().setSp(10)),
            ),
          ),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: kPrimaryColor,
          foregroundColor: kWhite,
          iconSize: kSpacingX7,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kRadiusRounded),
          ),
        ),
        datePickerTheme: DatePickerThemeData(
          backgroundColor: Colors.white,
          elevation: 2.0,
          shadowColor: kBgBlack,
          surfaceTintColor: kCeruleanBlue.shade100,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.sp)),
          headerBackgroundColor: kCeruleanBlue.shade600,
          headerForegroundColor: kWhite,
          headerHeadlineStyle: TextStyle(color: kWhite, fontSize: 18.sp),
          headerHelpStyle:
              TextStyle(color: kWhite.withOpacity(0.7), fontSize: 16.sp),
          weekdayStyle: TextStyle(color: kCodGray.shade900, fontSize: 14.sp),
          dayStyle: TextStyle(color: kCodGray.shade900, fontSize: 14.sp),
          dayForegroundColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.selected)) {
              return kWhite;
            }
            return kCodGray.shade900;
          }),
          dayBackgroundColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.selected)) {
              return kCeruleanBlue.shade600;
            }
            return kWhite;
          }),
          dayOverlayColor:
              MaterialStateProperty.all(kCeruleanBlue.withOpacity(0.3)),
          todayForegroundColor: MaterialStatePropertyAll(kPrimaryColor),
          todayBackgroundColor: MaterialStatePropertyAll(kPrimaryColor),
          todayBorder: BorderSide(color: kPrimaryColor),
          yearStyle: TextStyle(color: kCodGray.shade900, fontSize: 16.sp),
          yearForegroundColor:
              MaterialStateProperty.all(kCeruleanBlue.shade600),
          yearBackgroundColor: MaterialStateProperty.all(kWhite),
          yearOverlayColor: MaterialStateProperty.all(kCeruleanBlue.shade100),
          rangePickerBackgroundColor: Colors.white,
          rangePickerElevation: 2.0,
          rangePickerShadowColor: kBgBlack,
          rangePickerSurfaceTintColor: kCeruleanBlue.shade100,
          rangePickerShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.sp)),
          rangePickerHeaderBackgroundColor: kCeruleanBlue,
          rangePickerHeaderForegroundColor: kWhite,
          rangePickerHeaderHeadlineStyle:
              TextStyle(color: kWhite, fontSize: 18.sp),
          rangePickerHeaderHelpStyle:
              TextStyle(color: kWhite.withOpacity(0.7), fontSize: 16.sp),
          rangeSelectionBackgroundColor: kCeruleanBlue.shade100,
          rangeSelectionOverlayColor:
              MaterialStateProperty.all(kCeruleanBlue.shade200),
          dividerColor: kBorder1,
          cancelButtonStyle:
              TextButton.styleFrom(foregroundColor: kCodGray.shade900),
          confirmButtonStyle:
              TextButton.styleFrom(foregroundColor: kCeruleanBlue.shade600),
        ),
        inputDecorationTheme: InputDecorationTheme(
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(kRadiusRounded),
            borderSide: BorderSide(
              color: kBorder1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(kRadiusRounded),
            borderSide: BorderSide(
              color: kBorder1,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(kRadiusRounded),
            borderSide: const BorderSide(
              color: kCeruleanBlue,
              width: 2,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(kRadiusRounded),
            borderSide: const BorderSide(
              color: kCardinal,
              width: 2,
            ),
          ),
          contentPadding: EdgeInsets.symmetric(
              horizontal: kSpacingX5, vertical: kSpacingX4),
          hintStyle: lightTextTheme().bodySmall!.copyWith(color: kText4),
          labelStyle: lightTextTheme().bodySmall!.copyWith(color: kText4),
          errorStyle: lightTextTheme().bodySmall!.copyWith(color: kCardinal),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: kCeruleanBlue,
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kSpacingX14),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(kCeruleanBlue),
            padding: MaterialStateProperty.all(EdgeInsets.all(kSpacingX5)),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(kSpacingX14),
              ),
            ),
          ),
        ),
      );
}
