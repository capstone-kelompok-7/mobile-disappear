import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

String formattedDate(date, { String format = 'd MMMM yyyy' }) {
  final f = DateFormat(format);

  if (date is DateTime) {
    return f.format(date);
  }

  return f.format(DateTime.parse(date));
}

String formattedPrice(dynamic price) {
  final f = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
  return f.format(price);
}

String formatToTimeago(dynamic datetime) {
  if (datetime is DateTime) {
    return timeago.format(datetime, locale: 'id');
  }

  return timeago.format(DateTime.parse(datetime), locale: 'id');
}