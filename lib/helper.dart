import 'package:intl/intl.dart';

String formattedDate(date, { String format = 'd MMMM yyyy' }) {
  final f = DateFormat(format);

  if (date is DateTime) {
    return f.format(date);
  }

  return f.format(DateTime.parse(date));
}

String formattedPrice(int price) {
  final f = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
  return f.format(price);
}