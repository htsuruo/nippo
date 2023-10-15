import 'package:intl/intl.dart';

// ref.
// https://github.com/dart-lang/intl/blob/eb4ab704c4a3c48d957b2a188c6b452051a093a7/lib/date_symbol_data_local.dart#L9237
// https://github.com/dart-lang/intl/blob/eb4ab704c4a3c48d957b2a188c6b452051a093a7/lib/date_time_patterns.dart#L2707
extension DateTimeEx on DateTime {
  String get formatted => DateFormat.yMMMd().add_Hms().format(this);
}
