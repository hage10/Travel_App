import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  String get getStartDate {
    DateFormat transactopnDateFormat = DateFormat('dd MMM');
    return transactopnDateFormat.format(this);
  }

  String get getEndDate {
    DateFormat transactopnDateFormat = DateFormat('dd MMM yyyy');
    return transactopnDateFormat.format(this);
  }
}
