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

  static String m0(percentage) => "${percentage}%";

  static String m1(ref) => "Offer ${ref}";

  static String m2(count) => "${count} Client";

  static String m3(percentage) => "${percentage}%";

  static String m4(count) => "Clients (${count})";

  static String m5(radius) =>
      "You are outside the authorized radius (${radius} m) for this client";

  static String m6(min) => "Rapport must be at least ${min} characters";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "active": MessageLookupByLibrary.simpleMessage("Active"),
    "add": MessageLookupByLibrary.simpleMessage("Add"),
    "addClaim": MessageLookupByLibrary.simpleMessage("Add Claim"),
    "addEtablissement": MessageLookupByLibrary.simpleMessage(
      "Add Etablissement",
    ),
    "addGrossiste": MessageLookupByLibrary.simpleMessage("Add Grossiste"),
    "addMotif": MessageLookupByLibrary.simpleMessage("Add Motif"),
    "addObservation": MessageLookupByLibrary.simpleMessage("Add Observation"),
    "addProducts": MessageLookupByLibrary.simpleMessage("Add Products"),
    "addToCart": MessageLookupByLibrary.simpleMessage("Add to Cart"),
    "addVeilleConcurrentielle": MessageLookupByLibrary.simpleMessage(
      "Add Competitive Watch",
    ),
    "addVisit": MessageLookupByLibrary.simpleMessage("Add Visit"),
    "addVisitToEvent": MessageLookupByLibrary.simpleMessage(
      "Add Visit to Event",
    ),
    "address": MessageLookupByLibrary.simpleMessage("Address"),
    "addressPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Enter the address",
    ),
    "addressRequired": MessageLookupByLibrary.simpleMessage(
      "Address is required",
    ),
    "allClients": MessageLookupByLibrary.simpleMessage("All Clients"),
    "allCommunes": MessageLookupByLibrary.simpleMessage("All Communes"),
    "allRegions": MessageLookupByLibrary.simpleMessage("All Regions"),
    "analytics": MessageLookupByLibrary.simpleMessage("Analytics"),
    "authLoginDescription": MessageLookupByLibrary.simpleMessage(
      "And have access to all the features of the application",
    ),
    "authLoginError": MessageLookupByLibrary.simpleMessage(
      "Invalid username or password",
    ),
    "authLoginPassword": MessageLookupByLibrary.simpleMessage("Password"),
    "authLoginPasswordPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Enter your password",
    ),
    "authLoginPasswordRequired": MessageLookupByLibrary.simpleMessage(
      "Password is required",
    ),
    "authLoginSubmit": MessageLookupByLibrary.simpleMessage("Login"),
    "authLoginTitle": MessageLookupByLibrary.simpleMessage("Login"),
    "authLoginUsername": MessageLookupByLibrary.simpleMessage("Username"),
    "authLoginUsernamePlaceholder": MessageLookupByLibrary.simpleMessage(
      "Enter your username",
    ),
    "authLoginUsernameRequired": MessageLookupByLibrary.simpleMessage(
      "Username is required",
    ),
    "avgRealization": MessageLookupByLibrary.simpleMessage("Avg"),
    "back": MessageLookupByLibrary.simpleMessage("Back"),
    "baseUrl": MessageLookupByLibrary.simpleMessage("Base URL"),
    "blockageCommercial": MessageLookupByLibrary.simpleMessage(
      "Commercial Blockage",
    ),
    "blockageFinancial": MessageLookupByLibrary.simpleMessage(
      "Financial Blockage",
    ),
    "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "cantCreatePlanWhileOpened": MessageLookupByLibrary.simpleMessage(
      "Can\'t create plan while opened plan",
    ),
    "cantCreateVisit": MessageLookupByLibrary.simpleMessage(
      "Can\'t create visit",
    ),
    "cart": MessageLookupByLibrary.simpleMessage("Cart"),
    "cartCancelDelete": MessageLookupByLibrary.simpleMessage("Cancel"),
    "cartConfirmDelete": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to delete this item from the cart?",
    ),
    "cartRemoveItem": MessageLookupByLibrary.simpleMessage("Remove Item"),
    "category": MessageLookupByLibrary.simpleMessage("Category"),
    "categoryUpdated": MessageLookupByLibrary.simpleMessage("Category updated"),
    "ceiling": MessageLookupByLibrary.simpleMessage("Ceiling"),
    "changeAddress": MessageLookupByLibrary.simpleMessage("Change Address"),
    "changeCategory": MessageLookupByLibrary.simpleMessage("Change Category"),
    "changePassword": MessageLookupByLibrary.simpleMessage("Change Password"),
    "city": MessageLookupByLibrary.simpleMessage("Ville"),
    "claims": MessageLookupByLibrary.simpleMessage("Claims"),
    "client": MessageLookupByLibrary.simpleMessage("Client"),
    "clientAddress": MessageLookupByLibrary.simpleMessage("Client Address"),
    "clientDetails": MessageLookupByLibrary.simpleMessage("Client Details"),
    "clientList": MessageLookupByLibrary.simpleMessage("Client List"),
    "clientName": MessageLookupByLibrary.simpleMessage("Client Name"),
    "clientType": MessageLookupByLibrary.simpleMessage("Client Type"),
    "clients": MessageLookupByLibrary.simpleMessage("Clients"),
    "closeTourPlan": MessageLookupByLibrary.simpleMessage("Close Tour Plan"),
    "closeTourPlanDesc": MessageLookupByLibrary.simpleMessage(
      "Close the current tour plan.",
    ),
    "cnrc": MessageLookupByLibrary.simpleMessage("CNRC"),
    "colis": MessageLookupByLibrary.simpleMessage("Colis"),
    "color": MessageLookupByLibrary.simpleMessage("Color"),
    "commune": MessageLookupByLibrary.simpleMessage("Commune"),
    "completed": MessageLookupByLibrary.simpleMessage("Completed"),
    "confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
    "confirmPassword": MessageLookupByLibrary.simpleMessage("Confirm Password"),
    "confirmPasswordPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Confirm your new password",
    ),
    "confirmPasswordRequired": MessageLookupByLibrary.simpleMessage(
      "Confirm password is required",
    ),
    "consultation": MessageLookupByLibrary.simpleMessage("Consultation"),
    "contactsAdd": MessageLookupByLibrary.simpleMessage("Add contact"),
    "contactsCategorie": MessageLookupByLibrary.simpleMessage("Category"),
    "contactsContactInfo": MessageLookupByLibrary.simpleMessage(
      "Contact information",
    ),
    "contactsEdit": MessageLookupByLibrary.simpleMessage("Edit contact"),
    "contactsEmpty": MessageLookupByLibrary.simpleMessage("No contacts"),
    "contactsGeneralInfo": MessageLookupByLibrary.simpleMessage(
      "General information",
    ),
    "contactsMedecin": MessageLookupByLibrary.simpleMessage("Doctor"),
    "contactsMedecinDetails": MessageLookupByLibrary.simpleMessage(
      "Doctor details",
    ),
    "contactsPatient": MessageLookupByLibrary.simpleMessage("Patient"),
    "contactsPharmacien": MessageLookupByLibrary.simpleMessage("Pharmacist"),
    "contactsPharmacienDetails": MessageLookupByLibrary.simpleMessage(
      "Pharmacist details",
    ),
    "contactsTitle": MessageLookupByLibrary.simpleMessage("Contacts"),
    "createNewHirement": MessageLookupByLibrary.simpleMessage(
      "Create New Hirement",
    ),
    "createNewVisit": MessageLookupByLibrary.simpleMessage("Create New Visit"),
    "createdAt": MessageLookupByLibrary.simpleMessage("Created At"),
    "createdBy": MessageLookupByLibrary.simpleMessage("Created By"),
    "dashboard": MessageLookupByLibrary.simpleMessage("Dashboard"),
    "delegateRole": MessageLookupByLibrary.simpleMessage("Delegate"),
    "email": MessageLookupByLibrary.simpleMessage("Email"),
    "emailInvalid": MessageLookupByLibrary.simpleMessage("Enter a valid email"),
    "emailPlaceholder": MessageLookupByLibrary.simpleMessage("Enter the email"),
    "emailRequired": MessageLookupByLibrary.simpleMessage("Email is required"),
    "emptyCart": MessageLookupByLibrary.simpleMessage("Empty Cart"),
    "emptyCartDescription": MessageLookupByLibrary.simpleMessage(
      "Your cart is empty",
    ),
    "emptyOffers": MessageLookupByLibrary.simpleMessage("No offers found"),
    "emptyPaliers": MessageLookupByLibrary.simpleMessage("No paliers found"),
    "endDate": MessageLookupByLibrary.simpleMessage("End Date"),
    "error": MessageLookupByLibrary.simpleMessage("Error"),
    "etablissement": MessageLookupByLibrary.simpleMessage("Etablissement"),
    "eventAll": MessageLookupByLibrary.simpleMessage("All Events"),
    "eventCompleted": MessageLookupByLibrary.simpleMessage("Completed"),
    "eventDetailsCreatedBy": MessageLookupByLibrary.simpleMessage("Created By"),
    "eventDetailsTitle": MessageLookupByLibrary.simpleMessage("Event Details"),
    "eventInProgress": MessageLookupByLibrary.simpleMessage("In Progress"),
    "eventPending": MessageLookupByLibrary.simpleMessage("Pending"),
    "eventProgress": m0,
    "eventTitle": MessageLookupByLibrary.simpleMessage("Event Title"),
    "eventType": MessageLookupByLibrary.simpleMessage("Event Type"),
    "events": MessageLookupByLibrary.simpleMessage("Events"),
    "eventsTitle": MessageLookupByLibrary.simpleMessage("Events"),
    "expirationDate": MessageLookupByLibrary.simpleMessage("DDP"),
    "fieldIsRequired": MessageLookupByLibrary.simpleMessage(
      "Field is required",
    ),
    "fileCNRC": MessageLookupByLibrary.simpleMessage("Prospect"),
    "finish": MessageLookupByLibrary.simpleMessage("Finish"),
    "firstName": MessageLookupByLibrary.simpleMessage("First Name"),
    "firstNamePlaceholder": MessageLookupByLibrary.simpleMessage(
      "Enter the first name",
    ),
    "firstNameRequired": MessageLookupByLibrary.simpleMessage(
      "First name is required",
    ),
    "generic": MessageLookupByLibrary.simpleMessage("Generic"),
    "goalOfDay": MessageLookupByLibrary.simpleMessage("Goal of the day"),
    "goalOfMonthRecrutement": MessageLookupByLibrary.simpleMessage(
      "Goal of the month recruitment",
    ),
    "goalOfMonthSales": MessageLookupByLibrary.simpleMessage(
      "Goal of the month sales",
    ),
    "grossiste": MessageLookupByLibrary.simpleMessage("Grossiste"),
    "hire": MessageLookupByLibrary.simpleMessage("Hire"),
    "hireDetails": MessageLookupByLibrary.simpleMessage("Hire Details"),
    "hired": MessageLookupByLibrary.simpleMessage("Hired"),
    "hirement": MessageLookupByLibrary.simpleMessage("Hirement"),
    "hiring": MessageLookupByLibrary.simpleMessage("Hiring"),
    "homeCreateNewEvent": MessageLookupByLibrary.simpleMessage(
      "Create New Event",
    ),
    "homeCreateNewPlan": MessageLookupByLibrary.simpleMessage(
      "Create New Plan",
    ),
    "homeCreateNewVisit": MessageLookupByLibrary.simpleMessage(
      "Create New Visit",
    ),
    "homeHello": MessageLookupByLibrary.simpleMessage("Hello"),
    "homeHireNewClient": MessageLookupByLibrary.simpleMessage(
      "Hire New Client",
    ),
    "homeMyClients": MessageLookupByLibrary.simpleMessage("My Clients"),
    "homeMyTasksToday": MessageLookupByLibrary.simpleMessage("My Tasks Today"),
    "homePendingHire": MessageLookupByLibrary.simpleMessage("Pending Hire"),
    "homePendingPlan": MessageLookupByLibrary.simpleMessage("Pending Plan"),
    "homeQuickAddContact": MessageLookupByLibrary.simpleMessage("Add contact"),
    "inProgress": MessageLookupByLibrary.simpleMessage("In Progress"),
    "labelAmount": MessageLookupByLibrary.simpleMessage("Amount"),
    "labelDates": MessageLookupByLibrary.simpleMessage("Dates"),
    "labelLaboratory": MessageLookupByLibrary.simpleMessage("Laboratory"),
    "labelMax": MessageLookupByLibrary.simpleMessage("Max"),
    "labelMin": MessageLookupByLibrary.simpleMessage("Min"),
    "labelReference": MessageLookupByLibrary.simpleMessage("Reference"),
    "labelTierType": MessageLookupByLibrary.simpleMessage("Tier Type"),
    "labelType": MessageLookupByLibrary.simpleMessage("Type"),
    "labelValue": MessageLookupByLibrary.simpleMessage("Value"),
    "laboratoire": MessageLookupByLibrary.simpleMessage("Laboratory"),
    "lastName": MessageLookupByLibrary.simpleMessage("Last Name"),
    "lastNamePlaceholder": MessageLookupByLibrary.simpleMessage(
      "Enter the last name",
    ),
    "lastNameRequired": MessageLookupByLibrary.simpleMessage(
      "Last name is required",
    ),
    "later": MessageLookupByLibrary.simpleMessage("Later"),
    "locationPermissionRequired": MessageLookupByLibrary.simpleMessage(
      "Location permission is required",
    ),
    "locationUpdatedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Location updated successfully",
    ),
    "logout": MessageLookupByLibrary.simpleMessage("Logout"),
    "lot": MessageLookupByLibrary.simpleMessage("Lot"),
    "manageProfile": MessageLookupByLibrary.simpleMessage("Manage Profile"),
    "modePaie": MessageLookupByLibrary.simpleMessage("Mode de paiement"),
    "moreDetails": MessageLookupByLibrary.simpleMessage("More Details"),
    "motif": MessageLookupByLibrary.simpleMessage("Motif"),
    "myOrders": MessageLookupByLibrary.simpleMessage("My Orders"),
    "name": MessageLookupByLibrary.simpleMessage("Name"),
    "navHome": MessageLookupByLibrary.simpleMessage("Home"),
    "navMenu": MessageLookupByLibrary.simpleMessage("Menu"),
    "navPlans": MessageLookupByLibrary.simpleMessage("Plans"),
    "navTodos": MessageLookupByLibrary.simpleMessage("Todos"),
    "navVisits": MessageLookupByLibrary.simpleMessage("Visits"),
    "newPassword": MessageLookupByLibrary.simpleMessage("New Password"),
    "newPasswordPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Enter your new password",
    ),
    "newPasswordRequired": MessageLookupByLibrary.simpleMessage(
      "New password is required",
    ),
    "next": MessageLookupByLibrary.simpleMessage("Next"),
    "noAddress": MessageLookupByLibrary.simpleMessage("No address"),
    "noAnalytics": MessageLookupByLibrary.simpleMessage("No analytics found"),
    "noAnalyticsDesc": MessageLookupByLibrary.simpleMessage(
      "No analytics found for this client",
    ),
    "noCategory": MessageLookupByLibrary.simpleMessage("No category"),
    "noCategoryOptions": MessageLookupByLibrary.simpleMessage("No categories"),
    "noClaims": MessageLookupByLibrary.simpleMessage("No claims"),
    "noClaimsDesc": MessageLookupByLibrary.simpleMessage(
      "No claims found for this client",
    ),
    "noClientsFound": MessageLookupByLibrary.simpleMessage("No clients found"),
    "noCommune": MessageLookupByLibrary.simpleMessage("No commune"),
    "noCreator": MessageLookupByLibrary.simpleMessage("No Creator"),
    "noEmail": MessageLookupByLibrary.simpleMessage("No email"),
    "noEtablissement": MessageLookupByLibrary.simpleMessage("No etablissement"),
    "noEtablissementDesc": MessageLookupByLibrary.simpleMessage(
      "No etablissement found for this client",
    ),
    "noEvents": MessageLookupByLibrary.simpleMessage("No events found"),
    "noEventsDesc": MessageLookupByLibrary.simpleMessage(
      "No events found for today",
    ),
    "noEventsDescription": MessageLookupByLibrary.simpleMessage(
      "No events found",
    ),
    "noFirstName": MessageLookupByLibrary.simpleMessage("No first name"),
    "noGrossiste": MessageLookupByLibrary.simpleMessage("No grossiste"),
    "noGrossisteDesc": MessageLookupByLibrary.simpleMessage(
      "No grossiste found for this client",
    ),
    "noHirement": MessageLookupByLibrary.simpleMessage("No hirement found"),
    "noLastName": MessageLookupByLibrary.simpleMessage("No last name"),
    "noModePaie": MessageLookupByLibrary.simpleMessage("No mode de paiement"),
    "noMotif": MessageLookupByLibrary.simpleMessage("No motif"),
    "noMotifDesc": MessageLookupByLibrary.simpleMessage(
      "No motif found for this observation",
    ),
    "noName": MessageLookupByLibrary.simpleMessage("No name"),
    "noNote": MessageLookupByLibrary.simpleMessage("No Note"),
    "noObservations": MessageLookupByLibrary.simpleMessage("No observations"),
    "noObservationsDesc": MessageLookupByLibrary.simpleMessage(
      "No observations found for this client",
    ),
    "noPhone": MessageLookupByLibrary.simpleMessage("No phone"),
    "noRegion": MessageLookupByLibrary.simpleMessage("No region"),
    "noSolvability": MessageLookupByLibrary.simpleMessage("No solvability"),
    "noTitle": MessageLookupByLibrary.simpleMessage("No Title"),
    "noVeilleConcurrentielle": MessageLookupByLibrary.simpleMessage(
      "No competitive watch",
    ),
    "noVeilleConcurrentielleDesc": MessageLookupByLibrary.simpleMessage(
      "No competitive watch entries found for this client",
    ),
    "note": MessageLookupByLibrary.simpleMessage("Note"),
    "notePlaceholder": MessageLookupByLibrary.simpleMessage("Enter the note"),
    "notifications": MessageLookupByLibrary.simpleMessage("Notifications"),
    "obj": MessageLookupByLibrary.simpleMessage("Obj"),
    "observations": MessageLookupByLibrary.simpleMessage("Observations"),
    "offerDetailsTitle": m1,
    "offersTitle": MessageLookupByLibrary.simpleMessage("Offers"),
    "oldPassword": MessageLookupByLibrary.simpleMessage("Old Password"),
    "oldPasswordPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Enter your old password",
    ),
    "oldPasswordRequired": MessageLookupByLibrary.simpleMessage(
      "Old password is required",
    ),
    "orders": MessageLookupByLibrary.simpleMessage("Orders"),
    "paliersTitle": MessageLookupByLibrary.simpleMessage("Paliers"),
    "passwordChanged": MessageLookupByLibrary.simpleMessage(
      "Password changed successfully",
    ),
    "passwordChangedFailed": MessageLookupByLibrary.simpleMessage(
      "Failed to change password",
    ),
    "passwordLengthError": MessageLookupByLibrary.simpleMessage(
      "Password must be at least 6 characters",
    ),
    "passwordNotMatch": MessageLookupByLibrary.simpleMessage(
      "Passwords do not match",
    ),
    "pending": MessageLookupByLibrary.simpleMessage("Pending"),
    "pendingEvent": MessageLookupByLibrary.simpleMessage("Pending Event"),
    "phone": MessageLookupByLibrary.simpleMessage("Phone"),
    "phonePlaceholder": MessageLookupByLibrary.simpleMessage("Enter the phone"),
    "phoneRequired": MessageLookupByLibrary.simpleMessage("Phone is required"),
    "ppa": MessageLookupByLibrary.simpleMessage("PPA"),
    "price": MessageLookupByLibrary.simpleMessage("Price"),
    "products": MessageLookupByLibrary.simpleMessage("Products"),
    "prospect": MessageLookupByLibrary.simpleMessage("Prospect"),
    "quantity": MessageLookupByLibrary.simpleMessage("Quantity"),
    "recrutementThisMonth": MessageLookupByLibrary.simpleMessage(
      "Recrutement this month",
    ),
    "refused": MessageLookupByLibrary.simpleMessage("Refused"),
    "region": MessageLookupByLibrary.simpleMessage("Region"),
    "regionPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Select a region",
    ),
    "regionRequired": MessageLookupByLibrary.simpleMessage(
      "Region is required",
    ),
    "rejected": MessageLookupByLibrary.simpleMessage("Rejected"),
    "removeItem": MessageLookupByLibrary.simpleMessage("Remove Item"),
    "retry": MessageLookupByLibrary.simpleMessage("Retry"),
    "salesThisMonth": MessageLookupByLibrary.simpleMessage("Sales this month"),
    "save": MessageLookupByLibrary.simpleMessage("Save"),
    "searchClient": MessageLookupByLibrary.simpleMessage("Search Client"),
    "searchEvents": MessageLookupByLibrary.simpleMessage("Search Events"),
    "searchProducts": MessageLookupByLibrary.simpleMessage("Search Products"),
    "selectCategory": MessageLookupByLibrary.simpleMessage("Select Category"),
    "selectClient": MessageLookupByLibrary.simpleMessage("Select Client"),
    "selectDate": MessageLookupByLibrary.simpleMessage("Select Date"),
    "selectDateRange": MessageLookupByLibrary.simpleMessage(
      "Select Date Range",
    ),
    "selectDateTime": MessageLookupByLibrary.simpleMessage(
      "Select Date and Time",
    ),
    "selectReason": MessageLookupByLibrary.simpleMessage("Select Reason"),
    "selectTime": MessageLookupByLibrary.simpleMessage("Select Time"),
    "sold": MessageLookupByLibrary.simpleMessage("Sold"),
    "solvability": MessageLookupByLibrary.simpleMessage("Solvability"),
    "start": MessageLookupByLibrary.simpleMessage("Start"),
    "startDate": MessageLookupByLibrary.simpleMessage("Start Date"),
    "status": MessageLookupByLibrary.simpleMessage("Status"),
    "supervisorRole": MessageLookupByLibrary.simpleMessage("Supervisor"),
    "system": MessageLookupByLibrary.simpleMessage("System"),
    "today": MessageLookupByLibrary.simpleMessage("Today"),
    "todoCreateNewEvent": MessageLookupByLibrary.simpleMessage(
      "Create New Event",
    ),
    "todoCreateNewTask": MessageLookupByLibrary.simpleMessage(
      "Create New Task",
    ),
    "todoDetails": MessageLookupByLibrary.simpleMessage("Details"),
    "todoDetailsError": MessageLookupByLibrary.simpleMessage(
      "Details are required",
    ),
    "todoDetailsPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Enter the details",
    ),
    "todoEvent": MessageLookupByLibrary.simpleMessage("Event"),
    "todoTask": MessageLookupByLibrary.simpleMessage("Task"),
    "todoTitle": MessageLookupByLibrary.simpleMessage("Title"),
    "todoTitleError": MessageLookupByLibrary.simpleMessage("Title is required"),
    "todoTitlePlaceholder": MessageLookupByLibrary.simpleMessage(
      "Enter the title",
    ),
    "total": MessageLookupByLibrary.simpleMessage("Total"),
    "totalHt": MessageLookupByLibrary.simpleMessage("Total HT"),
    "totalPayment": MessageLookupByLibrary.simpleMessage("Total Payment"),
    "totalRest": MessageLookupByLibrary.simpleMessage("Total Rest For Payment"),
    "totalTtc": MessageLookupByLibrary.simpleMessage("Total TTC"),
    "tourAllPlans": MessageLookupByLibrary.simpleMessage("All Plans"),
    "tourClient": m2,
    "tourCompletedPlans": MessageLookupByLibrary.simpleMessage(
      "Completed Plans",
    ),
    "tourCompletedStatus": MessageLookupByLibrary.simpleMessage("Completed"),
    "tourCreateNewPlan": MessageLookupByLibrary.simpleMessage(
      "Create New Plan",
    ),
    "tourCreationClientEmptyDescription": MessageLookupByLibrary.simpleMessage(
      "No clients found in this region",
    ),
    "tourCreationClientEmptyTitle": MessageLookupByLibrary.simpleMessage(
      "No clients found",
    ),
    "tourCreationClientVisitsDescription": MessageLookupByLibrary.simpleMessage(
      "Select the clients you want to visit during this tour.",
    ),
    "tourCreationClientVisitsTitle": MessageLookupByLibrary.simpleMessage(
      "Client To Visits",
    ),
    "tourCreationClientsLabel": MessageLookupByLibrary.simpleMessage("Clients"),
    "tourCreationCommuneLabel": MessageLookupByLibrary.simpleMessage("Commune"),
    "tourCreationErrorDescription": MessageLookupByLibrary.simpleMessage(
      "An error occurred while creating the tour plan. Please try again later.",
    ),
    "tourCreationErrorTitle": MessageLookupByLibrary.simpleMessage(
      "An error occurred",
    ),
    "tourCreationInProgressDescription": MessageLookupByLibrary.simpleMessage(
      "We are finalizing the details of your tour plan. Thank you for your patience.",
    ),
    "tourCreationInProgressTitle": MessageLookupByLibrary.simpleMessage(
      "The Creation Of The Tour Plan Is In Progress",
    ),
    "tourCreationName": MessageLookupByLibrary.simpleMessage("Name"),
    "tourCreationNoAddress": MessageLookupByLibrary.simpleMessage("No address"),
    "tourCreationRegionLabel": MessageLookupByLibrary.simpleMessage("Region"),
    "tourCreationRegionPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Select a region",
    ),
    "tourCreationStartTour": MessageLookupByLibrary.simpleMessage(
      "Do You Want To Start The Tour Now?",
    ),
    "tourCreationStartTourDescription": MessageLookupByLibrary.simpleMessage(
      "You can start the tour now or later from the list of planned tours.",
    ),
    "tourCreationSuccessDescription": MessageLookupByLibrary.simpleMessage(
      "Your tour plan has been successfully created. You can now view and manage your planned tours.",
    ),
    "tourCreationSuccessTitle": MessageLookupByLibrary.simpleMessage(
      "Successfully created tour plan",
    ),
    "tourCreationTourDetailsDateLabel": MessageLookupByLibrary.simpleMessage(
      "Date",
    ),
    "tourCreationTourDetailsDelegateLabel":
        MessageLookupByLibrary.simpleMessage("Delegate"),
    "tourCreationTourDetailsDescription": MessageLookupByLibrary.simpleMessage(
      "Choose the delegate responsible for this tour plan and enter the date scheduled for the tour.",
    ),
    "tourCreationTourDetailsTitle": MessageLookupByLibrary.simpleMessage(
      "Tour Details",
    ),
    "tourCurrentTour": MessageLookupByLibrary.simpleMessage("Current Tour"),
    "tourDetailsAllClients": MessageLookupByLibrary.simpleMessage(
      "All Clients",
    ),
    "tourDetailsClients": MessageLookupByLibrary.simpleMessage("Clients"),
    "tourDetailsNonVisited": MessageLookupByLibrary.simpleMessage(
      "Non Visited",
    ),
    "tourDetailsNonVisitedClients": MessageLookupByLibrary.simpleMessage(
      "Non Visited Clients",
    ),
    "tourDetailsRegion": MessageLookupByLibrary.simpleMessage("Region"),
    "tourDetailsTitle": MessageLookupByLibrary.simpleMessage("Tour Details"),
    "tourDetailsTourBy": MessageLookupByLibrary.simpleMessage("Tour Plan By"),
    "tourDetailsVisitClient": MessageLookupByLibrary.simpleMessage(
      "Visit Client",
    ),
    "tourDetailsVisited": MessageLookupByLibrary.simpleMessage("Visited"),
    "tourDetailsVisitedClients": MessageLookupByLibrary.simpleMessage(
      "Visited Clients",
    ),
    "tourEmptyPlans": MessageLookupByLibrary.simpleMessage("No plans found"),
    "tourEmptyPlansDescription": MessageLookupByLibrary.simpleMessage(
      "You don\'t have any plans yet",
    ),
    "tourErrorExistClosedTour": MessageLookupByLibrary.simpleMessage(
      "The tour is already closed",
    ),
    "tourErrorExistOpenTour": MessageLookupByLibrary.simpleMessage(
      "You have an open tour",
    ),
    "tourErrorResourceRequireAuthentication":
        MessageLookupByLibrary.simpleMessage(
          "You must be authenticated to access this resource",
        ),
    "tourInProgressPlans": MessageLookupByLibrary.simpleMessage(
      "In Progress Plans",
    ),
    "tourInProgressStatus": MessageLookupByLibrary.simpleMessage("In Progress"),
    "tourPendingPlans": MessageLookupByLibrary.simpleMessage("Pending Plans"),
    "tourPendingStatus": MessageLookupByLibrary.simpleMessage("Pending"),
    "tourProgress": m3,
    "tourSearchPerCommune": MessageLookupByLibrary.simpleMessage(
      "Search per commune",
    ),
    "tourSearchPerWilaya": MessageLookupByLibrary.simpleMessage(
      "Search per wilaya",
    ),
    "tourValidationClientLabelNumber": m4,
    "tourValidationPlanBy": MessageLookupByLibrary.simpleMessage(
      "Tour Plan, By:",
    ),
    "tourValidationRegion": MessageLookupByLibrary.simpleMessage("Region"),
    "tourValidationTitle": MessageLookupByLibrary.simpleMessage(
      "Overview and Validation",
    ),
    "turnover": MessageLookupByLibrary.simpleMessage("Turnover"),
    "type": MessageLookupByLibrary.simpleMessage("Type"),
    "unitPrice": MessageLookupByLibrary.simpleMessage("UP"),
    "update": MessageLookupByLibrary.simpleMessage("Update"),
    "updateVisit": MessageLookupByLibrary.simpleMessage("Update Visit"),
    "uploadFile": MessageLookupByLibrary.simpleMessage("Upload File"),
    "validate": MessageLookupByLibrary.simpleMessage("Validate"),
    "validated": MessageLookupByLibrary.simpleMessage("Validated"),
    "veilleConcurrentielle": MessageLookupByLibrary.simpleMessage(
      "Competitive Watch",
    ),
    "viewDetails": MessageLookupByLibrary.simpleMessage("View Details"),
    "visitAddedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Visit added successfully",
    ),
    "visitAlreadyEntered": MessageLookupByLibrary.simpleMessage(
      "The visit is already entered",
    ),
    "visitCreationClientLabel": MessageLookupByLibrary.simpleMessage("Client"),
    "visitCreationClientPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Select a client",
    ),
    "visitCreationDateLabel": MessageLookupByLibrary.simpleMessage("Date"),
    "visitCreationDescription": MessageLookupByLibrary.simpleMessage(
      "Create a new visit for a client",
    ),
    "visitCreationInProgressDescription": MessageLookupByLibrary.simpleMessage(
      "We are finalizing the details of your visit. Thank you for your patience.",
    ),
    "visitCreationInProgressTitle": MessageLookupByLibrary.simpleMessage(
      "The Creation Of The Visit Is In Progress",
    ),
    "visitCreationOutsideAuthorizedRadius": m5,
    "visitCreationRapportLabel": MessageLookupByLibrary.simpleMessage(
      "Rapport",
    ),
    "visitCreationRapportMinCharError": m6,
    "visitCreationRapportPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Enter the rapport of the visit",
    ),
    "visitCreationReasonError": MessageLookupByLibrary.simpleMessage(
      "Reason is required",
    ),
    "visitCreationReasonLabel": MessageLookupByLibrary.simpleMessage("Reason"),
    "visitCreationReasonPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Enter the reason for the visit",
    ),
    "visitCreationSuccessDescription": MessageLookupByLibrary.simpleMessage(
      "Your visit has been successfully created. You can now view and manage your visits.",
    ),
    "visitCreationSuccessTitle": MessageLookupByLibrary.simpleMessage(
      "Successfully created visit",
    ),
    "visitCreationTitle": MessageLookupByLibrary.simpleMessage("New Visit"),
    "visitDate": MessageLookupByLibrary.simpleMessage("Visit Date"),
    "visitDatePlaceholder": MessageLookupByLibrary.simpleMessage(
      "Select visit date",
    ),
    "visitDateRequired": MessageLookupByLibrary.simpleMessage(
      "Visit date is required",
    ),
    "visitDetailsTitle": MessageLookupByLibrary.simpleMessage("Visit Details"),
    "visitErrorDate": MessageLookupByLibrary.simpleMessage(
      "The date has to be after the date of the tour plan",
    ),
    "visitPrivilegeMissing": MessageLookupByLibrary.simpleMessage(
      "You don\'t have the privilege to create a visit",
    ),
    "visitTourIsntOpen": MessageLookupByLibrary.simpleMessage(
      "The tour isn\'t open",
    ),
    "visitValidationClient": MessageLookupByLibrary.simpleMessage("Client"),
    "visitValidationRapport": MessageLookupByLibrary.simpleMessage("Rapport"),
    "visitValidationReason": MessageLookupByLibrary.simpleMessage("Reason"),
    "visitValidationTitle": MessageLookupByLibrary.simpleMessage(
      "Overview and Validation",
    ),
    "visitValidationVisitedAt": MessageLookupByLibrary.simpleMessage(
      "Visited At",
    ),
    "visitsEmpty": MessageLookupByLibrary.simpleMessage("No visits found"),
    "visitsEmptyDescription": MessageLookupByLibrary.simpleMessage(
      "You don\'t have any visits yet",
    ),
    "visitsToday": MessageLookupByLibrary.simpleMessage("Visits today"),
    "waitingForDecision": MessageLookupByLibrary.simpleMessage(
      "Waiting for decision",
    ),
    "youDontHaveAnyHirement": MessageLookupByLibrary.simpleMessage(
      "You don\'t have any hirement yet",
    ),
  };
}
