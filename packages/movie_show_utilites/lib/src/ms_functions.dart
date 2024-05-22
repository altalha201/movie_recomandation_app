import 'dart:math';

import 'package:intl/intl.dart';

class MSFunctions {
  const MSFunctions();

  static int getAgeFromDate(String dateString) {
    final DateFormat dateFormat = DateFormat('MMM dd, yyyy');
    final DateTime birthDate = dateFormat.parse(dateString);

    final now = DateTime.now();
    final age = now.year - birthDate.year;

    if (now.month < birthDate.month ||
        (now.month == birthDate.month && now.day < birthDate.day)) {
      return age - 1;
    } else {
      return age;
    }
  }

  static String formatCurrency(int value) {
    String stringValue = value.toString();
    String formattedString = '';
    int commaIndex = stringValue.length % 3;

    // Add the first part of the string (if any) before the first comma
    if (commaIndex != 0) {
      formattedString += '${stringValue.substring(0, commaIndex)},';
    }

    // Add the rest of the string with commas every three digits
    for (int i = commaIndex; i < stringValue.length; i += 3) {
      formattedString += stringValue.substring(i, i + 3);
      if (i + 3 < stringValue.length) {
        formattedString += ',';
      }
    }

    return formattedString;
  }

  static String convertMinutes(int minutes) {
    if (minutes < 0) {
      return minutes.toString();
    }

    int days = minutes ~/ (24 * 60);
    int remainingMinutes = minutes % (24 * 60);
    int hours = remainingMinutes ~/ 60;
    int remainingMinutesInHour = remainingMinutes % 60;

    String result = '';

    if (days > 0) {
      result += '$days days ';
    }
    if (hours > 0) {
      result += '$hours hours ';
    }
    if (remainingMinutesInHour > 0 || result.isEmpty) {
      result += '$remainingMinutesInHour minutes';
    }

    return result;
  }

  static int genarateProfile({bool female = false}) {
    int genarated = Random().nextInt(50);

    return female ? genarated + 51 : genarated + 1;
  }
}
