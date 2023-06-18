import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

String formatDateFromTimeStamp({required Timestamp timestamp}) {
  final date = timestamp.toDate();
  return formatDateFromDateTime(datetime: date);
}

String formatDateFromDateTime({required DateTime datetime}) {
  final dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
  return dateFormat.format(datetime);
}
