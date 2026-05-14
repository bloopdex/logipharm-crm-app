import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MoneyHelper {
  static String format(BuildContext context, double amount) {
    final String locale = Localizations.localeOf(context).toLanguageTag();
    final NumberFormat formatter = NumberFormat.decimalPattern(locale)
      ..minimumFractionDigits = 2
      ..maximumFractionDigits = 2;
    final String formattedAmount = formatter.format(amount);

    final String formattedCurrency = getFormattedCurrency(locale);
    return '$formattedAmount $formattedCurrency';
  }

  static String getFormattedCurrency(String locale) {
    final String normalizedLocale = locale.toLowerCase();
    if (normalizedLocale.startsWith('ar')) {
      return 'دج';
    }

    return 'Da';
  }
}
