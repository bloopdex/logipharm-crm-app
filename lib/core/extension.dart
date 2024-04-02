import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../l10n/l10n.dart';

extension ColorExtension on Color {
  Color get lighter => Color.fromARGB(
        alpha,
        (red + 255) ~/ 2,
        (green + 255) ~/ 2,
        (blue + 255) ~/ 2,
      );
  Color get darker => Color.fromARGB(
        alpha,
        red ~/ 2,
        green ~/ 2,
        blue ~/ 2,
      );
}

extension TranslationExtension on BuildContext {
  S get i10n => S.of(this);
}

extension TranslationBlocExtension on Bloc {
  S get i10n => S.current;
}

extension GetTheme on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
  ButtonStyle get elevatedButtonTheme =>
      Theme.of(this).elevatedButtonTheme.style!;
}

extension Navigation on BuildContext {
  void push(Widget page) {
    Navigator.of(this).push(
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }

  void pushReplacement(Widget page) {
    Navigator.of(this).pushReplacement(
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }

  void pushAndRemoveUntil(Widget page) {
    Navigator.of(this).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => page,
      ),
      (route) => false,
    );
  }

  void pop({bool? pop}) {
    Navigator.of(this).pop(pop);
  }

  void pushNamed(String routeName, {Object? arguments}) {
    Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  void pushNamedAndRemoveUntil(String routeName) {
    Navigator.of(this).pushNamedAndRemoveUntil(routeName, (route) => false);
  }

  void pushReplacementNamed(String routeName) {
    Navigator.of(this).pushReplacementNamed(routeName);
  }
}

extension ScreenSize on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
  double get paddingTop => MediaQuery.of(this).padding.top;
  double get paddingBottom => MediaQuery.of(this).padding.bottom;
  double get paddingLeft => MediaQuery.of(this).padding.left;
  double get paddingRight => MediaQuery.of(this).padding.right;
  double get appBarSize => MediaQuery.of(this).padding.top + kToolbarHeight;
  double get bottomNavigationBarSize => kBottomNavigationBarHeight;
}

extension SnackBarExtension on BuildContext {
  void successSnackBar(String message) {
    final snackBar = SnackBar(
      elevation: 0,
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'Success', // Update the title to indicate success
        message: message,
        contentType: ContentType.success,
      ),
    );
    ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  void errorSnackBar(String message) {
    final snackBar = SnackBar(
      elevation: 0,
      duration: const Duration(seconds: 3),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'Error', // Update the title to indicate error
        message: message,
        contentType: ContentType.failure,
      ),
    );
    ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  void warningSnackBar(String message) {
    final snackBar = SnackBar(
      elevation: 0,
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'Warning', // Update the title to indicate warning
        message: message,
        contentType: ContentType.warning,
      ),
    );
    ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  void infoSnackBar(String title, String message) {
    final snackBar = SnackBar(
      elevation: 0,
      duration: const Duration(seconds: 2),
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: title,
        message: message,
        contentType: ContentType.help,
      ),
    );
    ScaffoldMessenger.of(this)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}

extension DateFormaterExtension on DateTime {
  String YYYYMMdd({String separator = "-"}) {
    return DateFormat("yyyy${separator}MM${separator}dd").format(this);
  }

  String ddMMYYYY({String separator = "-"}) {
    return DateFormat("dd${separator}MM${separator}yyyy").format(this);
  }

  String ddMMYYYYHHMMSS({String separator = "-"}) {
    return DateFormat("dd${separator}MM${separator}yyyy HH:mm:ss").format(this);
  }

  String HHMMSS({String separator = ":"}) {
    return DateFormat("HH${separator}mm${separator}ss").format(this);
  }

  String HHMM({String separator = ":"}) {
    return DateFormat("HH${separator}mm").format(this);
  }

  String MMMMyyyy() {
    return DateFormat("MMMM yyyy").format(this);
  }

  String MMMMdyyyy() {
    return DateFormat("MMMM d, yyyy").format(this);
  }

  String MMMdyyyy() {
    return DateFormat("MMM d, yyyy").format(this);
  }

  String MMMd() {
    return DateFormat("MMM d").format(this);
  }
}

extension StringExtensions on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }

  String capitalizeFirstofEach() {
    return split(" ").map((e) => e.capitalize()).toList().join(" ");
  }

  String get initials => split(" ").map((e) => e[0]).join();
}
