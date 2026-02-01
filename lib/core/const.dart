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

double kSpacingHalf = 2.h;
double kSpacingX1 = 4.h;
double kSpacingX2 = 6.h;
double kSpacingX3 = 8.h;
double kSpacingX4 = 12.h;
double kSpacingX5 = 16.h;
double kSpacingX6 = 20.h;
double kSpacingX7 = 24.h;
double kSpacingX8 = 32.h;
double kSpacingX9 = 40.h;
double kSpacingX10 = 52.h;
double kSpacingX11 = 64.h;
double kSpacingX12 = 72.h;
double kSpacingX13 = 96.h;
double kSpacingX14 = 500.h;

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

double kRadiusRounded = 500.h;

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

const String port = "8085";

// const String baseUrl = 'http://127.0.0.1:$port';
// const String baseUrl = 'http://bfmapp.damnserver.com:$port';
// const String baseUrl = 'http://upromedic.hopto.org:$port';
// const String baseUrl = 'http://bpoapp.damnserver.com:$port';
// const String baseUrl = 'http://pharmaco13.damnserver.com:$port';
// const String baseUrl = 'http://chelipharm.damnserver.com:$port';
// const String baseUrl = 'http://krdapp.damnserver.com:$port';
// const String baseUrl = 'https://client.vecopharm-dz.com:$port';
// const String baseUrl = 'http://192.168.0.14:$port';
// const String baseUrl = 'http://105.96.78.161:$port';
// const String baseUrl = 'http://saouli.damnserver.com:8089';
// const String baseUrl = 'http://192.168.9.105:8086';
// const String baseUrl = 'http://192.168.0.14:$port';
// const String baseUrl = 'http://10.0.2.2:$port';
// const String baseUrl = 'http://192.168.0.109:$port';
// const String baseUrl = 'http://optipharm.damnserver.com:$port';
// const String baseUrl = 'http://hq.icoperdis.com:$port';
// const String baseUrl = 'http://abm-api.damnserver.com:$port';
// const String baseUrl = 'http://pharmadrive.damnserver.com:$port';
// const String baseUrl = 'optipharm.damnserver.com';
// const String baseUrl = 'http://bestpharmaouest.damnserver.com:$port';
// const String baseUrl = 'http://crm.millennium-medic.com:$port';
const String baseUrl = 'http://crm.biopure.dz:$port';
// const String baseUrl = '141.94.250.58';
// const String baseUrl = '192.168.1.19';

const List<String> supportedLanguages = [
  'fr',
  'en',
  'ar',
];
