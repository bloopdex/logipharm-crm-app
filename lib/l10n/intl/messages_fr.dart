// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a fr locale. All the
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
  String get localeName => 'fr';

  static String m0(clientName, productCount) =>
      "Êtes-vous sûr de vouloir passer la commande pour : ${clientName}, avec ${productCount} produits ?";

  static String m1(percentage) => "${percentage}%";

  static String m2(ref) => "Offre ${ref}";

  static String m3(count) => "${count} Client";

  static String m4(percentage) => "${percentage}%";

  static String m5(count) => "Clients (${count})";

  static String m6(radius) =>
      "Vous êtes en dehors du rayon autorisé (${radius} m) pour ce client";

  static String m7(min) =>
      "Le rapport doit contenir au moins ${min} caractères";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "active": MessageLookupByLibrary.simpleMessage("Actif"),
    "add": MessageLookupByLibrary.simpleMessage("Ajouter"),
    "addClaim": MessageLookupByLibrary.simpleMessage("Ajouter une réclamation"),
    "addEtablissement": MessageLookupByLibrary.simpleMessage(
      "Ajouter un établissement",
    ),
    "addGrossiste": MessageLookupByLibrary.simpleMessage(
      "Ajouter un grossiste",
    ),
    "addMotif": MessageLookupByLibrary.simpleMessage("Ajouter un motif"),
    "addObservation": MessageLookupByLibrary.simpleMessage(
      "Ajouter une observation",
    ),
    "addProducts": MessageLookupByLibrary.simpleMessage("Ajouter des produits"),
    "addToCart": MessageLookupByLibrary.simpleMessage("Ajouter au panier"),
    "addVeilleConcurrentielle": MessageLookupByLibrary.simpleMessage(
      "Ajouter une veille concurrentielle",
    ),
    "addVisit": MessageLookupByLibrary.simpleMessage("Ajouter une visite"),
    "addVisitToEvent": MessageLookupByLibrary.simpleMessage(
      "Ajouter une visite à l\'événement",
    ),
    "address": MessageLookupByLibrary.simpleMessage("Adresse"),
    "addressHint": MessageLookupByLibrary.simpleMessage("Rue et numéro"),
    "addressPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Entrez l\'adresse",
    ),
    "addressRequired": MessageLookupByLibrary.simpleMessage(
      "L\'adresse est requise",
    ),
    "allClients": MessageLookupByLibrary.simpleMessage("Tous les clients"),
    "allCommunes": MessageLookupByLibrary.simpleMessage("Toutes les communes"),
    "allLaboratories": MessageLookupByLibrary.simpleMessage(
      "Tous les laboratoires",
    ),
    "allRegions": MessageLookupByLibrary.simpleMessage("Toutes les régions"),
    "analytics": MessageLookupByLibrary.simpleMessage("Analyses"),
    "authLoginDescription": MessageLookupByLibrary.simpleMessage(
      "Et accédez à toutes les fonctionnalités de l\'application",
    ),
    "authLoginError": MessageLookupByLibrary.simpleMessage(
      "Nom d\'utilisateur ou mot de passe invalide",
    ),
    "authLoginPassword": MessageLookupByLibrary.simpleMessage("Mot de passe"),
    "authLoginPasswordPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Entrez votre mot de passe",
    ),
    "authLoginPasswordRequired": MessageLookupByLibrary.simpleMessage(
      "Le mot de passe est requis",
    ),
    "authLoginSubmit": MessageLookupByLibrary.simpleMessage("Connexion"),
    "authLoginTitle": MessageLookupByLibrary.simpleMessage("Connexion"),
    "authLoginUsername": MessageLookupByLibrary.simpleMessage(
      "Nom d\'utilisateur",
    ),
    "authLoginUsernamePlaceholder": MessageLookupByLibrary.simpleMessage(
      "Entrez votre nom d\'utilisateur",
    ),
    "authLoginUsernameRequired": MessageLookupByLibrary.simpleMessage(
      "Le nom d\'utilisateur est requis",
    ),
    "avgRealization": MessageLookupByLibrary.simpleMessage("Avg"),
    "back": MessageLookupByLibrary.simpleMessage("Retour"),
    "baseUrl": MessageLookupByLibrary.simpleMessage("Base URL"),
    "blockageCommercial": MessageLookupByLibrary.simpleMessage("Commercial"),
    "blockageFinancial": MessageLookupByLibrary.simpleMessage("Financier"),
    "cancel": MessageLookupByLibrary.simpleMessage("Annuler"),
    "cantCreatePlanWhileOpened": MessageLookupByLibrary.simpleMessage(
      "Impossible de créer un plan pendant qu\'un plan est ouvert",
    ),
    "cantCreateVisit": MessageLookupByLibrary.simpleMessage(
      "Impossible de créer une visite",
    ),
    "cart": MessageLookupByLibrary.simpleMessage("Panier"),
    "cartCancelDelete": MessageLookupByLibrary.simpleMessage(
      "Annuler la suppression",
    ),
    "cartConfirmDelete": MessageLookupByLibrary.simpleMessage(
      "Êtes-vous sûr de vouloir supprimer cet article du panier ?",
    ),
    "cartRemoveItem": MessageLookupByLibrary.simpleMessage(
      "Supprimer l\'article",
    ),
    "category": MessageLookupByLibrary.simpleMessage("Catégorie"),
    "categoryUpdated": MessageLookupByLibrary.simpleMessage(
      "Catégorie mise à jour",
    ),
    "ceiling": MessageLookupByLibrary.simpleMessage("Plafond"),
    "changeAddress": MessageLookupByLibrary.simpleMessage("Changer l\'adresse"),
    "changeCategory": MessageLookupByLibrary.simpleMessage(
      "Changer la catégorie",
    ),
    "changePassword": MessageLookupByLibrary.simpleMessage(
      "Changer le mot de passe",
    ),
    "city": MessageLookupByLibrary.simpleMessage("Ville"),
    "cityHint": MessageLookupByLibrary.simpleMessage(
      "Saisir le nom de la ville",
    ),
    "claims": MessageLookupByLibrary.simpleMessage("Réclamations"),
    "client": MessageLookupByLibrary.simpleMessage("Client"),
    "clientAddress": MessageLookupByLibrary.simpleMessage("Adresse du client"),
    "clientDetails": MessageLookupByLibrary.simpleMessage("Détails du client"),
    "clientList": MessageLookupByLibrary.simpleMessage("Liste des clients"),
    "clientName": MessageLookupByLibrary.simpleMessage("Nom du client"),
    "clientType": MessageLookupByLibrary.simpleMessage("Type de client"),
    "clients": MessageLookupByLibrary.simpleMessage("Clients"),
    "closeAction": MessageLookupByLibrary.simpleMessage("Fermer"),
    "closeTourPlan": MessageLookupByLibrary.simpleMessage(
      "Fermer le plan de visite",
    ),
    "closeTourPlanDesc": MessageLookupByLibrary.simpleMessage(
      "Ferme le plan de tournée actuel.",
    ),
    "cnrc": MessageLookupByLibrary.simpleMessage("Prospect"),
    "cnrcCreatedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "CNRC créé avec succès",
    ),
    "colis": MessageLookupByLibrary.simpleMessage("Colis"),
    "color": MessageLookupByLibrary.simpleMessage("Couleur"),
    "commune": MessageLookupByLibrary.simpleMessage("Commune"),
    "communePlaceholder": MessageLookupByLibrary.simpleMessage(
      "Sélectionner une commune",
    ),
    "completed": MessageLookupByLibrary.simpleMessage("Terminé"),
    "confirm": MessageLookupByLibrary.simpleMessage("Confirmer"),
    "confirmClientMessage": m0,
    "confirmClientTitle": MessageLookupByLibrary.simpleMessage(
      "Confirmer le client",
    ),
    "confirmPassword": MessageLookupByLibrary.simpleMessage(
      "Confirmer le mot de passe",
    ),
    "confirmPasswordPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Confirmez votre nouveau mot de passe",
    ),
    "confirmPasswordRequired": MessageLookupByLibrary.simpleMessage(
      "La confirmation du mot de passe est requise",
    ),
    "consultation": MessageLookupByLibrary.simpleMessage("Consultation"),
    "contactArticleCode": MessageLookupByLibrary.simpleMessage("Code article"),
    "contactArticleCodeHint": MessageLookupByLibrary.simpleMessage(
      "Code article si applicable",
    ),
    "contactConnaissanceProduit": MessageLookupByLibrary.simpleMessage(
      "Connaissance du produit",
    ),
    "contactConnaissanceProduitHint": MessageLookupByLibrary.simpleMessage(
      "Connaissance du produit (Oui/Non)",
    ),
    "contactDelegueId": MessageLookupByLibrary.simpleMessage("ID délégué"),
    "contactDelegueIdHint": MessageLookupByLibrary.simpleMessage(
      "Saisir l\'ID du délégué",
    ),
    "contactFiscalCode": MessageLookupByLibrary.simpleMessage("Code fiscal"),
    "contactFiscalCodeHint": MessageLookupByLibrary.simpleMessage(
      "Numéro d\'identification fiscale",
    ),
    "contactLabel": MessageLookupByLibrary.simpleMessage("Contact"),
    "contactMedecinTraitant": MessageLookupByLibrary.simpleMessage(
      "Médecin traitant",
    ),
    "contactMedecinTraitantHint": MessageLookupByLibrary.simpleMessage(
      "Nom du médecin traitant",
    ),
    "contactNis": MessageLookupByLibrary.simpleMessage("NIS"),
    "contactNisHint": MessageLookupByLibrary.simpleMessage(
      "NIS (ID statistique)",
    ),
    "contactObjections": MessageLookupByLibrary.simpleMessage("Objections"),
    "contactObjectionsHint": MessageLookupByLibrary.simpleMessage(
      "Saisir les objections le cas échéant",
    ),
    "contactPatientConnaissanceProduit": MessageLookupByLibrary.simpleMessage(
      "Connaissance du produit (patient)",
    ),
    "contactPatientConnaissanceProduitHint":
        MessageLookupByLibrary.simpleMessage(
          "Connaissance du produit (Oui/Non)",
        ),
    "contactPotentiel": MessageLookupByLibrary.simpleMessage("Potentiel"),
    "contactPotentielHint": MessageLookupByLibrary.simpleMessage(
      "Niveau de potentiel",
    ),
    "contactPrescripteur": MessageLookupByLibrary.simpleMessage("Prescripteur"),
    "contactPrescripteurHint": MessageLookupByLibrary.simpleMessage(
      "Prescripteur (Oui/Non)",
    ),
    "contactRcCode": MessageLookupByLibrary.simpleMessage("Code RC"),
    "contactRcCodeHint": MessageLookupByLibrary.simpleMessage(
      "Numéro du registre du commerce",
    ),
    "contactRegionLib": MessageLookupByLibrary.simpleMessage(
      "Nom de la région",
    ),
    "contactRegionLibHint": MessageLookupByLibrary.simpleMessage(
      "Saisir le nom de la région",
    ),
    "contactResultatTest": MessageLookupByLibrary.simpleMessage(
      "Résultat du test",
    ),
    "contactResultatTestHint": MessageLookupByLibrary.simpleMessage(
      "Détails du résultat du test",
    ),
    "contactSpecialite": MessageLookupByLibrary.simpleMessage("Spécialité"),
    "contactSpecialiteHint": MessageLookupByLibrary.simpleMessage(
      "Spécialité médicale",
    ),
    "contactSpecialiteMedecin": MessageLookupByLibrary.simpleMessage(
      "Spécialité du médecin",
    ),
    "contactSpecialiteMedecinHint": MessageLookupByLibrary.simpleMessage(
      "Spécialité du médecin",
    ),
    "contactTesteProduit": MessageLookupByLibrary.simpleMessage(
      "Produit testé",
    ),
    "contactTesteProduitHint": MessageLookupByLibrary.simpleMessage(
      "Produit testé (Oui/Non)",
    ),
    "contactTypeDiabete": MessageLookupByLibrary.simpleMessage(
      "Type de diabète",
    ),
    "contactTypeDiabeteHint": MessageLookupByLibrary.simpleMessage(
      "Type de diabète",
    ),
    "contactVilId": MessageLookupByLibrary.simpleMessage("ID ville"),
    "contactVilIdHint": MessageLookupByLibrary.simpleMessage(
      "Saisir le code de la ville",
    ),
    "contactWilayaId": MessageLookupByLibrary.simpleMessage("ID wilaya"),
    "contactWilayaIdHint": MessageLookupByLibrary.simpleMessage(
      "Saisir le code wilaya",
    ),
    "contacts": MessageLookupByLibrary.simpleMessage("Contacts"),
    "contactsAdd": MessageLookupByLibrary.simpleMessage("Ajouter un contact"),
    "contactsCategorie": MessageLookupByLibrary.simpleMessage("Catégorie"),
    "contactsContactInfo": MessageLookupByLibrary.simpleMessage("Coordonnées"),
    "contactsEdit": MessageLookupByLibrary.simpleMessage("Modifier le contact"),
    "contactsEmpty": MessageLookupByLibrary.simpleMessage("Aucun contact"),
    "contactsGeneralInfo": MessageLookupByLibrary.simpleMessage(
      "Informations générales",
    ),
    "contactsMedecin": MessageLookupByLibrary.simpleMessage("Médecin"),
    "contactsMedecinDetails": MessageLookupByLibrary.simpleMessage(
      "Détails Médecin",
    ),
    "contactsPatient": MessageLookupByLibrary.simpleMessage("Patient"),
    "contactsPharmacien": MessageLookupByLibrary.simpleMessage("Pharmacien"),
    "contactsPharmacienDetails": MessageLookupByLibrary.simpleMessage(
      "Détails Pharmacien",
    ),
    "contactsTitle": MessageLookupByLibrary.simpleMessage("Contacts"),
    "create": MessageLookupByLibrary.simpleMessage("Créer"),
    "createCnrc": MessageLookupByLibrary.simpleMessage("Créer CNRC"),
    "createNewHirement": MessageLookupByLibrary.simpleMessage(
      "Créer un nouveau recrutement",
    ),
    "createNewVisit": MessageLookupByLibrary.simpleMessage(
      "Créer une nouvelle visite",
    ),
    "createdAt": MessageLookupByLibrary.simpleMessage("Créé à"),
    "createdBy": MessageLookupByLibrary.simpleMessage("Créé par"),
    "dashboard": MessageLookupByLibrary.simpleMessage("Tableau de bord"),
    "delegateRole": MessageLookupByLibrary.simpleMessage("Délégué"),
    "email": MessageLookupByLibrary.simpleMessage("Email"),
    "emailHint": MessageLookupByLibrary.simpleMessage("nom@exemple.com"),
    "emailInvalid": MessageLookupByLibrary.simpleMessage(
      "Entrez un email valide",
    ),
    "emailPlaceholder": MessageLookupByLibrary.simpleMessage("Entrez l\'email"),
    "emailRequired": MessageLookupByLibrary.simpleMessage(
      "L\'email est requis",
    ),
    "emptyCart": MessageLookupByLibrary.simpleMessage("Panier vide"),
    "emptyCartDescription": MessageLookupByLibrary.simpleMessage(
      "Vous n\'avez encore aucun produit dans votre panier",
    ),
    "emptyOffers": MessageLookupByLibrary.simpleMessage("Aucune offre trouvée"),
    "emptyPaliers": MessageLookupByLibrary.simpleMessage("Aucun palier trouvé"),
    "emptyProducts": MessageLookupByLibrary.simpleMessage(
      "Aucun produit trouvé",
    ),
    "endDate": MessageLookupByLibrary.simpleMessage("Date de fin"),
    "error": MessageLookupByLibrary.simpleMessage("Erreur"),
    "errorLoadingData": MessageLookupByLibrary.simpleMessage(
      "Erreur de chargement des données",
    ),
    "etablissement": MessageLookupByLibrary.simpleMessage("Etablissement"),
    "eventAll": MessageLookupByLibrary.simpleMessage("Tous les événements"),
    "eventCompleted": MessageLookupByLibrary.simpleMessage("Terminé"),
    "eventDetailsCreatedBy": MessageLookupByLibrary.simpleMessage("Créé par"),
    "eventDetailsTitle": MessageLookupByLibrary.simpleMessage(
      "Détails de l\'événement",
    ),
    "eventInProgress": MessageLookupByLibrary.simpleMessage("En cours"),
    "eventPending": MessageLookupByLibrary.simpleMessage("En attente"),
    "eventProgress": m1,
    "eventTitle": MessageLookupByLibrary.simpleMessage("Titre de l\'événement"),
    "eventType": MessageLookupByLibrary.simpleMessage("Type d\'événement"),
    "events": MessageLookupByLibrary.simpleMessage("Événements"),
    "eventsTitle": MessageLookupByLibrary.simpleMessage("Événements"),
    "expirationDate": MessageLookupByLibrary.simpleMessage("DDP"),
    "exportProducts": MessageLookupByLibrary.simpleMessage(
      "Exporter les produits",
    ),
    "exportStoragePermissionRequired": MessageLookupByLibrary.simpleMessage(
      "La permission de stockage est requise pour exporter les produits",
    ),
    "exportingProducts": MessageLookupByLibrary.simpleMessage(
      "Exportation des produits...",
    ),
    "fieldIsRequired": MessageLookupByLibrary.simpleMessage(
      "le champ est obligatoire",
    ),
    "fileCNRC": MessageLookupByLibrary.simpleMessage("Prospect"),
    "finish": MessageLookupByLibrary.simpleMessage("Terminer"),
    "firstName": MessageLookupByLibrary.simpleMessage("Prénom"),
    "firstNamePlaceholder": MessageLookupByLibrary.simpleMessage(
      "Entrez le prénom",
    ),
    "firstNameRequired": MessageLookupByLibrary.simpleMessage(
      "Le prénom est requis",
    ),
    "generic": MessageLookupByLibrary.simpleMessage("Generic"),
    "goalOfDay": MessageLookupByLibrary.simpleMessage("Objectif du jour"),
    "goalOfMonthRecrutement": MessageLookupByLibrary.simpleMessage(
      "Objectif de recrutement du mois",
    ),
    "goalOfMonthSales": MessageLookupByLibrary.simpleMessage(
      "Objectif de vente du mois",
    ),
    "grossiste": MessageLookupByLibrary.simpleMessage("Grossiste"),
    "hire": MessageLookupByLibrary.simpleMessage("Recruter"),
    "hireDetails": MessageLookupByLibrary.simpleMessage(
      "Détails de l\'Recrute",
    ),
    "hired": MessageLookupByLibrary.simpleMessage("Embauché"),
    "hirement": MessageLookupByLibrary.simpleMessage("Recrutement"),
    "hiring": MessageLookupByLibrary.simpleMessage("Recrutement"),
    "homeCreateNewEvent": MessageLookupByLibrary.simpleMessage(
      "Créer un nouvel événement",
    ),
    "homeCreateNewPlan": MessageLookupByLibrary.simpleMessage(
      "Créer un nouveau plan",
    ),
    "homeCreateNewVisit": MessageLookupByLibrary.simpleMessage(
      "Créer une nouvelle visite",
    ),
    "homeHello": MessageLookupByLibrary.simpleMessage("Bonjour"),
    "homeHireNewClient": MessageLookupByLibrary.simpleMessage(
      "Recruter un nouveau client",
    ),
    "homeMyClients": MessageLookupByLibrary.simpleMessage("Mes clients"),
    "homeMyTasksToday": MessageLookupByLibrary.simpleMessage(
      "Mes tâches aujourd\'hui",
    ),
    "homePendingHire": MessageLookupByLibrary.simpleMessage(
      "Recrute en attente",
    ),
    "homePendingPlan": MessageLookupByLibrary.simpleMessage("Plan en attente"),
    "homeQuickAddContact": MessageLookupByLibrary.simpleMessage(
      "Ajouter un contact",
    ),
    "inProgress": MessageLookupByLibrary.simpleMessage("En cours"),
    "inactiveClients": MessageLookupByLibrary.simpleMessage("Inactifs"),
    "labelAmount": MessageLookupByLibrary.simpleMessage("Montant"),
    "labelDates": MessageLookupByLibrary.simpleMessage("Dates"),
    "labelLabCode": MessageLookupByLibrary.simpleMessage("Code labo"),
    "labelLaboratory": MessageLookupByLibrary.simpleMessage("Laboratoire"),
    "labelMax": MessageLookupByLibrary.simpleMessage("Max"),
    "labelMin": MessageLookupByLibrary.simpleMessage("Min"),
    "labelProductId": MessageLookupByLibrary.simpleMessage("ID du produit"),
    "labelProductName": MessageLookupByLibrary.simpleMessage("Nom du produit"),
    "labelReference": MessageLookupByLibrary.simpleMessage("Référence"),
    "labelTierType": MessageLookupByLibrary.simpleMessage("Type de palier"),
    "labelType": MessageLookupByLibrary.simpleMessage("Type"),
    "labelValue": MessageLookupByLibrary.simpleMessage("Valeur"),
    "laboratoire": MessageLookupByLibrary.simpleMessage("Laboratoire"),
    "lastName": MessageLookupByLibrary.simpleMessage("Nom de famille"),
    "lastNamePlaceholder": MessageLookupByLibrary.simpleMessage(
      "Entrez le nom de famille",
    ),
    "lastNameRequired": MessageLookupByLibrary.simpleMessage(
      "Le nom de famille est requis",
    ),
    "lastVisitDate": MessageLookupByLibrary.simpleMessage("Dernière visite"),
    "later": MessageLookupByLibrary.simpleMessage("Plus tard"),
    "locationPermissionRequired": MessageLookupByLibrary.simpleMessage(
      "La permission de localisation est requise",
    ),
    "locationUpdatedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Localisation mise à jour avec succès",
    ),
    "logout": MessageLookupByLibrary.simpleMessage("Déconnexion"),
    "lot": MessageLookupByLibrary.simpleMessage("Lot"),
    "manageProfile": MessageLookupByLibrary.simpleMessage("Gérer le profil"),
    "menuProductRotation": MessageLookupByLibrary.simpleMessage(
      "Rotation des Produits",
    ),
    "modePaie": MessageLookupByLibrary.simpleMessage("Mode de paiement"),
    "moreDetails": MessageLookupByLibrary.simpleMessage("Plus de détails"),
    "motif": MessageLookupByLibrary.simpleMessage("Motif"),
    "myOrders": MessageLookupByLibrary.simpleMessage("Mes commandes"),
    "name": MessageLookupByLibrary.simpleMessage("Nom"),
    "navHome": MessageLookupByLibrary.simpleMessage("Accueil"),
    "navMenu": MessageLookupByLibrary.simpleMessage("Menu"),
    "navPlans": MessageLookupByLibrary.simpleMessage("Plans"),
    "navTodos": MessageLookupByLibrary.simpleMessage("Tâches"),
    "navVisits": MessageLookupByLibrary.simpleMessage("Visites"),
    "newPassword": MessageLookupByLibrary.simpleMessage("Nouveau mot de passe"),
    "newPasswordPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Entrez votre nouveau mot de passe",
    ),
    "newPasswordRequired": MessageLookupByLibrary.simpleMessage(
      "Le nouveau mot de passe est requis",
    ),
    "next": MessageLookupByLibrary.simpleMessage("Suivant"),
    "nif": MessageLookupByLibrary.simpleMessage("NIF"),
    "nifPlaceholder": MessageLookupByLibrary.simpleMessage("Entrer le NIF"),
    "nis": MessageLookupByLibrary.simpleMessage("NIS"),
    "nisPlaceholder": MessageLookupByLibrary.simpleMessage("Entrer le NIS"),
    "noAddress": MessageLookupByLibrary.simpleMessage("Pas d\'adresse"),
    "noAnalytics": MessageLookupByLibrary.simpleMessage(
      "Aucune analyse trouvée",
    ),
    "noAnalyticsDesc": MessageLookupByLibrary.simpleMessage(
      "Aucune analyse trouvée pour ce client",
    ),
    "noCategory": MessageLookupByLibrary.simpleMessage("Pas de catégorie"),
    "noCategoryOptions": MessageLookupByLibrary.simpleMessage(
      "Aucune catégorie",
    ),
    "noClaims": MessageLookupByLibrary.simpleMessage("Pas de réclamations"),
    "noClaimsDesc": MessageLookupByLibrary.simpleMessage(
      "Aucune réclamation trouvée pour ce client",
    ),
    "noClientsFound": MessageLookupByLibrary.simpleMessage(
      "Aucun client trouvé",
    ),
    "noCommune": MessageLookupByLibrary.simpleMessage("Pas de commune"),
    "noCreator": MessageLookupByLibrary.simpleMessage("Aucun créateur"),
    "noEmail": MessageLookupByLibrary.simpleMessage("Pas d\'email"),
    "noEtablissement": MessageLookupByLibrary.simpleMessage(
      "Pas d\'établissement",
    ),
    "noEvents": MessageLookupByLibrary.simpleMessage("Aucun événement trouvé"),
    "noEventsDesc": MessageLookupByLibrary.simpleMessage(
      "Aucun événement trouvé pour aujourd\'hui",
    ),
    "noEventsDescription": MessageLookupByLibrary.simpleMessage(
      "Aucun év��nement trouvé",
    ),
    "noFirstName": MessageLookupByLibrary.simpleMessage("Pas de prénom"),
    "noGrossiste": MessageLookupByLibrary.simpleMessage("Pas de grossiste"),
    "noHirement": MessageLookupByLibrary.simpleMessage(
      "Aucun recrutement trouvé",
    ),
    "noLabel": MessageLookupByLibrary.simpleMessage("Non"),
    "noLastName": MessageLookupByLibrary.simpleMessage("Pas de nom de famille"),
    "noModePaie": MessageLookupByLibrary.simpleMessage(
      "Pas de mode de paiement",
    ),
    "noMotif": MessageLookupByLibrary.simpleMessage("Pas de motif"),
    "noMotifDesc": MessageLookupByLibrary.simpleMessage(
      "Aucun motif trouvé pour cette observation",
    ),
    "noName": MessageLookupByLibrary.simpleMessage("Pas de nom"),
    "noNote": MessageLookupByLibrary.simpleMessage("Pas de note"),
    "noObservations": MessageLookupByLibrary.simpleMessage(
      "Pas d\'observations",
    ),
    "noObservationsDesc": MessageLookupByLibrary.simpleMessage(
      "Aucune observation trouvée pour ce client",
    ),
    "noPhone": MessageLookupByLibrary.simpleMessage("Pas de téléphone"),
    "noRegion": MessageLookupByLibrary.simpleMessage("Pas de région"),
    "noSolvability": MessageLookupByLibrary.simpleMessage(
      "Pas de solvaibilité",
    ),
    "noTitle": MessageLookupByLibrary.simpleMessage("Pas de titre"),
    "noVeilleConcurrentielle": MessageLookupByLibrary.simpleMessage(
      "Pas de veille concurrentielle",
    ),
    "noVeilleConcurrentielleDesc": MessageLookupByLibrary.simpleMessage(
      "Pas d\'entrée de veille concurrentielle trouvée pour ce client",
    ),
    "noVisitsYet": MessageLookupByLibrary.simpleMessage("Aucune visite"),
    "note": MessageLookupByLibrary.simpleMessage("Note"),
    "notePlaceholder": MessageLookupByLibrary.simpleMessage("Entrez la note"),
    "notifications": MessageLookupByLibrary.simpleMessage("Notifications"),
    "obj": MessageLookupByLibrary.simpleMessage("Obj"),
    "observations": MessageLookupByLibrary.simpleMessage("Observations"),
    "offerDetailsTitle": m2,
    "offersTitle": MessageLookupByLibrary.simpleMessage("Offres"),
    "oldPassword": MessageLookupByLibrary.simpleMessage("Ancien mot de passe"),
    "oldPasswordPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Entrez votre ancien mot de passe",
    ),
    "oldPasswordRequired": MessageLookupByLibrary.simpleMessage(
      "L\'ancien mot de passe est requis",
    ),
    "orders": MessageLookupByLibrary.simpleMessage("Commandes"),
    "paliersTitle": MessageLookupByLibrary.simpleMessage("Paliers"),
    "passwordChanged": MessageLookupByLibrary.simpleMessage(
      "Mot de passe changé avec succès",
    ),
    "passwordChangedFailed": MessageLookupByLibrary.simpleMessage(
      "Échec du changement de mot de passe",
    ),
    "passwordLengthError": MessageLookupByLibrary.simpleMessage(
      "Le mot de passe doit contenir au moins 6 caractères",
    ),
    "passwordNotMatch": MessageLookupByLibrary.simpleMessage(
      "Les mots de passe ne correspondent pas",
    ),
    "pending": MessageLookupByLibrary.simpleMessage("En attente"),
    "pendingEvent": MessageLookupByLibrary.simpleMessage(
      "Événement en attente",
    ),
    "phase": MessageLookupByLibrary.simpleMessage("Phase"),
    "phone": MessageLookupByLibrary.simpleMessage("Téléphone"),
    "phone1": MessageLookupByLibrary.simpleMessage("Téléphone 1"),
    "phone1Hint": MessageLookupByLibrary.simpleMessage("+213 5x xx xx xx"),
    "phone2": MessageLookupByLibrary.simpleMessage("Téléphone 2"),
    "phone2Hint": MessageLookupByLibrary.simpleMessage("+213 7x xx xx xx"),
    "phonePlaceholder": MessageLookupByLibrary.simpleMessage(
      "Entrez le téléphone",
    ),
    "phoneRequired": MessageLookupByLibrary.simpleMessage(
      "Le téléphone est requis",
    ),
    "ppa": MessageLookupByLibrary.simpleMessage("PPA"),
    "price": MessageLookupByLibrary.simpleMessage("Prix"),
    "printAction": MessageLookupByLibrary.simpleMessage("Imprimer"),
    "productRotation": MessageLookupByLibrary.simpleMessage(
      "Rotation des Produits",
    ),
    "productRotationEndDate": MessageLookupByLibrary.simpleMessage(
      "Date de fin",
    ),
    "productRotationError": MessageLookupByLibrary.simpleMessage(
      "Erreur de chargement",
    ),
    "productRotationNoData": MessageLookupByLibrary.simpleMessage(
      "Aucune donnée trouvée",
    ),
    "productRotationNoDataDescription": MessageLookupByLibrary.simpleMessage(
      "Aucune vente de produits sur cette période",
    ),
    "productRotationRetry": MessageLookupByLibrary.simpleMessage("Réessayer"),
    "productRotationStartDate": MessageLookupByLibrary.simpleMessage(
      "Date de début",
    ),
    "productRotationTotalProducts": MessageLookupByLibrary.simpleMessage(
      "Total des produits :",
    ),
    "productRotationUnits": MessageLookupByLibrary.simpleMessage("unités"),
    "products": MessageLookupByLibrary.simpleMessage("Produits"),
    "productsExportEmptyFile": MessageLookupByLibrary.simpleMessage(
      "Le fichier exporté des produits est vide",
    ),
    "productsExportFailed": MessageLookupByLibrary.simpleMessage(
      "Échec de l\'export du PDF des produits",
    ),
    "productsExportReady": MessageLookupByLibrary.simpleMessage(
      "Le PDF des produits est prêt. Choisissez une action.",
    ),
    "productsExportSuccess": MessageLookupByLibrary.simpleMessage(
      "Le PDF des produits a été téléchargé avec succès",
    ),
    "productsTitle": MessageLookupByLibrary.simpleMessage("Produits"),
    "prospect": MessageLookupByLibrary.simpleMessage("Prospect"),
    "quantity": MessageLookupByLibrary.simpleMessage("Quantité"),
    "quantitySansUg": MessageLookupByLibrary.simpleMessage("Quantité sans UG"),
    "quantityUg": MessageLookupByLibrary.simpleMessage("Quantité (UG)"),
    "refused": MessageLookupByLibrary.simpleMessage("Refusé"),
    "region": MessageLookupByLibrary.simpleMessage("Région"),
    "regionPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Sélectionner une région",
    ),
    "regionRequired": MessageLookupByLibrary.simpleMessage(
      "La région est requise",
    ),
    "rejected": MessageLookupByLibrary.simpleMessage("Rejeté"),
    "removeItem": MessageLookupByLibrary.simpleMessage("Supprimer l\'article"),
    "retry": MessageLookupByLibrary.simpleMessage("Réessayer"),
    "save": MessageLookupByLibrary.simpleMessage("Sauvegarder"),
    "searchClient": MessageLookupByLibrary.simpleMessage(
      "Rechercher un client",
    ),
    "searchEvents": MessageLookupByLibrary.simpleMessage(
      "Rechercher des événements",
    ),
    "searchProducts": MessageLookupByLibrary.simpleMessage(
      "Rechercher des produits ...",
    ),
    "selectCategory": MessageLookupByLibrary.simpleMessage(
      "Sélectionner une catégorie",
    ),
    "selectClient": MessageLookupByLibrary.simpleMessage(
      "Sélectionner un client",
    ),
    "selectContact": MessageLookupByLibrary.simpleMessage(
      "Sélectionner un contact",
    ),
    "selectDate": MessageLookupByLibrary.simpleMessage("Sélectionner une date"),
    "selectDateRange": MessageLookupByLibrary.simpleMessage(
      "Sélectionner la période",
    ),
    "selectDateTime": MessageLookupByLibrary.simpleMessage(
      "Sélectionner la date et l\'heure",
    ),
    "selectReason": MessageLookupByLibrary.simpleMessage(
      "Sélectionner une raison",
    ),
    "selectTime": MessageLookupByLibrary.simpleMessage("Sélectionner l\'heure"),
    "selectVisitResult": MessageLookupByLibrary.simpleMessage(
      "Sélectionner le résultat de la visite",
    ),
    "shareAction": MessageLookupByLibrary.simpleMessage("Partager"),
    "sold": MessageLookupByLibrary.simpleMessage("Vendu"),
    "solvability": MessageLookupByLibrary.simpleMessage("Solvaibilité"),
    "start": MessageLookupByLibrary.simpleMessage("Démarrer"),
    "startDate": MessageLookupByLibrary.simpleMessage("Date de début"),
    "status": MessageLookupByLibrary.simpleMessage("Statut"),
    "supervisorRole": MessageLookupByLibrary.simpleMessage("Superviseur"),
    "supplier": MessageLookupByLibrary.simpleMessage("Fournisseur"),
    "system": MessageLookupByLibrary.simpleMessage("Système"),
    "today": MessageLookupByLibrary.simpleMessage("Aujourd\'hui"),
    "todoCreateNewEvent": MessageLookupByLibrary.simpleMessage(
      "Créer un nouvel événement",
    ),
    "todoCreateNewTask": MessageLookupByLibrary.simpleMessage(
      "Créer une nouvelle tâche",
    ),
    "todoDetails": MessageLookupByLibrary.simpleMessage("Détails"),
    "todoDetailsError": MessageLookupByLibrary.simpleMessage(
      "Les détails sont requis",
    ),
    "todoDetailsPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Entrez les détails",
    ),
    "todoEvent": MessageLookupByLibrary.simpleMessage("Événement"),
    "todoTask": MessageLookupByLibrary.simpleMessage("Tâche"),
    "todoTitle": MessageLookupByLibrary.simpleMessage("Titre"),
    "todoTitleError": MessageLookupByLibrary.simpleMessage(
      "Le titre est requis",
    ),
    "todoTitlePlaceholder": MessageLookupByLibrary.simpleMessage(
      "Entrez le titre",
    ),
    "total": MessageLookupByLibrary.simpleMessage("Total"),
    "totalHt": MessageLookupByLibrary.simpleMessage("Total HT"),
    "totalPayment": MessageLookupByLibrary.simpleMessage("Paiement total"),
    "totalRest": MessageLookupByLibrary.simpleMessage("Reste total à payer"),
    "totalTtc": MessageLookupByLibrary.simpleMessage("Total TTC"),
    "tourAllPlans": MessageLookupByLibrary.simpleMessage("Tous les plans"),
    "tourClient": m3,
    "tourCompletedPlans": MessageLookupByLibrary.simpleMessage(
      "Plans terminés",
    ),
    "tourCompletedStatus": MessageLookupByLibrary.simpleMessage("Terminé"),
    "tourCreateNewPlan": MessageLookupByLibrary.simpleMessage(
      "Créer un nouveau plan",
    ),
    "tourCreationClientEmptyDescription": MessageLookupByLibrary.simpleMessage(
      "Aucun client trouvé dans cette région",
    ),
    "tourCreationClientEmptyTitle": MessageLookupByLibrary.simpleMessage(
      "Aucun client trouvé",
    ),
    "tourCreationClientVisitsDescription": MessageLookupByLibrary.simpleMessage(
      "Sélectionnez les clients que vous souhaitez visiter pendant cette visite.",
    ),
    "tourCreationClientVisitsTitle": MessageLookupByLibrary.simpleMessage(
      "Clients à visiter",
    ),
    "tourCreationClientsLabel": MessageLookupByLibrary.simpleMessage("Clients"),
    "tourCreationCommuneLabel": MessageLookupByLibrary.simpleMessage("Commune"),
    "tourCreationErrorDescription": MessageLookupByLibrary.simpleMessage(
      "Une erreur s\'est produite lors de la création du plan de visite. Veuillez réessayer plus tard.",
    ),
    "tourCreationErrorTitle": MessageLookupByLibrary.simpleMessage(
      "Une erreur s\'est produite",
    ),
    "tourCreationInProgressDescription": MessageLookupByLibrary.simpleMessage(
      "Nous finalisons les détails de votre plan de visite. Merci pour votre patience.",
    ),
    "tourCreationInProgressTitle": MessageLookupByLibrary.simpleMessage(
      "La création du plan de visite est en cours",
    ),
    "tourCreationName": MessageLookupByLibrary.simpleMessage("Nom"),
    "tourCreationNoAddress": MessageLookupByLibrary.simpleMessage(
      "Pas d\'adresse",
    ),
    "tourCreationRegionLabel": MessageLookupByLibrary.simpleMessage("Région"),
    "tourCreationRegionPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Sélectionner une région",
    ),
    "tourCreationStartTour": MessageLookupByLibrary.simpleMessage(
      "Voulez-vous démarrer la visite maintenant ?",
    ),
    "tourCreationStartTourDescription": MessageLookupByLibrary.simpleMessage(
      "Vous pouvez démarrer la visite maintenant ou plus tard à partir de la liste des visites prévues.",
    ),
    "tourCreationSuccessDescription": MessageLookupByLibrary.simpleMessage(
      "Votre plan de visite a été créé avec succès. Vous pouvez maintenant consulter et gérer vos visites prévues.",
    ),
    "tourCreationSuccessTitle": MessageLookupByLibrary.simpleMessage(
      "Plan de visite créé avec succès",
    ),
    "tourCreationTourDetailsDateLabel": MessageLookupByLibrary.simpleMessage(
      "Date",
    ),
    "tourCreationTourDetailsDelegateLabel":
        MessageLookupByLibrary.simpleMessage("Délégué"),
    "tourCreationTourDetailsDescription": MessageLookupByLibrary.simpleMessage(
      "Choisissez le délégué responsable de ce plan de visite et entrez la date prévue pour la visite.",
    ),
    "tourCreationTourDetailsTitle": MessageLookupByLibrary.simpleMessage(
      "Détails de la visite",
    ),
    "tourCurrentTour": MessageLookupByLibrary.simpleMessage("Visite actuelle"),
    "tourDetailsAllClients": MessageLookupByLibrary.simpleMessage(
      "Tous les clients",
    ),
    "tourDetailsClients": MessageLookupByLibrary.simpleMessage("Clients"),
    "tourDetailsNonVisited": MessageLookupByLibrary.simpleMessage("Non visité"),
    "tourDetailsNonVisitedClients": MessageLookupByLibrary.simpleMessage(
      "Clients non visités",
    ),
    "tourDetailsRegion": MessageLookupByLibrary.simpleMessage("Région"),
    "tourDetailsTitle": MessageLookupByLibrary.simpleMessage(
      "Détails de la visite",
    ),
    "tourDetailsTourBy": MessageLookupByLibrary.simpleMessage(
      "Plan de visite par",
    ),
    "tourDetailsVisitClient": MessageLookupByLibrary.simpleMessage(
      "Visiter le client",
    ),
    "tourDetailsVisited": MessageLookupByLibrary.simpleMessage("Visité"),
    "tourDetailsVisitedClients": MessageLookupByLibrary.simpleMessage(
      "Clients visités",
    ),
    "tourEmptyPlans": MessageLookupByLibrary.simpleMessage("Aucun plan trouvé"),
    "tourEmptyPlansDescription": MessageLookupByLibrary.simpleMessage(
      "Vous n\'avez encore aucun plan",
    ),
    "tourErrorExistClosedTour": MessageLookupByLibrary.simpleMessage(
      "La visite est déjà fermée",
    ),
    "tourErrorExistOpenTour": MessageLookupByLibrary.simpleMessage(
      "Vous avez une visite ouverte",
    ),
    "tourErrorResourceRequireAuthentication":
        MessageLookupByLibrary.simpleMessage(
          "Vous devez être authentifié pour accéder à cette ressource",
        ),
    "tourInProgressPlans": MessageLookupByLibrary.simpleMessage(
      "Plans en cours",
    ),
    "tourInProgressStatus": MessageLookupByLibrary.simpleMessage("En cours"),
    "tourPendingPlans": MessageLookupByLibrary.simpleMessage(
      "Plans en attente",
    ),
    "tourPendingStatus": MessageLookupByLibrary.simpleMessage("En attente"),
    "tourProgress": m4,
    "tourSearchPerCommune": MessageLookupByLibrary.simpleMessage(
      "Rechercher par commune",
    ),
    "tourSearchPerWilaya": MessageLookupByLibrary.simpleMessage(
      "Rechercher par wilaya",
    ),
    "tourValidationClientLabelNumber": m5,
    "tourValidationPlanBy": MessageLookupByLibrary.simpleMessage(
      "Plan de visite, par :",
    ),
    "tourValidationRegion": MessageLookupByLibrary.simpleMessage("Région"),
    "tourValidationTitle": MessageLookupByLibrary.simpleMessage(
      "Aperçu et validation",
    ),
    "turnover": MessageLookupByLibrary.simpleMessage("Chiffre d\'affaires"),
    "tva": MessageLookupByLibrary.simpleMessage("TVA"),
    "type": MessageLookupByLibrary.simpleMessage("Type"),
    "unitPrice": MessageLookupByLibrary.simpleMessage("PU"),
    "update": MessageLookupByLibrary.simpleMessage("Mettre à jour"),
    "updateVisit": MessageLookupByLibrary.simpleMessage(
      "Mettre à jour la visite",
    ),
    "uploadFile": MessageLookupByLibrary.simpleMessage("Téléverser un fichier"),
    "validate": MessageLookupByLibrary.simpleMessage("Valider"),
    "validated": MessageLookupByLibrary.simpleMessage("Validé"),
    "veilleConcurrentielle": MessageLookupByLibrary.simpleMessage(
      "Veille Concurrentielle",
    ),
    "viewDetails": MessageLookupByLibrary.simpleMessage("Voir les détails"),
    "visitActivationHint": MessageLookupByLibrary.simpleMessage(
      "Cochez cette case pour activer ce client lors de cette visite",
    ),
    "visitActivationLabel": MessageLookupByLibrary.simpleMessage(
      "Visite d\'activation",
    ),
    "visitAddedSuccessfully": MessageLookupByLibrary.simpleMessage(
      "Visite ajoutée avec succès",
    ),
    "visitAlreadyEntered": MessageLookupByLibrary.simpleMessage(
      "La visite est déjà entrée",
    ),
    "visitCount": MessageLookupByLibrary.simpleMessage("Visites"),
    "visitCreationClientLabel": MessageLookupByLibrary.simpleMessage("Client"),
    "visitCreationClientPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Sélectionner un client",
    ),
    "visitCreationContactTypeLabel": MessageLookupByLibrary.simpleMessage(
      "Type de contact",
    ),
    "visitCreationDateLabel": MessageLookupByLibrary.simpleMessage("Date"),
    "visitCreationDescription": MessageLookupByLibrary.simpleMessage(
      "Créer une nouvelle visite pour un client",
    ),
    "visitCreationInProgressDescription": MessageLookupByLibrary.simpleMessage(
      "Nous finalisons les détails de votre visite. Merci pour votre patience.",
    ),
    "visitCreationInProgressTitle": MessageLookupByLibrary.simpleMessage(
      "La création de la visite est en cours",
    ),
    "visitCreationOutsideAuthorizedRadius": m6,
    "visitCreationRapportLabel": MessageLookupByLibrary.simpleMessage(
      "Rapport",
    ),
    "visitCreationRapportMinCharError": m7,
    "visitCreationRapportPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Entrez le rapport de la visite",
    ),
    "visitCreationReasonError": MessageLookupByLibrary.simpleMessage(
      "La raison est requise",
    ),
    "visitCreationReasonLabel": MessageLookupByLibrary.simpleMessage("Raison"),
    "visitCreationReasonPlaceholder": MessageLookupByLibrary.simpleMessage(
      "Entrez la raison de la visite",
    ),
    "visitCreationSuccessDescription": MessageLookupByLibrary.simpleMessage(
      "Votre visite a été créée avec succès. Vous pouvez maintenant consulter et gérer vos visites.",
    ),
    "visitCreationSuccessTitle": MessageLookupByLibrary.simpleMessage(
      "Visite créée avec succès",
    ),
    "visitCreationTitle": MessageLookupByLibrary.simpleMessage(
      "Nouvelle visite",
    ),
    "visitDate": MessageLookupByLibrary.simpleMessage("Date de la visite"),
    "visitDatePlaceholder": MessageLookupByLibrary.simpleMessage(
      "Sélectionner la date de la visite",
    ),
    "visitDateRequired": MessageLookupByLibrary.simpleMessage(
      "La date de la visite est requise",
    ),
    "visitDetailsTitle": MessageLookupByLibrary.simpleMessage(
      "Détails de la visite",
    ),
    "visitErrorDate": MessageLookupByLibrary.simpleMessage(
      "La date doit être après la date du plan de tournee",
    ),
    "visitFieldConnaissanceProduit": MessageLookupByLibrary.simpleMessage(
      "Connaissance du produit",
    ),
    "visitFieldFonction": MessageLookupByLibrary.simpleMessage("Fonction"),
    "visitFieldMedecinTraitant": MessageLookupByLibrary.simpleMessage(
      "Médecin traitant",
    ),
    "visitFieldNomInterlocuteur": MessageLookupByLibrary.simpleMessage(
      "Nom de l\'interlocuteur",
    ),
    "visitFieldObjections": MessageLookupByLibrary.simpleMessage("Objections"),
    "visitFieldPatientConnaissanceProduit":
        MessageLookupByLibrary.simpleMessage(
          "Connaissance du produit (patient)",
        ),
    "visitFieldPotentiel": MessageLookupByLibrary.simpleMessage("Potentiel"),
    "visitFieldPrescripteur": MessageLookupByLibrary.simpleMessage(
      "Prescripteur",
    ),
    "visitFieldPrescriptionDetails": MessageLookupByLibrary.simpleMessage(
      "Détails de l\'ordonnance",
    ),
    "visitFieldProduitConcurrent": MessageLookupByLibrary.simpleMessage(
      "Produit concurrent",
    ),
    "visitFieldPromessePrescription": MessageLookupByLibrary.simpleMessage(
      "Promesse de prescription",
    ),
    "visitFieldReceptionPrescription": MessageLookupByLibrary.simpleMessage(
      "Réception d\'ordonnance",
    ),
    "visitFieldResultatTest": MessageLookupByLibrary.simpleMessage(
      "Résultat du test",
    ),
    "visitFieldSpecialiteMedecin": MessageLookupByLibrary.simpleMessage(
      "Spécialité du médecin",
    ),
    "visitFieldTesteProduit": MessageLookupByLibrary.simpleMessage(
      "Produit testé",
    ),
    "visitFieldTypeDiabete": MessageLookupByLibrary.simpleMessage(
      "Type de diabète",
    ),
    "visitHintConnaissanceProduit": MessageLookupByLibrary.simpleMessage(
      "Le contact connaît-il le produit ?",
    ),
    "visitHintFonction": MessageLookupByLibrary.simpleMessage(
      "Saisir la fonction de l\'interlocuteur",
    ),
    "visitHintMedecinTraitant": MessageLookupByLibrary.simpleMessage(
      "Nom du médecin traitant",
    ),
    "visitHintNomInterlocuteur": MessageLookupByLibrary.simpleMessage(
      "Saisir le nom de l\'interlocuteur",
    ),
    "visitHintObjections": MessageLookupByLibrary.simpleMessage(
      "Noter les objections soulevées",
    ),
    "visitHintPatientConnaissanceProduit": MessageLookupByLibrary.simpleMessage(
      "Le patient connaît-il le produit ?",
    ),
    "visitHintPotentiel": MessageLookupByLibrary.simpleMessage(
      "Indiquer le niveau de potentiel",
    ),
    "visitHintPrescripteur": MessageLookupByLibrary.simpleMessage(
      "Le contact est-il prescripteur ?",
    ),
    "visitHintPrescriptionDetails": MessageLookupByLibrary.simpleMessage(
      "Décrire les détails de l\'ordonnance",
    ),
    "visitHintProduitConcurrent": MessageLookupByLibrary.simpleMessage(
      "Mentionner un produit concurrent",
    ),
    "visitHintPromessePrescription": MessageLookupByLibrary.simpleMessage(
      "Promesse de prescription ?",
    ),
    "visitHintReceptionPrescription": MessageLookupByLibrary.simpleMessage(
      "Une ordonnance a-t-elle été reçue ?",
    ),
    "visitHintResultatTest": MessageLookupByLibrary.simpleMessage(
      "Saisir le résultat du test",
    ),
    "visitHintSpecialiteMedecin": MessageLookupByLibrary.simpleMessage(
      "Spécialité du médecin",
    ),
    "visitHintTesteProduit": MessageLookupByLibrary.simpleMessage(
      "Le produit a-t-il été testé ?",
    ),
    "visitHintTypeDiabete": MessageLookupByLibrary.simpleMessage(
      "Type de diabète",
    ),
    "visitPrivilegeMissing": MessageLookupByLibrary.simpleMessage(
      "Vous n\'avez pas le privilège de créer une visite",
    ),
    "visitResultLabel": MessageLookupByLibrary.simpleMessage(
      "Résultat de la visite",
    ),
    "visitTourIsntOpen": MessageLookupByLibrary.simpleMessage(
      "La visite n\'est pas ouverte",
    ),
    "visitValidationClient": MessageLookupByLibrary.simpleMessage("Client"),
    "visitValidationRapport": MessageLookupByLibrary.simpleMessage("Rapport"),
    "visitValidationReason": MessageLookupByLibrary.simpleMessage("Raison"),
    "visitValidationTitle": MessageLookupByLibrary.simpleMessage(
      "Aperçu et validation",
    ),
    "visitValidationVisitedAt": MessageLookupByLibrary.simpleMessage(
      "Visité le",
    ),
    "visitsEmpty": MessageLookupByLibrary.simpleMessage(
      "Aucune visite trouvée",
    ),
    "visitsEmptyDescription": MessageLookupByLibrary.simpleMessage(
      "Vous n\'avez encore aucune visite",
    ),
    "visitsToday": MessageLookupByLibrary.simpleMessage("Visites aujourd\'hui"),
    "waitingForDecision": MessageLookupByLibrary.simpleMessage(
      "En attente de décision",
    ),
    "yesLabel": MessageLookupByLibrary.simpleMessage("Oui"),
    "youDontHaveAnyHirement": MessageLookupByLibrary.simpleMessage(
      "Vous n\'avez encore aucun recrutement",
    ),
  };
}
