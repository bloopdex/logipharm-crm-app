import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const String images = 'assets/images/';
const String icons = 'assets/icons/';

const Map<int, Color> cardinal = {
  100: Color(0xFFFDE4D6),
  200: Color(0xFFFCC3AF),
  300: Color(0xFFF69985),
  400: Color(0xFFED7165),
  500: Color(0xFFE23636),
  600: Color(0xFFC22734),
  700: Color(0xFFA21B32),
  800: Color(0xFF83112E),
  900: Color(0xFF6C0A2C),
};

const Map<int, Color> codGray = {
  50: Color(0xFFF4F5F7),
  100: Color(0xFFEEF0F1),
  200: Color(0xFFC9D1D8),
  300: Color(0xFFB3BCC7),
  400: Color(0xFF7D8993),
  500: Color(0xFF5F707B),
  600: Color(0xFF525B68),
  700: Color(0xFF434F5B),
  800: Color(0xFF3C454E),
  900: Color(0xFF363D43),
  950: Color(0xFF090A0C),
};

const Map<int, Color> ceruleanBlue = {
  100: Color(0xFFDBE6FE),
  200: Color(0xFFBFD5FE),
  300: Color(0xFF92BAFE),
  400: Color(0xFF5F95FB),
  500: Color(0xFF3A6FF7),
  600: Color(0xFF2B54ED),
  700: Color(0xFF1C3AD9),
  800: Color(0xFF1D30B0),
  900: Color(0xFF1D2F8B),
  950: Color(0xFF171F54),
};

const Map<int, Color> highland = {
  100: Color(0xFFE2FBD4),
  200: Color(0xFFBFF8AA),
  300: Color(0xFF91EA7B),
  400: Color(0xFF65D557),
  500: Color(0xFF2BBA28),
  600: Color(0xFF1D9F25),
  700: Color(0xFF148525),
  800: Color(0xFF0C6B23),
  900: Color(0xFF075921),
};

const Map<int, Color> warning = {
  100: Color(0xFFFFF6CC),
  200: Color(0xFFFFEC99),
  300: Color(0xFFFFE066),
  400: Color(0xFFFFCC3F),
  500: Color(0xFFFFC300),
  600: Color(0xFFDB9900),
  700: Color(0xFFC27400),
  800: Color(0xFFA75701),
  900: Color(0xFF7A4100),
};

const kCeruleanBlue = MaterialColor(0xFF2B54ED, ceruleanBlue);
const kCardinal = MaterialColor(0xFFE23636, cardinal);
const kCodGray = MaterialColor(0xFF949FA6, codGray);
const kHighland = MaterialColor(0xFF2BBA28, highland);
const kBrightSun = MaterialColor(0xFFDB9900, warning);

Color kWhite = Colors.white;
Color kOverlay = Colors.black.withOpacity(.5);

Color kPrimaryColor = kCeruleanBlue.shade600;
Color kSuccessColor = kHighland.shade500;

Color kTextLight = Colors.white;
Color kText5 = kCodGray.shade400;
Color kText4 = kCodGray.shade500;
Color kText3 = kCodGray.shade600;
Color kText2 = kCodGray.shade800;
Color kText1 = kCodGray.shade900;
Color kTextPrimary = kCeruleanBlue.shade500;

Color kBorder1 = kCodGray.shade400;
Color kBorder3 = kCodGray.shade200;
Color kBorderBlue = kCeruleanBlue.shade200;

Color kBgGrayVisibility1 = kCodGray.shade50;
Color kBgGrayVisibility2 = kCodGray.shade100;
Color kBgGrayVisibility3 = kCodGray.shade200;
Color kBgGrayVisibility4 = kCodGray.shade300;
Color kBgGrayVisibility5 = kCodGray.shade400;
Color kBgGrayVisibility6 = kCodGray.shade500;
Color kBgBlack = kCodGray.shade900;
Color kBgButtonSecondary = kBgGrayVisibility2;

double kSpacingHalf = 2.sp;
double kSpacingX1 = 4.sp;
double kSpacingX2 = 6.sp;
double kSpacingX3 = 8.sp;
double kSpacingX4 = 12.sp;
double kSpacingX5 = 16.sp;
double kSpacingX6 = 20.sp;
double kSpacingX7 = 24.sp;
double kSpacingX8 = 32.sp;
double kSpacingX9 = 40.sp;
double kSpacingX10 = 52.sp;
double kSpacingX11 = 64.sp;
double kSpacingX12 = 72.sp;
double kSpacingX13 = 96.sp;
double kSpacingX14 = 500.sp;

double kPaddingSm1 = kSpacingHalf;
double kPaddingSm2 = kSpacingX1;
double kPaddingSm3 = kSpacingX3;
double kPaddingMd1 = kSpacingX4;
double kPaddingMd2 = kSpacingX5;
double kPaddingMd3 = kSpacingX6;
double kPaddingLg1 = kSpacingX7;
double kPaddingLg2 = kSpacingX9;
double kPaddingLg3 = kSpacingX10;
double kPaddingLg4 = kSpacingX11;

double kRadiusRounded = 500.sp;

BoxShadow kDropShadowPrimary = BoxShadow(
  color: Colors.black.withOpacity(.15),
  blurRadius: 0,
  offset: const Offset(0, 2),
  spreadRadius: 0,
);

BoxShadow kDropShadowSecondary = BoxShadow(
  color: Colors.black.withOpacity(.11),
  blurRadius: 24,
  offset: const Offset(0, -2),
  spreadRadius: 0,
);
const String HTTPS = 'https://';
const String HTTP = 'http://';
const String baseUrl = 'pharmadrive.damnserver.com';
const String port = "8085";
const String version = '';

const List<String> supportedLanguages = [
  'fr',
  'en',
  'ar',
];
