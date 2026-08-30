/// Normalizes a string for comparison by converting diacritic characters
/// to their base Latin equivalents and stripping combining marks.
///
/// This handles both NFC (precomposed, e.g., Ï = Ï) and
/// NFD (decomposed, e.g., I + ̈ = Ï) Unicode forms, ensuring
/// that visually identical strings compare equal regardless of how
/// they were encoded by the API.
String normalizeForComparison(String s) {
  const diacriticMap = {
    // Uppercase
    'À': 'A', 'Á': 'A', 'Â': 'A', 'Ã': 'A', 'Ä': 'A', 'Å': 'A', 'Ā': 'A',
    'Ă': 'A', 'Ą': 'A',
    'È': 'E', 'É': 'E', 'Ê': 'E', 'Ë': 'E', 'Ē': 'E', 'Ĕ': 'E', 'Ė': 'E',
    'Ę': 'E', 'Ě': 'E',
    'Ì': 'I', 'Í': 'I', 'Î': 'I', 'Ï': 'I', 'Ĩ': 'I', 'Ī': 'I', 'Ĭ': 'I',
    'Į': 'I', 'İ': 'I',
    'Ò': 'O', 'Ó': 'O', 'Ô': 'O', 'Õ': 'O', 'Ö': 'O', 'Ō': 'O', 'Ŏ': 'O',
    'Ő': 'O',
    'Ù': 'U', 'Ú': 'U', 'Û': 'U', 'Ü': 'U', 'Ũ': 'U', 'Ū': 'U', 'Ŭ': 'U',
    'Ů': 'U', 'Ű': 'U', 'Ų': 'U',
    'Ý': 'Y', 'Ÿ': 'Y', 'Ŷ': 'Y',
    'Ñ': 'N', 'Ń': 'N', 'Ņ': 'N', 'Ň': 'N', 'Ŋ': 'N',
    'Ç': 'C', 'Ć': 'C', 'Ĉ': 'C', 'Ċ': 'C', 'Č': 'C',
    'Ś': 'S', 'Ŝ': 'S', 'Ş': 'S', 'Š': 'S',
    'Ź': 'Z', 'Ż': 'Z', 'Ž': 'Z',
    'Ǎ': 'A', 'Ǐ': 'I', 'Ǒ': 'O', 'Ǔ': 'U',
    'Ǟ': 'A', 'Ǡ': 'A', 'Ǻ': 'A',
    'Ǽ': 'AE', 'Ǿ': 'O',
    'Ȁ': 'A', 'Ȃ': 'A', 'Ȅ': 'E', 'Ȇ': 'E', 'Ȉ': 'I', 'Ȋ': 'I',
    'Ȍ': 'O', 'Ȏ': 'O', 'Ȑ': 'R', 'Ȓ': 'R', 'Ȕ': 'U', 'Ȗ': 'U',
    'Ḁ': 'A', 'Ḅ': 'B', 'Ḍ': 'D', 'Ḏ': 'D', 'Ḥ': 'H', 'Ḳ': 'K',
    'Ḷ': 'L', 'Ḹ': 'L', 'Ṃ': 'M', 'Ṇ': 'N', 'Ṛ': 'R', 'Ṝ': 'R',
    'Ṣ': 'S', 'Ṭ': 'T', 'Ṷ': 'V', 'Ẁ': 'W', 'Ẓ': 'Z',
    // Lowercase
    'à': 'a', 'á': 'a', 'â': 'a', 'ã': 'a', 'ä': 'a', 'å': 'a', 'ā': 'a',
    'ă': 'a', 'ą': 'a',
    'è': 'e', 'é': 'e', 'ê': 'e', 'ë': 'e', 'ē': 'e', 'ĕ': 'e', 'ė': 'e',
    'ę': 'e', 'ě': 'e',
    'ì': 'i', 'í': 'i', 'î': 'i', 'ï': 'i', 'ĩ': 'i', 'ī': 'i', 'ĭ': 'i',
    'į': 'i', 'ı': 'i',
    'ò': 'o', 'ó': 'o', 'ô': 'o', 'õ': 'o', 'ö': 'o', 'ō': 'o', 'ŏ': 'o',
    'ő': 'o',
    'ù': 'u', 'ú': 'u', 'û': 'u', 'ü': 'u', 'ũ': 'u', 'ū': 'u', 'ŭ': 'u',
    'ů': 'u', 'ű': 'u', 'ų': 'u',
    'ý': 'y', 'ÿ': 'y', 'ŷ': 'y',
    'ñ': 'n', 'ń': 'n', 'ņ': 'n', 'ň': 'n', 'ŋ': 'n',
    'ç': 'c', 'ć': 'c', 'ĉ': 'c', 'ċ': 'c', 'č': 'c',
    'ś': 's', 'ŝ': 's', 'ş': 's', 'š': 's',
    'ź': 'z', 'ż': 'z', 'ž': 'z',
    'ǎ': 'a', 'ǐ': 'i', 'ǒ': 'o', 'ǔ': 'u',
    'ǟ': 'a', 'ǡ': 'a', 'ǻ': 'a',
    'ǽ': 'ae', 'ǿ': 'o',
    'ȁ': 'a', 'ȃ': 'a', 'ȅ': 'e', 'ȇ': 'e', 'ȉ': 'i', 'ȋ': 'i',
    'ȍ': 'o', 'ȏ': 'o', 'ȑ': 'r', 'ȓ': 'r', 'ȕ': 'u', 'ȗ': 'u',
    'ḁ': 'a', 'ḅ': 'b', 'ḍ': 'd', 'ḏ': 'd', 'ḥ': 'h', 'ḳ': 'k',
    'ḷ': 'l', 'ḹ': 'l', 'ṃ': 'm', 'ṇ': 'n', 'ṛ': 'r', 'ṝ': 'r',
    'ṣ': 's', 'ṭ': 't', 'ṽ': 'v', 'ẁ': 'w', 'ẓ': 'z',
    // Ligatures
    'Æ': 'AE', 'æ': 'ae', 'Œ': 'OE', 'œ': 'oe',
    'ß': 'ss',
  };

  // First lowercase, then map diacritics to base chars
  final lowered = s.toLowerCase();
  final result = <int>[];

  for (int i = 0; i < lowered.length; i++) {
    final char = lowered[i];
    final mapped = diacriticMap[char] ?? char;
    result.addAll(mapped.codeUnits);
  }

  // Strip any remaining standalone combining diacritical marks
  // (handles NFD decomposed forms where base char + combining mark are separate)
  return String.fromCharCodes(
    result.where((c) => c < 0x0300 || c > 0x036F).toList(),
  );
}
