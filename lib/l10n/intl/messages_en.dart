// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(count) => "${count} Client";

  static String m1(percentage) => "${percentage}%";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "authLoginDescription": MessageLookupByLibrary.simpleMessage(
            "And have access to all the features of the application"),
        "authLoginPassword": MessageLookupByLibrary.simpleMessage("Password"),
        "authLoginPasswordPlaceholder":
            MessageLookupByLibrary.simpleMessage("Enter your password"),
        "authLoginPasswordRequired":
            MessageLookupByLibrary.simpleMessage("Password is required"),
        "authLoginSubmit": MessageLookupByLibrary.simpleMessage("Login"),
        "authLoginTitle": MessageLookupByLibrary.simpleMessage("Login"),
        "authLoginUsername": MessageLookupByLibrary.simpleMessage("Username"),
        "authLoginUsernamePlaceholder":
            MessageLookupByLibrary.simpleMessage("Enter your username"),
        "authLoginUsernameRequired":
            MessageLookupByLibrary.simpleMessage("Username is required"),
        "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
        "confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
        "endDate": MessageLookupByLibrary.simpleMessage("End Date"),
        "navHome": MessageLookupByLibrary.simpleMessage("Home"),
        "navMenu": MessageLookupByLibrary.simpleMessage("Menu"),
        "navPlans": MessageLookupByLibrary.simpleMessage("Plans"),
        "navTodos": MessageLookupByLibrary.simpleMessage("Todos"),
        "navVisits": MessageLookupByLibrary.simpleMessage("Visits"),
        "save": MessageLookupByLibrary.simpleMessage("Save"),
        "selectDateRange":
            MessageLookupByLibrary.simpleMessage("Select Date Range"),
        "startDate": MessageLookupByLibrary.simpleMessage("Start Date"),
        "tourAllPlans": MessageLookupByLibrary.simpleMessage("All Plans"),
        "tourClient": m0,
        "tourCompletedPlans":
            MessageLookupByLibrary.simpleMessage("Completed Plans"),
        "tourCompletedStatus":
            MessageLookupByLibrary.simpleMessage("Completed"),
        "tourCurrentTour": MessageLookupByLibrary.simpleMessage("Current Tour"),
        "tourEmptyPlans":
            MessageLookupByLibrary.simpleMessage("No plans found"),
        "tourEmptyPlansDescription": MessageLookupByLibrary.simpleMessage(
            "You don\'\'t have any plans yet"),
        "tourInProgressPlans":
            MessageLookupByLibrary.simpleMessage("In Progress Plans"),
        "tourInProgressStatus":
            MessageLookupByLibrary.simpleMessage("In Progress"),
        "tourPendingPlans":
            MessageLookupByLibrary.simpleMessage("Pending Plans"),
        "tourPendingStatus": MessageLookupByLibrary.simpleMessage("Pending"),
        "tourProgress": m1,
        "tourSearchPerWilaya":
            MessageLookupByLibrary.simpleMessage("Search per wilaya")
      };
}
