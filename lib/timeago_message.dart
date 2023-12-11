// Override "en" locale messages with custom messages that are more precise and short
import 'package:timeago/timeago.dart' as timeago;

// my_custom_messages.dart
class IndonesianMessage implements timeago.LookupMessages {
  @override String prefixAgo() => '';
  @override String prefixFromNow() => '';
  @override String suffixAgo() => '';
  @override String suffixFromNow() => '';
  @override String lessThanOneMinute(int seconds) => 'sekarang';
  @override String aboutAMinute(int minutes) => '${minutes} menit lalu';
  @override String minutes(int minutes) => '${minutes} menit lalu';
  @override String aboutAnHour(int minutes) => '${minutes} menit lalu';
  @override String hours(int hours) => '${hours} jam lalu';
  @override String aDay(int hours) => '${hours} jam lalu';
  @override String days(int days) => '${days} hari lalu';
  @override String aboutAMonth(int days) => '${days} hari lalu';
  @override String months(int months) => '${months} bulan lalu';
  @override String aboutAYear(int year) => '${year} tahun lalu';
  @override String years(int years) => '${years} tahun lalu';
  @override String wordSeparator() => ' ';
}