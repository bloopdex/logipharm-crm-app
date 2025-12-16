import 'package:crm/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'const.dart';

class AppTheme {
  static TextTheme lightTextTheme() => TextTheme(
        // Figma: titleH1
        displayLarge: TextStyle(
            fontSize: 32,
            height: 0.94,
            fontWeight: FontWeight.w600,
            overflow: TextOverflow.ellipsis,
            color: kText1),
        // Figma: titleH2
        displayMedium: TextStyle(
            fontSize: 30,
            height: 1.2,
            fontWeight: FontWeight.w500,
            overflow: TextOverflow.ellipsis,
            color: kText1),
        // Custom style not directly in TextTheme: titleH4
        displaySmall: TextStyle(
            fontSize: 22,
            height: 1.18,
            fontWeight: FontWeight.w600,
            overflow: TextOverflow.ellipsis,
            color: kText1),
        // Custom style not directly in TextTheme: titleH6
        headlineMedium: TextStyle(
            fontSize: 18,
            height: 1.33,
            fontWeight: FontWeight.w600,
            overflow: TextOverflow.ellipsis,
            color: kText1),
        // Custom style not directly in TextTheme: titleH8
        headlineSmall: TextStyle(
            fontSize: 16,
            height: 1.63,
            fontWeight: FontWeight.w600,
            overflow: TextOverflow.ellipsis,
            color: kText1),
        // Figma: paragraphMid
        bodyLarge: TextStyle(
            fontSize: 18,
            height: 1.39,
            fontWeight: FontWeight.w400,
            overflow: TextOverflow.ellipsis,
            color: kText1),
        // Custom style not directly in TextTheme: paragraphSm1
        bodyMedium: TextStyle(
            fontSize: 16,
            height: 1.25,
            fontWeight: FontWeight.w400,
            overflow: TextOverflow.ellipsis,
            color: kText1),
        // Figma: paragraphSm2
        titleMedium: TextStyle(
            fontSize: 14,
            height: 1.21,
            fontWeight: FontWeight.w400,
            overflow: TextOverflow.ellipsis,
            color: kText1),
        // Custom style for buttons not directly in TextTheme: buttonDefault
        labelLarge: TextStyle(
            fontSize: 18,
            height: 1.11,
            fontWeight: FontWeight.w600,
            overflow: TextOverflow.ellipsis,
            color: kText1),
        // Custom style not directly in TextTheme: buttonSmall
        bodySmall: TextStyle(
            fontSize: 16,
            height: 1.63,
            fontWeight: FontWeight.w600,
            overflow: TextOverflow.ellipsis,
            color: kText1),
        // Custom style not directly in TextTheme: notationSm
        labelSmall: TextStyle(
            fontSize: 14,
            height: 1,
            fontWeight: FontWeight.w500,
            overflow: TextOverflow.ellipsis,
            color: kText1),
      );

  static ThemeData lightTheme() => ThemeData(
        useMaterial3: true,
        visualDensity: VisualDensity.standard,
        colorScheme: ColorScheme(
          primary: kCeruleanBlue,
          secondary: kCeruleanBlue.shade500,
          surface: kWhite,
          background: kWhite,
          error: kCardinal,
          onPrimary: kWhite,
          onSecondary: kWhite,
          onSurface: kText1,
          onBackground: kText1,
          onError: kWhite,
          brightness: Brightness.light,
        ),
        splashColor: kCeruleanBlue.shade100,
        brightness: Brightness.light,
        primaryColor: kCeruleanBlue,
        canvasColor: kWhite,
        scaffoldBackgroundColor: Colors.white,
        textTheme: lightTextTheme(),
        fontFamily: 'Montserrat',
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          titleTextStyle: lightTextTheme().bodyMedium,
        ),
        dialogBackgroundColor: Colors.white,
        dialogTheme: DialogThemeData(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(ScreenUtil().setSp(10)),
            ),
          ),
        ),
        listTileTheme: ListTileThemeData(
          visualDensity: VisualDensity.standard,
          titleTextStyle: lightTextTheme().bodyLarge,
          subtitleTextStyle: lightTextTheme().bodyMedium,
          horizontalTitleGap: kSpacingX5,
          contentPadding: EdgeInsets.symmetric(
            horizontal: kPaddingMd2,
            vertical: kPaddingMd1,
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
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return kCeruleanBlue;
            }
            return kWhite;
          }),
          checkColor: MaterialStateProperty.all(kWhite),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: kBorder1,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        toggleButtonsTheme: ToggleButtonsThemeData(
          color: kText1,
          selectedColor: kWhite,
          fillColor: kCeruleanBlue,
          borderRadius: BorderRadius.circular(kSpacingX3),
          borderWidth: 0,
          borderColor: kBorder1,
          selectedBorderColor: kCeruleanBlue,
          constraints: BoxConstraints(
            minHeight: kSpacingX10,
            minWidth: kSpacingX10,
          ),
        ),
        switchTheme: SwitchThemeData(
          thumbColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return kWhite;
            }
            return kWhite;
          }),
          trackColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return kCeruleanBlue;
            }
            return kCodGray.shade400;
          }),
          overlayColor: MaterialStateProperty.all(kCeruleanBlue.withOpacity(0.3)),
          splashRadius: 24,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        dropdownMenuTheme: DropdownMenuThemeData(
          textStyle: lightTextTheme().bodyMedium,
          inputDecorationTheme: InputDecorationTheme(
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(kSpacingX3),
              borderSide: BorderSide(
                color: kBorder1,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(kSpacingX3),
              borderSide: BorderSide(
                color: kBorder1,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(kSpacingX3),
              borderSide: const BorderSide(
                color: kCeruleanBlue,
                width: 2,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(kSpacingX3),
              borderSide: const BorderSide(
                color: kCardinal,
                width: 2,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: kSpacingX5, vertical: kSpacingX4),
            hintStyle: lightTextTheme().bodySmall!.copyWith(color: kText4),
            labelStyle: lightTextTheme().bodySmall!.copyWith(color: kText4),
            errorStyle: lightTextTheme().labelSmall!.copyWith(color: kCardinal),
          ),
          menuStyle: MenuStyle(
            backgroundColor: MaterialStateProperty.all(kWhite),
            surfaceTintColor: MaterialStateProperty.all(Colors.transparent),
            padding: MaterialStateProperty.all(EdgeInsets.symmetric(
              horizontal: kSpacingX10,
            )),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(kSpacingX3),
              ),
            ),
          ),
        ),
        popupMenuTheme: PopupMenuThemeData(
          color: kWhite,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kSpacingX3),
          ),
        ),
        radioTheme: RadioThemeData(
          fillColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return kCeruleanBlue;
            }
            return kCodGray.shade400;
          }),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        tabBarTheme: TabBarThemeData(
          indicatorColor: kTextPrimary,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(
            color: kCeruleanBlue.shade100,
            borderRadius: BorderRadius.circular(kSpacingX12),
          ),
          labelColor: kPrimaryColor,
          labelStyle: lightTextTheme().headlineSmall,
          labelPadding: EdgeInsets.symmetric(horizontal: kPaddingSm3),
          unselectedLabelColor: kText1,
          dividerColor: Colors.transparent,
          tabAlignment: TabAlignment.start,
        ),
        datePickerTheme: DatePickerThemeData(
          backgroundColor: Colors.white,
          elevation: 2.0,
          shadowColor: kBgBlack,
          surfaceTintColor: kCeruleanBlue.shade100,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.h)),
          headerBackgroundColor: kCeruleanBlue.shade600,
          headerForegroundColor: kWhite,
          headerHeadlineStyle: TextStyle(color: kWhite, fontSize: 18.h),
          headerHelpStyle: TextStyle(color: kWhite.withOpacity(0.7), fontSize: 16.h),
          weekdayStyle: TextStyle(color: kCodGray.shade900, fontSize: 14.h),
          dayStyle: TextStyle(color: kCodGray.shade900, fontSize: 14.h),
          dayForegroundColor:
              MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
            if (states.contains(MaterialState.selected)) {
              return kWhite;
            }
            return kCodGray.shade900;
          }),
          dayBackgroundColor:
              MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
            if (states.contains(MaterialState.selected)) {
              return kCeruleanBlue.shade600;
            }
            return kWhite;
          }),
          dayOverlayColor: MaterialStateProperty.all(kCeruleanBlue.withOpacity(0.3)),
          todayForegroundColor:
              MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
            if (states.contains(MaterialState.selected)) {
              return kWhite;
            }
            return kPrimaryColor;
          }),
          todayBackgroundColor:
              MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
            if (states.contains(MaterialState.selected)) {
              return kPrimaryColor;
            }
            return kWhite;
          }),
          todayBorder: BorderSide(color: kPrimaryColor),
          yearStyle: TextStyle(color: kCodGray.shade900, fontSize: 16.h),
          yearForegroundColor:
              MaterialStateProperty.resolveWith<Color?>((Set<MaterialState> states) {
            if (states.contains(MaterialState.selected)) {
              return kWhite;
            }
            return kCodGray.shade900;
          }),
          yearBackgroundColor: MaterialStateProperty.all(kWhite),
          yearOverlayColor: MaterialStateProperty.all(kCeruleanBlue.shade100),
          rangePickerBackgroundColor: Colors.white,
          rangePickerElevation: 2.0,
          rangePickerShadowColor: kBgBlack,
          rangePickerSurfaceTintColor: kCeruleanBlue.shade100,
          rangePickerShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.h)),
          rangePickerHeaderBackgroundColor: kCeruleanBlue,
          rangePickerHeaderForegroundColor: kWhite,
          rangePickerHeaderHeadlineStyle: TextStyle(color: kWhite, fontSize: 18.h),
          rangePickerHeaderHelpStyle: TextStyle(color: kWhite.withOpacity(0.7), fontSize: 16.h),
          rangeSelectionBackgroundColor: kCeruleanBlue.shade100,
          rangeSelectionOverlayColor: MaterialStateProperty.all(kCeruleanBlue.shade200),
          dividerColor: kBorder1,
          cancelButtonStyle: TextButton.styleFrom(foregroundColor: kCodGray.shade900),
          confirmButtonStyle: TextButton.styleFrom(foregroundColor: kCeruleanBlue.shade600),
        ),
        dataTableTheme: DataTableThemeData(
          dataTextStyle: lightTextTheme().bodyMedium,
          headingTextStyle: lightTextTheme().bodyMedium,
          headingRowHeight: 56,
          horizontalMargin: 0,
          columnSpacing: 0,
          dividerThickness: 1,
          headingRowColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return kCeruleanBlue.shade100;
            }
            return kWhite;
          }),
          decoration: BoxDecoration(
            color: kWhite,
            border: Border.all(
              color: kBorder1,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(kSpacingX3),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(kSpacingX3),
            borderSide: BorderSide(
              color: kBorder1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(kSpacingX3),
            borderSide: BorderSide(
              color: kBorder1,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(kSpacingX3),
            borderSide: const BorderSide(
              color: kCeruleanBlue,
              width: 2,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(kSpacingX3),
            borderSide: const BorderSide(
              color: kCardinal,
              width: 2,
            ),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: kSpacingX5, vertical: kSpacingX4),
          hintStyle: lightTextTheme().bodySmall!.copyWith(color: kText4),
          labelStyle: lightTextTheme().bodySmall!.copyWith(color: kText4),
          errorStyle: lightTextTheme().bodySmall!.copyWith(color: kCardinal),
          errorMaxLines: 3,
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
