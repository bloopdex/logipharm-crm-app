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

  static String m2(count) => "Clients (${count})";

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
        "completed": MessageLookupByLibrary.simpleMessage("Completed"),
        "confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
        "createdAt": MessageLookupByLibrary.simpleMessage("Created At"),
        "endDate": MessageLookupByLibrary.simpleMessage("End Date"),
        "error": MessageLookupByLibrary.simpleMessage("Error"),
        "finish": MessageLookupByLibrary.simpleMessage("Finish"),
        "homeCreateNewEvent":
            MessageLookupByLibrary.simpleMessage("Create New Event"),
        "homeCreateNewPlan":
            MessageLookupByLibrary.simpleMessage("Create New Plan"),
        "homeCreateNewVisit":
            MessageLookupByLibrary.simpleMessage("Create New Visit"),
        "homeHello": MessageLookupByLibrary.simpleMessage("Hello"),
        "homeHireNewClient":
            MessageLookupByLibrary.simpleMessage("Hire New Client"),
        "homeMyClients": MessageLookupByLibrary.simpleMessage("My Clients"),
        "homeMyTasksToday":
            MessageLookupByLibrary.simpleMessage("My Tasks Today"),
        "homePendingHire": MessageLookupByLibrary.simpleMessage("Pending Hire"),
        "homePendingPlan": MessageLookupByLibrary.simpleMessage("Pending Plan"),
        "inProgress": MessageLookupByLibrary.simpleMessage("In Progress"),
        "later": MessageLookupByLibrary.simpleMessage("Later"),
        "navHome": MessageLookupByLibrary.simpleMessage("Home"),
        "navMenu": MessageLookupByLibrary.simpleMessage("Menu"),
        "navPlans": MessageLookupByLibrary.simpleMessage("Plans"),
        "navTodos": MessageLookupByLibrary.simpleMessage("Todos"),
        "navVisits": MessageLookupByLibrary.simpleMessage("Visits"),
        "next": MessageLookupByLibrary.simpleMessage("Next"),
        "pending": MessageLookupByLibrary.simpleMessage("Pending"),
        "save": MessageLookupByLibrary.simpleMessage("Save"),
        "selectDate": MessageLookupByLibrary.simpleMessage("Select Date"),
        "selectDateRange":
            MessageLookupByLibrary.simpleMessage("Select Date Range"),
        "start": MessageLookupByLibrary.simpleMessage("Start"),
        "startDate": MessageLookupByLibrary.simpleMessage("Start Date"),
        "today": MessageLookupByLibrary.simpleMessage("Today"),
        "tourAllPlans": MessageLookupByLibrary.simpleMessage("All Plans"),
        "tourClient": m0,
        "tourCompletedPlans":
            MessageLookupByLibrary.simpleMessage("Completed Plans"),
        "tourCompletedStatus":
            MessageLookupByLibrary.simpleMessage("Completed"),
        "tourCreateNewPlan":
            MessageLookupByLibrary.simpleMessage("Create New Plan"),
        "tourCreationClientEmptyDescription":
            MessageLookupByLibrary.simpleMessage(
                "No clients found in this region"),
        "tourCreationClientEmptyTitle":
            MessageLookupByLibrary.simpleMessage("No clients found"),
        "tourCreationClientVisitsDescription":
            MessageLookupByLibrary.simpleMessage(
                "Select the clients you want to visit during this tour."),
        "tourCreationClientVisitsTitle":
            MessageLookupByLibrary.simpleMessage("Client To Visits"),
        "tourCreationClientsLabel":
            MessageLookupByLibrary.simpleMessage("Clients"),
        "tourCreationErrorDescription": MessageLookupByLibrary.simpleMessage(
            "An error occurred while creating the tour plan. Please try again later."),
        "tourCreationErrorTitle":
            MessageLookupByLibrary.simpleMessage("An error occurred"),
        "tourCreationInProgressDescription": MessageLookupByLibrary.simpleMessage(
            "We are finalizing the details of your tour plan. Thank you for your patience."),
        "tourCreationInProgressTitle": MessageLookupByLibrary.simpleMessage(
            "The Creation Of The Tour Plan Is In Progress"),
        "tourCreationNoAddress":
            MessageLookupByLibrary.simpleMessage("No address"),
        "tourCreationRegionLabel":
            MessageLookupByLibrary.simpleMessage("Region"),
        "tourCreationRegionPlaceholder":
            MessageLookupByLibrary.simpleMessage("Select a region"),
        "tourCreationStartTour": MessageLookupByLibrary.simpleMessage(
            "Do You Want To Start The Tour Now?"),
        "tourCreationStartTourDescription": MessageLookupByLibrary.simpleMessage(
            "You can start the tour now or later from the list of planned tours."),
        "tourCreationSuccessDescription": MessageLookupByLibrary.simpleMessage(
            "Your tour plan has been successfully created. You can now view and manage your planned tours."),
        "tourCreationSuccessTitle": MessageLookupByLibrary.simpleMessage(
            "Successfully created tour plan"),
        "tourCreationTourDetailsDateLabel":
            MessageLookupByLibrary.simpleMessage("Date"),
        "tourCreationTourDetailsDelegateLabel":
            MessageLookupByLibrary.simpleMessage("Delegate"),
        "tourCreationTourDetailsDescription": MessageLookupByLibrary.simpleMessage(
            "Choose the delegate responsible for this tour plan and enter the date scheduled for the tour."),
        "tourCreationTourDetailsTitle":
            MessageLookupByLibrary.simpleMessage("Tour Details"),
        "tourCurrentTour": MessageLookupByLibrary.simpleMessage("Current Tour"),
        "tourDetailsAllClients":
            MessageLookupByLibrary.simpleMessage("All Clients"),
        "tourDetailsClients": MessageLookupByLibrary.simpleMessage("Clients"),
        "tourDetailsNonVisited":
            MessageLookupByLibrary.simpleMessage("Non Visited"),
        "tourDetailsNonVisitedClients":
            MessageLookupByLibrary.simpleMessage("Non Visited Clients"),
        "tourDetailsRegion": MessageLookupByLibrary.simpleMessage("Region"),
        "tourDetailsTitle":
            MessageLookupByLibrary.simpleMessage("Tour Details"),
        "tourDetailsTourBy":
            MessageLookupByLibrary.simpleMessage("Tour Plan By"),
        "tourDetailsVisitClient":
            MessageLookupByLibrary.simpleMessage("Visit Client"),
        "tourDetailsVisited": MessageLookupByLibrary.simpleMessage("Visited"),
        "tourDetailsVisitedClients":
            MessageLookupByLibrary.simpleMessage("Visited Clients"),
        "tourEmptyPlans":
            MessageLookupByLibrary.simpleMessage("No plans found"),
        "tourEmptyPlansDescription": MessageLookupByLibrary.simpleMessage(
            "You don\'\'t have any plans yet"),
        "tourErrorExistOpenTour":
            MessageLookupByLibrary.simpleMessage("You have an open tour"),
        "tourErrorResourceRequireAuthentication":
            MessageLookupByLibrary.simpleMessage(
                "You must be authenticated to access this resource"),
        "tourInProgressPlans":
            MessageLookupByLibrary.simpleMessage("In Progress Plans"),
        "tourInProgressStatus":
            MessageLookupByLibrary.simpleMessage("In Progress"),
        "tourPendingPlans":
            MessageLookupByLibrary.simpleMessage("Pending Plans"),
        "tourPendingStatus": MessageLookupByLibrary.simpleMessage("Pending"),
        "tourProgress": m1,
        "tourSearchPerWilaya":
            MessageLookupByLibrary.simpleMessage("Search per wilaya"),
        "tourValidationClientLabelNumber": m2,
        "tourValidationPlanBy":
            MessageLookupByLibrary.simpleMessage("Tour Plan, By:"),
        "tourValidationRegion": MessageLookupByLibrary.simpleMessage("Region"),
        "tourValidationTitle":
            MessageLookupByLibrary.simpleMessage("Overview and Validation"),
        "validate": MessageLookupByLibrary.simpleMessage("Validate"),
        "viewDetails": MessageLookupByLibrary.simpleMessage("View Details"),
        "visitCreationClientLabel":
            MessageLookupByLibrary.simpleMessage("Client"),
        "visitCreationClientPlaceholder":
            MessageLookupByLibrary.simpleMessage("Select a client"),
        "visitCreationDateLabel": MessageLookupByLibrary.simpleMessage("Date"),
        "visitCreationDescription": MessageLookupByLibrary.simpleMessage(
            "Create a new visit for a client"),
        "visitCreationInProgressDescription": MessageLookupByLibrary.simpleMessage(
            "We are finalizing the details of your visit. Thank you for your patience."),
        "visitCreationInProgressTitle": MessageLookupByLibrary.simpleMessage(
            "The Creation Of The Visit Is In Progress"),
        "visitCreationRapportLabel":
            MessageLookupByLibrary.simpleMessage("Rapport"),
        "visitCreationRapportPlaceholder": MessageLookupByLibrary.simpleMessage(
            "Enter the rapport of the visit"),
        "visitCreationReasonError":
            MessageLookupByLibrary.simpleMessage("Reason is required"),
        "visitCreationReasonLabel":
            MessageLookupByLibrary.simpleMessage("Reason"),
        "visitCreationReasonPlaceholder": MessageLookupByLibrary.simpleMessage(
            "Enter the reason for the visit"),
        "visitCreationSuccessDescription": MessageLookupByLibrary.simpleMessage(
            "Your visit has been successfully created. You can now view and manage your visits."),
        "visitCreationSuccessTitle":
            MessageLookupByLibrary.simpleMessage("Successfully created visit"),
        "visitCreationTitle": MessageLookupByLibrary.simpleMessage("New Visit"),
        "visitTourIsntOpen":
            MessageLookupByLibrary.simpleMessage("The tour isn\'\'t open"),
        "visitValidationClient": MessageLookupByLibrary.simpleMessage("Client"),
        "visitValidationRapport":
            MessageLookupByLibrary.simpleMessage("Rapport"),
        "visitValidationReason": MessageLookupByLibrary.simpleMessage("Reason"),
        "visitValidationTitle":
            MessageLookupByLibrary.simpleMessage("Overview and Validation"),
        "visitValidationVisitedAt":
            MessageLookupByLibrary.simpleMessage("Visited At")
      };
}
