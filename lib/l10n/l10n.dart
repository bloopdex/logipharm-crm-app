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

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: 'Error',
      args: [],
    );
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

  /// `Start`
  String get start {
    return Intl.message(
      'Start',
      name: 'start',
      desc: 'Start',
      args: [],
    );
  }

  /// `Finish`
  String get finish {
    return Intl.message(
      'Finish',
      name: 'finish',
      desc: 'Finish',
      args: [],
    );
  }

  /// `View Details`
  String get viewDetails {
    return Intl.message(
      'View Details',
      name: 'viewDetails',
      desc: 'View Details',
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

  /// `Later`
  String get later {
    return Intl.message(
      'Later',
      name: 'later',
      desc: 'Later',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: 'Next',
      args: [],
    );
  }

  /// `Validate`
  String get validate {
    return Intl.message(
      'Validate',
      name: 'validate',
      desc: 'Validate',
      args: [],
    );
  }

  /// `Created At`
  String get createdAt {
    return Intl.message(
      'Created At',
      name: 'createdAt',
      desc: 'Created At',
      args: [],
    );
  }

  /// `Pending`
  String get pending {
    return Intl.message(
      'Pending',
      name: 'pending',
      desc: 'Pending',
      args: [],
    );
  }

  /// `In Progress`
  String get inProgress {
    return Intl.message(
      'In Progress',
      name: 'inProgress',
      desc: 'In Progress',
      args: [],
    );
  }

  /// `Completed`
  String get completed {
    return Intl.message(
      'Completed',
      name: 'completed',
      desc: 'Completed',
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

  /// `Select Date`
  String get selectDate {
    return Intl.message(
      'Select Date',
      name: 'selectDate',
      desc: 'Select Date',
      args: [],
    );
  }

  /// `Today`
  String get today {
    return Intl.message(
      'Today',
      name: 'today',
      desc: 'Today',
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

  /// `Create New Plan`
  String get tourCreateNewPlan {
    return Intl.message(
      'Create New Plan',
      name: 'tourCreateNewPlan',
      desc: 'Create New Plan',
      args: [],
    );
  }

  /// `Tour Details`
  String get tourCreationTourDetailsTitle {
    return Intl.message(
      'Tour Details',
      name: 'tourCreationTourDetailsTitle',
      desc: 'Tour Details Title',
      args: [],
    );
  }

  /// `Choose the delegate responsible for this tour plan and enter the date scheduled for the tour.`
  String get tourCreationTourDetailsDescription {
    return Intl.message(
      'Choose the delegate responsible for this tour plan and enter the date scheduled for the tour.',
      name: 'tourCreationTourDetailsDescription',
      desc: 'Tour Details Description',
      args: [],
    );
  }

  /// `Delegate`
  String get tourCreationTourDetailsDelegateLabel {
    return Intl.message(
      'Delegate',
      name: 'tourCreationTourDetailsDelegateLabel',
      desc: 'Delegate',
      args: [],
    );
  }

  /// `Date`
  String get tourCreationTourDetailsDateLabel {
    return Intl.message(
      'Date',
      name: 'tourCreationTourDetailsDateLabel',
      desc: 'Date',
      args: [],
    );
  }

  /// `Client To Visits`
  String get tourCreationClientVisitsTitle {
    return Intl.message(
      'Client To Visits',
      name: 'tourCreationClientVisitsTitle',
      desc: 'Client To Visits Title',
      args: [],
    );
  }

  /// `Select the clients you want to visit during this tour.`
  String get tourCreationClientVisitsDescription {
    return Intl.message(
      'Select the clients you want to visit during this tour.',
      name: 'tourCreationClientVisitsDescription',
      desc: 'Client To Visits Description',
      args: [],
    );
  }

  /// `Region`
  String get tourCreationRegionLabel {
    return Intl.message(
      'Region',
      name: 'tourCreationRegionLabel',
      desc: 'Region',
      args: [],
    );
  }

  /// `Select a region`
  String get tourCreationRegionPlaceholder {
    return Intl.message(
      'Select a region',
      name: 'tourCreationRegionPlaceholder',
      desc: 'Region Placeholder',
      args: [],
    );
  }

  /// `Clients`
  String get tourCreationClientsLabel {
    return Intl.message(
      'Clients',
      name: 'tourCreationClientsLabel',
      desc: 'Clients',
      args: [],
    );
  }

  /// `No clients found`
  String get tourCreationClientEmptyTitle {
    return Intl.message(
      'No clients found',
      name: 'tourCreationClientEmptyTitle',
      desc: 'Empty Clients',
      args: [],
    );
  }

  /// `No clients found in this region`
  String get tourCreationClientEmptyDescription {
    return Intl.message(
      'No clients found in this region',
      name: 'tourCreationClientEmptyDescription',
      desc: 'Empty Clients Description',
      args: [],
    );
  }

  /// `No address`
  String get tourCreationNoAddress {
    return Intl.message(
      'No address',
      name: 'tourCreationNoAddress',
      desc: 'No address',
      args: [],
    );
  }

  /// `Overview and Validation`
  String get tourValidationTitle {
    return Intl.message(
      'Overview and Validation',
      name: 'tourValidationTitle',
      desc: 'Overview and Validation',
      args: [],
    );
  }

  /// `Tour Plan, By:`
  String get tourValidationPlanBy {
    return Intl.message(
      'Tour Plan, By:',
      name: 'tourValidationPlanBy',
      desc: 'Tour Plan, By:',
      args: [],
    );
  }

  /// `Region`
  String get tourValidationRegion {
    return Intl.message(
      'Region',
      name: 'tourValidationRegion',
      desc: 'Region',
      args: [],
    );
  }

  /// `The Creation Of The Tour Plan Is In Progress`
  String get tourCreationInProgressTitle {
    return Intl.message(
      'The Creation Of The Tour Plan Is In Progress',
      name: 'tourCreationInProgressTitle',
      desc: 'The Creation Of The Tour Plan Is In Progress',
      args: [],
    );
  }

  /// `We are finalizing the details of your tour plan. Thank you for your patience.`
  String get tourCreationInProgressDescription {
    return Intl.message(
      'We are finalizing the details of your tour plan. Thank you for your patience.',
      name: 'tourCreationInProgressDescription',
      desc:
          'We are finalizing the details of your tour plan. Thank you for your patience.',
      args: [],
    );
  }

  /// `An error occurred`
  String get tourCreationErrorTitle {
    return Intl.message(
      'An error occurred',
      name: 'tourCreationErrorTitle',
      desc: 'An error occurred',
      args: [],
    );
  }

  /// `An error occurred while creating the tour plan. Please try again later.`
  String get tourCreationErrorDescription {
    return Intl.message(
      'An error occurred while creating the tour plan. Please try again later.',
      name: 'tourCreationErrorDescription',
      desc:
          'An error occurred while creating the tour plan. Please try again later.',
      args: [],
    );
  }

  /// `Successfully created tour plan`
  String get tourCreationSuccessTitle {
    return Intl.message(
      'Successfully created tour plan',
      name: 'tourCreationSuccessTitle',
      desc: 'Successfully created tour plan',
      args: [],
    );
  }

  /// `Your tour plan has been successfully created. You can now view and manage your planned tours.`
  String get tourCreationSuccessDescription {
    return Intl.message(
      'Your tour plan has been successfully created. You can now view and manage your planned tours.',
      name: 'tourCreationSuccessDescription',
      desc:
          'Your tour plan has been successfully created. You can now view and manage your planned tours.',
      args: [],
    );
  }

  /// `Do You Want To Start The Tour Now?`
  String get tourCreationStartTour {
    return Intl.message(
      'Do You Want To Start The Tour Now?',
      name: 'tourCreationStartTour',
      desc: 'Do You Want To Start The Tour Now?',
      args: [],
    );
  }

  /// `You can start the tour now or later from the list of planned tours.`
  String get tourCreationStartTourDescription {
    return Intl.message(
      'You can start the tour now or later from the list of planned tours.',
      name: 'tourCreationStartTourDescription',
      desc:
          'You can start the tour now or later from the list of planned tours.',
      args: [],
    );
  }

  /// `Tour Details`
  String get tourDetailsTitle {
    return Intl.message(
      'Tour Details',
      name: 'tourDetailsTitle',
      desc: 'Tour Details',
      args: [],
    );
  }

  /// `Tour Plan By`
  String get tourDetailsTourBy {
    return Intl.message(
      'Tour Plan By',
      name: 'tourDetailsTourBy',
      desc: 'Tour Plan By',
      args: [],
    );
  }

  /// `Region`
  String get tourDetailsRegion {
    return Intl.message(
      'Region',
      name: 'tourDetailsRegion',
      desc: 'Region',
      args: [],
    );
  }

  /// `Clients`
  String get tourDetailsClients {
    return Intl.message(
      'Clients',
      name: 'tourDetailsClients',
      desc: 'Clients',
      args: [],
    );
  }

  /// `All Clients`
  String get tourDetailsAllClients {
    return Intl.message(
      'All Clients',
      name: 'tourDetailsAllClients',
      desc: 'All Clients',
      args: [],
    );
  }

  /// `Visited`
  String get tourDetailsVisited {
    return Intl.message(
      'Visited',
      name: 'tourDetailsVisited',
      desc: 'Visited',
      args: [],
    );
  }

  /// `Non Visited`
  String get tourDetailsNonVisited {
    return Intl.message(
      'Non Visited',
      name: 'tourDetailsNonVisited',
      desc: 'Non Visited',
      args: [],
    );
  }

  /// `Non Visited Clients`
  String get tourDetailsNonVisitedClients {
    return Intl.message(
      'Non Visited Clients',
      name: 'tourDetailsNonVisitedClients',
      desc: 'Non Visited Clients',
      args: [],
    );
  }

  /// `Visited Clients`
  String get tourDetailsVisitedClients {
    return Intl.message(
      'Visited Clients',
      name: 'tourDetailsVisitedClients',
      desc: 'Visited Clients',
      args: [],
    );
  }

  /// `Visit Client`
  String get tourDetailsVisitClient {
    return Intl.message(
      'Visit Client',
      name: 'tourDetailsVisitClient',
      desc: 'Visit Client',
      args: [],
    );
  }

  /// `You have an open tour`
  String get tourErrorExistOpenTour {
    return Intl.message(
      'You have an open tour',
      name: 'tourErrorExistOpenTour',
      desc: 'You have an open tour',
      args: [],
    );
  }

  /// `You must be authenticated to access this resource`
  String get tourErrorResourceRequireAuthentication {
    return Intl.message(
      'You must be authenticated to access this resource',
      name: 'tourErrorResourceRequireAuthentication',
      desc: 'You must be authenticated to access this resource',
      args: [],
    );
  }

  /// `Clients ({count})`
  String tourValidationClientLabelNumber(int count) {
    return Intl.message(
      'Clients ($count)',
      name: 'tourValidationClientLabelNumber',
      desc: 'Clients',
      args: [count],
    );
  }

  /// `Create New Plan`
  String get homeCreateNewPlan {
    return Intl.message(
      'Create New Plan',
      name: 'homeCreateNewPlan',
      desc: 'Create New Plan',
      args: [],
    );
  }

  /// `Create New Visit`
  String get homeCreateNewVisit {
    return Intl.message(
      'Create New Visit',
      name: 'homeCreateNewVisit',
      desc: 'Create New Visit',
      args: [],
    );
  }

  /// `Create New Event`
  String get homeCreateNewEvent {
    return Intl.message(
      'Create New Event',
      name: 'homeCreateNewEvent',
      desc: 'Create New Event',
      args: [],
    );
  }

  /// `Hire New Client`
  String get homeHireNewClient {
    return Intl.message(
      'Hire New Client',
      name: 'homeHireNewClient',
      desc: 'Hire New Client',
      args: [],
    );
  }

  /// `My Clients`
  String get homeMyClients {
    return Intl.message(
      'My Clients',
      name: 'homeMyClients',
      desc: 'My Clients',
      args: [],
    );
  }

  /// `My Tasks Today`
  String get homeMyTasksToday {
    return Intl.message(
      'My Tasks Today',
      name: 'homeMyTasksToday',
      desc: 'My Tasks Today',
      args: [],
    );
  }

  /// `Pending Plan`
  String get homePendingPlan {
    return Intl.message(
      'Pending Plan',
      name: 'homePendingPlan',
      desc: 'Pending Plan',
      args: [],
    );
  }

  /// `Pending Hire`
  String get homePendingHire {
    return Intl.message(
      'Pending Hire',
      name: 'homePendingHire',
      desc: 'Pending Hire',
      args: [],
    );
  }

  /// `Hello`
  String get homeHello {
    return Intl.message(
      'Hello',
      name: 'homeHello',
      desc: 'Hello',
      args: [],
    );
  }

  /// `The Creation Of The Visit Is In Progress`
  String get visitCreationInProgressTitle {
    return Intl.message(
      'The Creation Of The Visit Is In Progress',
      name: 'visitCreationInProgressTitle',
      desc: 'The Creation Of The Visit Is In Progress',
      args: [],
    );
  }

  /// `We are finalizing the details of your visit. Thank you for your patience.`
  String get visitCreationInProgressDescription {
    return Intl.message(
      'We are finalizing the details of your visit. Thank you for your patience.',
      name: 'visitCreationInProgressDescription',
      desc:
          'We are finalizing the details of your visit. Thank you for your patience.',
      args: [],
    );
  }

  /// `Successfully created visit`
  String get visitCreationSuccessTitle {
    return Intl.message(
      'Successfully created visit',
      name: 'visitCreationSuccessTitle',
      desc: 'Successfully created visit',
      args: [],
    );
  }

  /// `Your visit has been successfully created. You can now view and manage your visits.`
  String get visitCreationSuccessDescription {
    return Intl.message(
      'Your visit has been successfully created. You can now view and manage your visits.',
      name: 'visitCreationSuccessDescription',
      desc:
          'Your visit has been successfully created. You can now view and manage your visits.',
      args: [],
    );
  }

  /// `New Visit`
  String get visitCreationTitle {
    return Intl.message(
      'New Visit',
      name: 'visitCreationTitle',
      desc: 'New Visit',
      args: [],
    );
  }

  /// `Create a new visit for a client`
  String get visitCreationDescription {
    return Intl.message(
      'Create a new visit for a client',
      name: 'visitCreationDescription',
      desc: 'Create a new visit for a client',
      args: [],
    );
  }

  /// `Client`
  String get visitCreationClientLabel {
    return Intl.message(
      'Client',
      name: 'visitCreationClientLabel',
      desc: 'Client',
      args: [],
    );
  }

  /// `Select a client`
  String get visitCreationClientPlaceholder {
    return Intl.message(
      'Select a client',
      name: 'visitCreationClientPlaceholder',
      desc: 'Select a client',
      args: [],
    );
  }

  /// `Date`
  String get visitCreationDateLabel {
    return Intl.message(
      'Date',
      name: 'visitCreationDateLabel',
      desc: 'Date',
      args: [],
    );
  }

  /// `Reason`
  String get visitCreationReasonLabel {
    return Intl.message(
      'Reason',
      name: 'visitCreationReasonLabel',
      desc: 'Reason',
      args: [],
    );
  }

  /// `Enter the reason for the visit`
  String get visitCreationReasonPlaceholder {
    return Intl.message(
      'Enter the reason for the visit',
      name: 'visitCreationReasonPlaceholder',
      desc: 'Enter the reason for the visit',
      args: [],
    );
  }

  /// `Rapport`
  String get visitCreationRapportLabel {
    return Intl.message(
      'Rapport',
      name: 'visitCreationRapportLabel',
      desc: 'Rapport',
      args: [],
    );
  }

  /// `Reason is required`
  String get visitCreationReasonError {
    return Intl.message(
      'Reason is required',
      name: 'visitCreationReasonError',
      desc: 'Reason is required',
      args: [],
    );
  }

  /// `Enter the rapport of the visit`
  String get visitCreationRapportPlaceholder {
    return Intl.message(
      'Enter the rapport of the visit',
      name: 'visitCreationRapportPlaceholder',
      desc: 'Enter the rapport of the visit',
      args: [],
    );
  }

  /// `Overview and Validation`
  String get visitValidationTitle {
    return Intl.message(
      'Overview and Validation',
      name: 'visitValidationTitle',
      desc: 'Overview and Validation',
      args: [],
    );
  }

  /// `Client`
  String get visitValidationClient {
    return Intl.message(
      'Client',
      name: 'visitValidationClient',
      desc: 'Client',
      args: [],
    );
  }

  /// `Visited At`
  String get visitValidationVisitedAt {
    return Intl.message(
      'Visited At',
      name: 'visitValidationVisitedAt',
      desc: 'Visited At',
      args: [],
    );
  }

  /// `Reason`
  String get visitValidationReason {
    return Intl.message(
      'Reason',
      name: 'visitValidationReason',
      desc: 'Reason',
      args: [],
    );
  }

  /// `Rapport`
  String get visitValidationRapport {
    return Intl.message(
      'Rapport',
      name: 'visitValidationRapport',
      desc: 'Rapport',
      args: [],
    );
  }

  /// `The tour isn''t open`
  String get visitTourIsntOpen {
    return Intl.message(
      'The tour isn\'\'t open',
      name: 'visitTourIsntOpen',
      desc: 'The tour isn\'t open',
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
