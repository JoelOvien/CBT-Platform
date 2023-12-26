import 'package:intl/intl.dart';

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    ).hasMatch(this);
  }

  double toDouble() {
    final val = double.tryParse(replaceAll(",", ""));
    return val ?? 0;
  }

  String get capitalize => "${this[0].toUpperCase()}${substring(1).toLowerCase()}";

  String get capitalizeFirstofEach => split(" ").map((str) => str.capitalize).join(" ");

  String get addCommas => replaceAllMapped(
        RegExp(
          r'(\d{1,3})(?=(\d{3})+(?!\d))',
        ),
        (Match m) => '${m[1]},',
      );

  String get replaceBrackets => replaceAll(RegExp(r'/\[|\]/g'), '');
}

/// Get date as a string for display.
String getFormattedDate(String date) {
  /// Convert into local date format.
  final localDate = DateTime.parse(date).toLocal();

  /// inputFormat - format getting from api or other func.
  /// e.g If 2021-05-27 9:34:12.781341 then format should be yyyy-MM-dd HH:mm
  /// If 27/05/2021 9:34:12.781341 then format should be dd/MM/yyyy HH:mm
  final inputFormat = DateFormat('yyyy-MM-dd');
  final inputDate = inputFormat.parse(localDate.toString());

  /// outputFormat - convert into format you want to show.
  final outputFormat = DateFormat('yyyy-MM-dd');
  final outputDate = outputFormat.format(inputDate);

  return outputDate;
}

/// Get date as a string for display.
String getFormattedDateTime(String date) {
  /// Convert into local date format.
  final localDate = DateTime.parse(date).toLocal();

  /// inputFormat - format getting from api or other func.
  /// e.g If 2021-05-27 9:34:12.781341 then format should be yyyy-MM-dd HH:mm
  /// If 27/05/2021 9:34:12.781341 then format should be dd/MM/yyyy HH:mm
  final inputFormat = DateFormat('yyyy-MM-dd HH:mm');
  final inputDate = inputFormat.parse(localDate.toString());

  /// outputFormat - convert into format you want to show.
  final outputFormat = DateFormat('yyyy-MM-dd HH:mm');
  final outputDate = outputFormat.format(inputDate);

  return outputDate;
}

String getTimeFromDateAndTime(String date) {
  DateTime dateTime;
  try {
    dateTime = DateTime.parse(date).toLocal();
    return DateFormat.jm().format(dateTime); //5:08 PM
// String formattedTime = DateFormat.Hms().format(now);
// String formattedTime = DateFormat.Hm().format(now);   // //17:08  force 24 hour time
  } catch (e) {
    return date;
  }
}
