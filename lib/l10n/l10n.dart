// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: 'Confirm',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: 'Save',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: 'Cancel',
      args: [],
    );
  }

  /// `Select Date Range`
  String get selectDateRange {
    return Intl.message(
      'Select Date Range',
      name: 'selectDateRange',
      desc: 'Select Date Range',
      args: [],
    );
  }

  /// `Start Date`
  String get startDate {
    return Intl.message(
      'Start Date',
      name: 'startDate',
      desc: 'Start Date',
      args: [],
    );
  }

  /// `End Date`
  String get endDate {
    return Intl.message(
      'End Date',
      name: 'endDate',
      desc: 'End Date',
      args: [],
    );
  }

  /// `Home`
  String get navHome {
    return Intl.message(
      'Home',
      name: 'navHome',
      desc: 'Home',
      args: [],
    );
  }

  /// `Plans`
  String get navPlans {
    return Intl.message(
      'Plans',
      name: 'navPlans',
      desc: 'Plans',
      args: [],
    );
  }

  /// `Visits`
  String get navVisits {
    return Intl.message(
      'Visits',
      name: 'navVisits',
      desc: 'Visits',
      args: [],
    );
  }

  /// `Todos`
  String get navTodos {
    return Intl.message(
      'Todos',
      name: 'navTodos',
      desc: 'Todos',
      args: [],
    );
  }

  /// `Menu`
  String get navMenu {
    return Intl.message(
      'Menu',
      name: 'navMenu',
      desc: 'Menu',
      args: [],
    );
  }

  /// `Login`
  String get authLoginTitle {
    return Intl.message(
      'Login',
      name: 'authLoginTitle',
      desc: 'Login Title',
      args: [],
    );
  }

  /// `And have access to all the features of the application`
  String get authLoginDescription {
    return Intl.message(
      'And have access to all the features of the application',
      name: 'authLoginDescription',
      desc: 'Login Description',
      args: [],
    );
  }

  /// `Username`
  String get authLoginUsername {
    return Intl.message(
      'Username',
      name: 'authLoginUsername',
      desc: 'Username',
      args: [],
    );
  }

  /// `Enter your username`
  String get authLoginUsernamePlaceholder {
    return Intl.message(
      'Enter your username',
      name: 'authLoginUsernamePlaceholder',
      desc: 'Username Placeholder',
      args: [],
    );
  }

  /// `Username is required`
  String get authLoginUsernameRequired {
    return Intl.message(
      'Username is required',
      name: 'authLoginUsernameRequired',
      desc: 'Username Required',
      args: [],
    );
  }

  /// `Password`
  String get authLoginPassword {
    return Intl.message(
      'Password',
      name: 'authLoginPassword',
      desc: 'Password',
      args: [],
    );
  }

  /// `Enter your password`
  String get authLoginPasswordPlaceholder {
    return Intl.message(
      'Enter your password',
      name: 'authLoginPasswordPlaceholder',
      desc: 'Password Placeholder',
      args: [],
    );
  }

  /// `Password is required`
  String get authLoginPasswordRequired {
    return Intl.message(
      'Password is required',
      name: 'authLoginPasswordRequired',
      desc: 'Password Required',
      args: [],
    );
  }

  /// `Login`
  String get authLoginSubmit {
    return Intl.message(
      'Login',
      name: 'authLoginSubmit',
      desc: 'Login Submit',
      args: [],
    );
  }

  /// `{count} Client`
  String tourClient(int count) {
    return Intl.message(
      '$count Client',
      name: 'tourClient',
      desc: 'Client',
      args: [count],
    );
  }

  /// `{percentage}%`
  String tourProgress(int percentage) {
    return Intl.message(
      '$percentage%',
      name: 'tourProgress',
      desc: 'Progress',
      args: [percentage],
    );
  }

  /// `Current Tour`
  String get tourCurrentTour {
    return Intl.message(
      'Current Tour',
      name: 'tourCurrentTour',
      desc: 'Current Tour',
      args: [],
    );
  }

  /// `Search per wilaya`
  String get tourSearchPerWilaya {
    return Intl.message(
      'Search per wilaya',
      name: 'tourSearchPerWilaya',
      desc: 'Search per wilaya',
      args: [],
    );
  }

  /// `All Plans`
  String get tourAllPlans {
    return Intl.message(
      'All Plans',
      name: 'tourAllPlans',
      desc: 'All Plans',
      args: [],
    );
  }

  /// `Pending Plans`
  String get tourPendingPlans {
    return Intl.message(
      'Pending Plans',
      name: 'tourPendingPlans',
      desc: 'Pending Plans',
      args: [],
    );
  }

  /// `In Progress Plans`
  String get tourInProgressPlans {
    return Intl.message(
      'In Progress Plans',
      name: 'tourInProgressPlans',
      desc: 'In Progress Plans',
      args: [],
    );
  }

  /// `Completed Plans`
  String get tourCompletedPlans {
    return Intl.message(
      'Completed Plans',
      name: 'tourCompletedPlans',
      desc: 'Completed Plans',
      args: [],
    );
  }

  /// `Pending`
  String get tourPendingStatus {
    return Intl.message(
      'Pending',
      name: 'tourPendingStatus',
      desc: 'Pending Status',
      args: [],
    );
  }

  /// `In Progress`
  String get tourInProgressStatus {
    return Intl.message(
      'In Progress',
      name: 'tourInProgressStatus',
      desc: 'In Progress Status',
      args: [],
    );
  }

  /// `Completed`
  String get tourCompletedStatus {
    return Intl.message(
      'Completed',
      name: 'tourCompletedStatus',
      desc: 'Completed Status',
      args: [],
    );
  }

  /// `No plans found`
  String get tourEmptyPlans {
    return Intl.message(
      'No plans found',
      name: 'tourEmptyPlans',
      desc: 'Empty Plans',
      args: [],
    );
  }

  /// `You don''t have any plans yet`
  String get tourEmptyPlansDescription {
    return Intl.message(
      'You don\'\'t have any plans yet',
      name: 'tourEmptyPlansDescription',
      desc: 'Empty Plans Description',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
