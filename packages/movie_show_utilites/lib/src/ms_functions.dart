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
}
