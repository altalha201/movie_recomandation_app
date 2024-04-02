class AppFunctions {
  static String getDate(String date) {
    var dates = date.split("-");
    return "${dates[2]} ${getMonth(int.parse(dates[1]))}, ${dates[0]}";
  }

  static String getMonth(int month) {
    switch (month) {
      case 1:
        return "January";
      case 2:
        return "February";
      case 3:
        return "March";
      case 4:
        return "April";
      case 5:
        return "May";
      case 6:
        return "June";
      case 7:
        return "July";
      case 8:
        return "August";
      case 9:
        return "September";
      case 10:
        return "October";
      case 11:
        return "November";
      case 12:
        return "December";
      default:
        return "Non";
    }
  }

  static int getAge(String birthDate) {
    List<String> parts = birthDate.split('-');
    DateTime birthday =
        DateTime(int.parse(parts[0]), int.parse(parts[1]), int.parse(parts[2]));

    DateTime currentDate = DateTime.now();

    int age = currentDate.year - birthday.year;

    if (currentDate.month < birthday.month ||
        (currentDate.month == birthday.month &&
            currentDate.day < birthday.day)) {
      age--;
    }

    return age;
  }
}
