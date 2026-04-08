import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:ff_commons/flutter_flow/lat_lng.dart';
import 'package:ff_commons/flutter_flow/place.dart';
import 'package:ff_commons/flutter_flow/uploaded_file.dart';
import '/backend/schema/structs/index.dart';

/// Capitalizes the first letter of a string.
String? capitalize(String? text) {
  // Check if the input is null or an empty/whitespace-only string
  if (text == null || text.trim().isEmpty) return text;

  // Trim leading and trailing whitespace to ensure proper capitalization
  text = text.trim();

  // Capitalize the first character and append the rest of the string unchanged
  return '${text[0].toUpperCase()}${text.substring(1)}';
}

/// Truncates a string with an ellipsis if it exceeds the specified length.
String truncate(
  String text,
  int length,
) {
// Ensure the length is valid
  if (length <= 0) return '...';

  // If the text is already within the length limit, return it as is
  if (text.length <= length) return text;

  // Truncate the string and append the ellipsis
  return '${text.substring(0, length)}...';
}

/// Returns true if the given DateTime falls on a Saturday or Sunday.
bool isWeekend(DateTime date) {
  // Get the day of the week (Sunday = 7, Saturday = 6)
  int day = date.weekday;

  // Return true if it's Saturday (6) or Sunday (7)
  return day == DateTime.saturday || day == DateTime.sunday;
}

/// Get the symbol for the popular currency strings.
String getCurrencySymbol(String currency) {
  const currencySymbols = {
    'USD': '\$',
    'EUR': '€',
    'GBP': '£',
    'INR': '₹',
    'JPY': '¥',
    'AUD': 'A\$',
    'CAD': 'C\$',
    'CHF': 'CHF',
    'CNY': '¥',
    'KRW': '₩'
  };

  // Return the matching symbol or default to the currency code itself
  return currencySymbols[currency.toUpperCase()] ?? currency;
}

/// Formats a number as currency.
String formatCurrency(
  double amount,
  String currency,
) {
// Create a NumberFormat instance with the currency symbol
  final format = NumberFormat.currency(
      locale: 'en_US', symbol: getCurrencySymbol(currency));

  // Format the amount as currency
  return format.format(amount);
}

/// base64 String to String
String convertBase64ToString(String base64Text) {
  return utf8.decode(base64Decode(base64Text));
}

String convertStringToBase64(String text) {
  return base64Encode(utf8.encode(text));
}

String? convertVideoPathToString(String? videoPath) {
  return videoPath;
}

String? convertStringToImagePath(String? imageUrl) {
  return imageUrl;
}

/// Gets the first letter of the name (string).
///
/// Useful for usernames.
String getUserFirstLetter(String name) {
  if (name.isEmpty) return '';
  return name.trim().substring(0, 1).toUpperCase();
}

String? convertStringToVideoPath(String? videoUrl) {
  return videoUrl;
}

/// Converts a Firebase Storage HTTP URL into a gs:// URI by extracting the
/// bucket name and decoding the file path.
String getGsUri(String storageUrl) {
  Uri uri = Uri.parse(storageUrl);

  // Ensure it's a Firebase Storage URL
  if (!uri.host.contains("firebasestorage.googleapis.com")) {
    throw ArgumentError("Invalid Firebase Storage URL");
  }

  // Extract bucket name from the path
  String bucketName =
      uri.pathSegments[2]; // This is your Firebase project storage bucket
  String encodedFilePath = uri.pathSegments[4]; // The encoded path
  String filePath = Uri.decodeComponent(encodedFilePath); // Decode %2F to /

  // Construct gs:// URI
  String gsUri = "gs://$bucketName/$filePath";
  print('gs:// URI: $gsUri');
  return gsUri;
}

/// Increments count for null integers as well.
int countIncrementWithNullSafety(int? count) {
  return (count == null || count == 0) ? 1 : count + 1;
}

/// Counts the number of true values in a given list of booleans, returning
/// null if the list is empty or null.
int? countBoolsTrue(List<bool>? bools) {
  /// Counts the number of `true` values in a given boolean list.
  /// Returns `null` if the input list is `null` or empty.

  if (bools == null || bools.isEmpty) return null;

  // Use `where` and `length` for a concise count of `true` values.
  return bools.where((b) => b).length;
}

/// Extracts and returns a list of emails from a comma- or newline-separated
/// string, removing whitespace and empty entries.
List<String>? extractEmailsToList(String? emailInput) {
  /// Extracts emails from a comma- or newline-separated string,
  /// trims whitespace, and removes empty entries.

  if (emailInput == null || emailInput.trim().isEmpty) return null;

  return emailInput
      .split(RegExp(r'[,\n]')) // Split by commas or new lines
      .map((email) => email.trim()) // Trim each email
      .where((email) => email.isNotEmpty) // Remove empty strings
      .toList();
}

/// Returns a DateTime representing the given number of hours subtracted from
/// the current time.
DateTime hourAgo(
  DateTime currentTime,
  int hour,
) {
  return currentTime.subtract(Duration(hours: hour));
}

String? convertImagePathToString(String? imagePath) {
  return imagePath;
}

/// Parse JSON to String
String? jsonToString(dynamic jsonValue) {
// Turn arbitrary json to a string
  try {
    final jsonString = json.encode(jsonValue);
    return jsonString;
  } catch (e) {
    print('Error converting json to string: $e');
    return null;
  }
}

/// Check if both lists contain the same elements, regardless of order.
///
/// Returns `true` if both lists are equal, `false` otherwise. If either list
/// is `null`, returns `false`.
bool? areListsEqual(
  List<String>? list1,
  List<String>? list2,
) {
  /// Check if both lists contain the same elements, regardless of order.
  /// Returns `true` if both lists are equal, `false` otherwise.
  /// If either list is `null`, returns `false`.

  // If either list is null, they are not equal.
  if (list1 == null || list2 == null) {
    return false;
  }

  // If lists have different lengths, they cannot be equal.
  if (list1.length != list2.length) {
    return false;
  }

  // Convert lists to sets to ignore order and remove duplicates.
  final set1 = Set<String>.from(list1);
  final set2 = Set<String>.from(list2);

  // Compare sets: If they have the same elements, they are equal.
  return set1.difference(set2).isEmpty && set2.difference(set1).isEmpty;
}

/// Checks if a given DateTime is older than the specified number of days from
/// today, returning false if input is nulll
bool? olderThanXDays(
  DateTime? referenceDate,
  int? daysThreshold,
) {
  /// Returns `true` if `referenceDate` is more than `daysThreshold` days old.
  /// Returns `false` if either `referenceDate` or `daysThreshold` is `null`.

  if (referenceDate == null || daysThreshold == null) return false;

  return DateTime.now().difference(referenceDate).inDays > daysThreshold;
}

/// Return the first day of the current month.
DateTime? returnStartofMonth() {
  /// Returns a `DateTime` representing the first day of the current month at midnight.

  DateTime now = DateTime.now();
  return DateTime(now.year, now.month, 1);
}

/// Converts newline characters (\n) to <br> and supports bold (**bold** →
/// <b>bold<b>) and italic (*italic* → <i>italic<i>) formatting.
String? richTextToHtml(String? richText) {
  /// Converts rich text to an HTML-formatted string.
  /// Supports:
  /// - Newlines (`\n`) → `<br>`
  /// - Bold (`**bold**`) → `<b>bold</b>`
  /// - Italic (`*italic*`) → `<i>italic</i>`
  /// Returns `null` if input is `null`.

  if (richText == null) return null;

  return richText
      .replaceAll('\n', '<br>') // Convert new lines
      .replaceAllMapped(RegExp(r'\*\*(.*?)\*\*'),
          (match) => '<b>${match.group(1)}</b>') // Bold
      .replaceAllMapped(RegExp(r'\*(.*?)\*'),
          (match) => '<i>${match.group(1)}</i>'); // Italic
}

/// Returns a DateTime shifted by the specified number of days from today, or
/// null if numDays is null.
DateTime? shiftDateDays(int? numDays) {
  // Add or subtract days from a date (given positive or negative numDays)
  if (numDays == null) return null;
  final now = DateTime.now();
  final shiftedDate = now.add(Duration(days: numDays));
  return shiftedDate;
}

/// Allows checking if any date in a list falls within a specified number of
/// past days.
///
/// E.g checking invoices that were due in past 7 days
bool hasRecentDate(
  List<DateTime> dates,
  int daysThreshold,
) {
  /// Returns `true` if any date in `dates` falls within the last `daysThreshold` days.
  /// Ensures `daysThreshold` is positive and handles empty lists.

  if (dates.isEmpty || daysThreshold <= 0) return false;

  final now = DateTime.now();
  final thresholdDate = now.subtract(Duration(days: daysThreshold));

  return dates.any((date) => date.isAfter(thresholdDate));
}

/// Checks if the difference between two DateTime values is at least one week
/// (7 days).
bool isMoreThanWeek(
  DateTime oldTime,
  DateTime newTime,
) {
  /// Returns `true` if `newTime` is at least 7 days after `oldTime`.

  return newTime.difference(oldTime).inDays >= 7;
}

String? convertAudioPathToString(String? audioPath) {
  return audioPath.toString();
}

String? convertStringToAudioPath(String? audioUrl) {
  return audioUrl;
}

String encodeUrl(String url) {
  return Uri.encodeFull(url);
}

/// Get JSON Object from String.
dynamic jsonDecode(String? jsonString) {
  if (jsonString == null) return null;
  try {
    return json.decode(jsonString);
  } catch (e) {
    print('Error decoding JSON: $e and jsonString: $jsonString');
    return null;
  }
}

/// Merges corresponding first and last names into a list of full names
List<String>? combineName(
  List<String>? firstName,
  List<String>? lastName,
) {
  /// Merges corresponding first and last names into a list of full names
  /// Combines first and last names into full names.
  /// If one list is shorter, missing values are replaced with an empty string.

  if (firstName == null || lastName == null) return null;

  int maxLength =
      firstName.length > lastName.length ? firstName.length : lastName.length;

  return List<String>.generate(
    maxLength,
    (i) {
      String fName = i < firstName.length ? firstName[i] : "";
      String lName = i < lastName.length ? lastName[i] : "";
      return "$fName $lName".trim();
    },
  );
}

/// Checks if a given DateTime is more than one day old, returning true if it
/// is null or older than 24 hours.
bool isDateOlderThanOneDay(DateTime? lastDateTime) {
  /// Returns `true` if the given `DateTime` is older than 24 hours or `null`.

  if (lastDateTime == null) return true;

  return lastDateTime.isBefore(DateTime.now().subtract(Duration(days: 1)));
}

/// Allows checking if any date in a list falls within a specified number of
/// past days.
///
/// E.g checking for upcoming deadlines etc.
bool hasUpcomingDate(
  List<DateTime> dates,
  int daysThreshold,
) {
  /// Returns `true` if any date in `dates` falls within the next `daysThreshold` days.
  /// Ensures `daysThreshold` is positive and handles empty lists.

  if (dates.isEmpty || daysThreshold <= 0) return false;

  final now = DateTime.now();
  final futureThresholdDate = now.add(Duration(days: daysThreshold));

  return dates
      .any((date) => date.isAfter(now) && date.isBefore(futureThresholdDate));
}

double convertStringToDouble(String amount) {
  return double.parse(amount);
}

String convertBytesToBase64(FFUploadedFile file) {
  if (file.bytes == null) {
    throw ArgumentError("File bytes cannot be null.");
  }

  return base64Encode(file.bytes!);
}

String decodeUtf8(String input) {
  try {
    return utf8.decode(input.runes.toList());
  } catch (e) {
    return input; // Return the original input if decoding fails
  }
}

/// Returns the emoji flag for a given ISO 3166-1 alpha-2 country code.
String getCountryFlag(String countryCode) {
  if (countryCode.length != 2) {
    throw ArgumentError('Country code must be 2 letters (ISO 3166-1 alpha-2).');
  }

  // Convert country code to uppercase
  countryCode = countryCode.toUpperCase();

  // Convert ASCII characters to regional indicator symbols (A=🇦, B=🇧, etc.)
  return String.fromCharCodes(
    countryCode.codeUnits.map((char) => char + 0x1F1E6 - 65),
  );
}

String stringTrim(String str) {
  return str.trim();
}

/// Returns a list of country details, including ISO codes, names, and flag
/// emojis (as a JSON list)
dynamic getAllCountryList() {
  // Gets all 195 countries
  return [
    {"code": "AF", "name": "Afghanistan", "flag": getCountryFlag("AF")},
    {"code": "AL", "name": "Albania", "flag": getCountryFlag("AL")},
    {"code": "DZ", "name": "Algeria", "flag": getCountryFlag("DZ")},
    {"code": "AD", "name": "Andorra", "flag": getCountryFlag("AD")},
    {"code": "AO", "name": "Angola", "flag": getCountryFlag("AO")},
    {"code": "AR", "name": "Argentina", "flag": getCountryFlag("AR")},
    {"code": "AM", "name": "Armenia", "flag": getCountryFlag("AM")},
    {"code": "AU", "name": "Australia", "flag": getCountryFlag("AU")},
    {"code": "AT", "name": "Austria", "flag": getCountryFlag("AT")},
    {"code": "AZ", "name": "Azerbaijan", "flag": getCountryFlag("AZ")},
    {"code": "BH", "name": "Bahrain", "flag": getCountryFlag("BH")},
    {"code": "BD", "name": "Bangladesh", "flag": getCountryFlag("BD")},
    {"code": "BY", "name": "Belarus", "flag": getCountryFlag("BY")},
    {"code": "BE", "name": "Belgium", "flag": getCountryFlag("BE")},
    {"code": "BZ", "name": "Belize", "flag": getCountryFlag("BZ")},
    {"code": "BJ", "name": "Benin", "flag": getCountryFlag("BJ")},
    {"code": "BO", "name": "Bolivia", "flag": getCountryFlag("BO")},
    {"code": "BR", "name": "Brazil", "flag": getCountryFlag("BR")},
    {"code": "BG", "name": "Bulgaria", "flag": getCountryFlag("BG")},
    {"code": "CA", "name": "Canada", "flag": getCountryFlag("CA")},
    {"code": "CN", "name": "China", "flag": getCountryFlag("CN")},
    {"code": "CO", "name": "Colombia", "flag": getCountryFlag("CO")},
    {"code": "HR", "name": "Croatia", "flag": getCountryFlag("HR")},
    {"code": "CU", "name": "Cuba", "flag": getCountryFlag("CU")},
    {"code": "CY", "name": "Cyprus", "flag": getCountryFlag("CY")},
    {"code": "CZ", "name": "Czech Republic", "flag": getCountryFlag("CZ")},
    {"code": "DK", "name": "Denmark", "flag": getCountryFlag("DK")},
    {"code": "EG", "name": "Egypt", "flag": getCountryFlag("EG")},
    {"code": "EE", "name": "Estonia", "flag": getCountryFlag("EE")},
    {"code": "FI", "name": "Finland", "flag": getCountryFlag("FI")},
    {"code": "FR", "name": "France", "flag": getCountryFlag("FR")},
    {"code": "DE", "name": "Germany", "flag": getCountryFlag("DE")},
    {"code": "GR", "name": "Greece", "flag": getCountryFlag("GR")},
    {"code": "HU", "name": "Hungary", "flag": getCountryFlag("HU")},
    {"code": "IN", "name": "India", "flag": getCountryFlag("IN")},
    {"code": "ID", "name": "Indonesia", "flag": getCountryFlag("ID")},
    {"code": "IR", "name": "Iran", "flag": getCountryFlag("IR")},
    {"code": "IQ", "name": "Iraq", "flag": getCountryFlag("IQ")},
    {"code": "IE", "name": "Ireland", "flag": getCountryFlag("IE")},
    {"code": "IL", "name": "Israel", "flag": getCountryFlag("IL")},
    {"code": "IT", "name": "Italy", "flag": getCountryFlag("IT")},
    {"code": "JP", "name": "Japan", "flag": getCountryFlag("JP")},
    {"code": "JO", "name": "Jordan", "flag": getCountryFlag("JO")},
    {"code": "KZ", "name": "Kazakhstan", "flag": getCountryFlag("KZ")},
    {"code": "KE", "name": "Kenya", "flag": getCountryFlag("KE")},
    {"code": "KW", "name": "Kuwait", "flag": getCountryFlag("KW")},
    {"code": "LV", "name": "Latvia", "flag": getCountryFlag("LV")},
    {"code": "LB", "name": "Lebanon", "flag": getCountryFlag("LB")},
    {"code": "LT", "name": "Lithuania", "flag": getCountryFlag("LT")},
    {"code": "LU", "name": "Luxembourg", "flag": getCountryFlag("LU")},
    {"code": "MY", "name": "Malaysia", "flag": getCountryFlag("MY")},
    {"code": "MX", "name": "Mexico", "flag": getCountryFlag("MX")},
    {"code": "NL", "name": "Netherlands", "flag": getCountryFlag("NL")},
    {"code": "NZ", "name": "New Zealand", "flag": getCountryFlag("NZ")},
    {"code": "NG", "name": "Nigeria", "flag": getCountryFlag("NG")},
    {"code": "NO", "name": "Norway", "flag": getCountryFlag("NO")},
    {"code": "PK", "name": "Pakistan", "flag": getCountryFlag("PK")},
    {"code": "PH", "name": "Philippines", "flag": getCountryFlag("PH")},
    {"code": "PL", "name": "Poland", "flag": getCountryFlag("PL")},
    {"code": "PT", "name": "Portugal", "flag": getCountryFlag("PT")},
    {"code": "RU", "name": "Russia", "flag": getCountryFlag("RU")},
    {"code": "SA", "name": "Saudi Arabia", "flag": getCountryFlag("SA")},
    {"code": "SG", "name": "Singapore", "flag": getCountryFlag("SG")},
    {"code": "ZA", "name": "South Africa", "flag": getCountryFlag("ZA")},
    {"code": "KR", "name": "South Korea", "flag": getCountryFlag("KR")},
    {"code": "ES", "name": "Spain", "flag": getCountryFlag("ES")},
    {"code": "SE", "name": "Sweden", "flag": getCountryFlag("SE")},
    {"code": "CH", "name": "Switzerland", "flag": getCountryFlag("CH")},
    {"code": "TR", "name": "Turkey", "flag": getCountryFlag("TR")},
    {"code": "UA", "name": "Ukraine", "flag": getCountryFlag("UA")},
    {
      "code": "AE",
      "name": "United Arab Emirates",
      "flag": getCountryFlag("AE")
    },
    {"code": "GB", "name": "United Kingdom", "flag": getCountryFlag("GB")},
    {"code": "US", "name": "United States", "flag": getCountryFlag("US")},
    {"code": "VN", "name": "Vietnam", "flag": getCountryFlag("VN")},
  ];
}

/// Decrements count for null integers as well.
int countDecrementWithNullSafety(int? count) {
  /// Returns `count - 1`, ensuring `null` becomes `0` and `0` remains `0`.

  return (count == null || count == 0) ? 0 : count - 1;
}

/// Adds the specified duration (minutes, hours, days, weeks, months, years)
/// to a DateTime, handling null values and month-overflow adjustments.
///
/// Works for subtraction as well, just provide a negative value.
DateTime? dateAddDuration(
  DateTime? date,
  int? minutes,
  int? hours,
  int? days,
  int? weeks,
  int? months,
  int? years,
) {
  /// Adds the specified duration to a `DateTime`, supporting minutes, hours, days, weeks, months, and years.
  /// If any parameter is `null`, it defaults to `0`. Returns `null` if `date` is `null`.

  if (date == null) return null;

  // Apply immediate duration-based additions
  date = date.add(Duration(
    minutes: minutes ?? 0,
    hours: hours ?? 0,
    days: (days ?? 0) + ((weeks ?? 0) * 7),
  ));

  // Handle months and years separately (due to variable days in months)
  // If months or years are specified, adjust them separately
  if ((months ?? 0) != 0 || (years ?? 0) != 0) {
    int newYear = date.year + (years ?? 0);
    int newMonth = date.month + (months ?? 0);

    // Adjust for year overflow
    while (newMonth > 12) {
      newMonth -= 12;
      newYear++;
    }
    while (newMonth < 1) {
      newMonth += 12;
      newYear--;
    }

    // Ensure valid day in the target month (e.g., Feb 30 → Feb 28)
    int maxDaysInMonth = DateTime(newYear, newMonth + 1, 0).day;
    int newDay = date.day > maxDaysInMonth ? maxDaysInMonth : date.day;

    date = DateTime(
      newYear,
      newMonth,
      newDay,
      date.hour,
      date.minute,
      date.second,
      date.millisecond,
      date.microsecond,
    );
  }

  return date;
}

/// base64 string to FFUploadedFile
FFUploadedFile? convertBase64ToFile(String base64Str) {
  if (base64Str.isEmpty) return null; // Handle empty string

  final bytes = base64Decode(base64Str);
  return FFUploadedFile(bytes: bytes);
}

/// Checks if a given string is a valid URL by ensuring it has a scheme (http,
/// https) and a domain authority.
bool isValidUrl(String url) {
  /// Validates if the given string is a properly formatted URL.
  /// Returns `true` if it has a valid scheme (http, https, etc.) and a domain.

  final Uri? uri = Uri.tryParse(url);

  return uri != null && uri.hasScheme && uri.hasAuthority;
}

/// Calculates the discounted price by applying a percentage discount to the
/// original price, ensuring the discount is within valid limits.
double applyDiscount(
  double price,
  double discountPercent,
) {
  if (discountPercent < 0 || discountPercent > 100) {
    throw ArgumentError("Discount percentage must be between 0 and 100.");
  }
  return price - (price * discountPercent / 100);
}

/// Calculates the tax amount based on a given price and tax percentage.
double calculateTax(
  double price,
  double taxPercent,
) {
  return price * (taxPercent / 100);
}

/// Rounds a double to the specified number of decimal places, ensuring
/// non-negative precision.
double roundToDecimals(
  double value,
  int decimals,
) {
  if (decimals < 0) {
    throw ArgumentError("Decimal places must be non-negative.");
  }
  return double.parse(value.toStringAsFixed(decimals));
}

/// Convert double to int and use 'round', 'floor', 'ceil', or 'truncate' as
/// method
int convertDoubleToInt(
  double value,
  String method,
) {
  switch (method.toLowerCase()) {
    case "round":
      return value.round();
    case "floor":
      return value.floor();
    case "ceil":
      return value.ceil();
    case "truncate":
      return value.truncate();
    default:
      throw ArgumentError(
          "Invalid method. Use 'round', 'floor', 'ceil', or 'truncate'.");
  }
}

double convertIntToDouble(int value) {
  return value.toDouble();
}

int? convertStringToInt(String value) {
  return int.tryParse(value);
}

String? stringToUpperCase(String? text) {
  return text?.toUpperCase();
}

DateTime? convertStringToDateTime(String dateString) {
  try {
    return DateTime.parse(dateString); // Works for ISO 8601 formatted strings
  } catch (e) {
    return null; // Return null if parsing fails
  }
}

String? stringToLowerCase(String? text) {
  return text?.toLowerCase();
}

/// Extracts and returns the domain from a valid email address, or null if the
/// input is invalid.
String? extractDomainFromEmail(String? email) {
  // If invalid email
  if (email == null || !email.contains('@')) {
    return null;
  }

  // Check if more than one @ symbol in email
  List<String> parts = email.split('@');
  if (parts.length != 2) {
    return null;
  }

  return parts[1].toLowerCase();
}

/// Checks if the uploaded file has valid, non null, non zero bytes.
bool isUploadedFileValid(FFUploadedFile? uploadedFile) {
  /// Returns true if the uploaded file has non-null and non-empty bytes.
  final bytes = uploadedFile?.bytes;
  return bytes != null && bytes.isNotEmpty;
}

/// Adds upto 3 integers
int addIntegers(
  int intA,
  int intB,
  int? intC,
) {
  /// Returns the sum of two integers.
  return intA + intB + (intC ?? 0);
}

double convertKmsToMiles(double kmsValue) {
  // convert Km To Miles
  return kmsValue * 0.621371;
}

/// Returns a normalized progress value (0.0 - 1.0) from `completed / total`
double calculateProgressRatio(
  int completed,
  int total,
) {
  /// Returns a normalized progress value (0.0 - 1.0) from `completed / total`.
  /// Ensures the value stays within bounds to prevent overflow.

  if (total <= 0) return 0.0; // Avoid division by zero

  return (completed / total).clamp(0.0, 1.0);
}

/// Calculates percentage (0-100%) from `completed / total`.
double calculatePercentage(
  int completed,
  int total,
) {
  /// Calculates percentage (0-100%) from `completed / total`.
  /// Prevents division by zero and clamps the result between 0 and 100.

  if (total <= 0) return 0.0; // Avoid division by zero

  return ((completed / total) * 100).clamp(0.0, 100.0);
}

bool getBoolOrDefault(
  bool? value,
  bool? defaultValue,
) {
  /// Returns `value` if it's not null, otherwise returns `defaultValue` (default: `false`).
  return value ?? defaultValue ?? false;
}

int getPreviousIndex(int index) {
  /// Returns `index - 1`, but never less than 0.
  return (index > 0) ? index - 1 : 0;
}

/// Returns the result of `numA - numB`.
double subtractTwoIntegers(
  double numA,
  double numB,
) {
  /// Returns the result of `numA - numB`.
  return numA - numB;
}

/// Returns the length of the string.
///
/// If `value` is null, returns 0
int getStrLength(String? str) {
  /// Returns the length of the string.
  /// If `value` is null, returns 0.
  return str?.length ?? 0;
}
