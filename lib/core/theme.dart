import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'const.dart';

class AppTheme {
  static TextTheme lightTextTheme() => TextTheme(
        headlineLarge: TextStyle(
          fontSize: 24.sp,
          color: kText1,
          fontWeight: FontWeight.w600,
          overflow: TextOverflow.ellipsis,
        ),
        headlineMedium: TextStyle(
          fontSize: 16.sp,
          color: kText1,
          fontWeight: FontWeight.w600,
          overflow: TextOverflow.ellipsis,
        ),
        headlineSmall: TextStyle(
          fontSize: 14.sp,
          color: kText1,
          fontWeight: FontWeight.w600,
          overflow: TextOverflow.ellipsis,
        ),
        titleMedium: TextStyle(
          fontSize: 16.sp,
          color: kText1,
          fontWeight: FontWeight.w500,
          overflow: TextOverflow.ellipsis,
        ),
        titleSmall: TextStyle(
          fontSize: 14.sp,
          color: kText1,
          fontWeight: FontWeight.w500,
          overflow: TextOverflow.ellipsis,
        ),
        bodySmall: TextStyle(
          fontSize: 14.sp,
          color: kText1,
          fontWeight: FontWeight.w500,
          overflow: TextOverflow.ellipsis,
        ),
        labelLarge: TextStyle(
          fontSize: 24.sp,
          color: kText1,
          fontWeight: FontWeight.w600,
          overflow: TextOverflow.ellipsis,
        ),
        labelMedium: TextStyle(
          fontSize: 20.sp,
          color: kText1,
          fontWeight: FontWeight.w600,
          overflow: TextOverflow.ellipsis,
        ),
        labelSmall: TextStyle(
          fontSize: 16.sp,
          color: kText1,
          fontWeight: FontWeight.w600,
          overflow: TextOverflow.ellipsis,
        ),
      );

  static ThemeData lightTheme() => ThemeData(
        brightness: Brightness.light,
        primaryColor: kPrimary,
        scaffoldBackgroundColor: Colors.white,
        textTheme: lightTextTheme(),
        fontFamily: 'Montserrat',
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        inputDecorationTheme: InputDecorationTheme(
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(
              color: kBorder1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(
              color: kBorder1,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(
              color: kPrimary,
              width: 2,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(
              color: kDanger,
              width: 2,
            ),
          ),
          contentPadding: EdgeInsets.symmetric(
              horizontal: kSpacingX5, vertical: kSpacingX4),
          hintStyle: lightTextTheme().bodySmall!.copyWith(color: kText4),
          labelStyle: lightTextTheme().bodySmall!.copyWith(color: kText4),
          errorStyle: lightTextTheme().bodySmall!.copyWith(color: kDanger),
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: kPrimary,
          textTheme: ButtonTextTheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kSpacingX14),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(kPrimary),
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
