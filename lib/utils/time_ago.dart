import 'package:timeago/timeago.dart';

class ViShortMessages implements LookupMessages {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => '';
  @override
  String suffixAgo() => '';
  @override
  String suffixFromNow() => '';
  @override
  String lessThanOneMinute(int seconds) => 'bây giờ';
  @override
  String aboutAMinute(int minutes) => '1 phút trước';
  @override
  String minutes(int minutes) => '$minutes phút trước';
  @override
  String aboutAnHour(int minutes) => '1 giờ';
  @override
  String hours(int hours) => '$hours giờ trước';
  @override
  String aDay(int hours) => '1 ngày trước';
  @override
  String days(int days) => '$days ngày trước';
  @override
  String aboutAMonth(int days) => 'tháng trước';
  @override
  String months(int months) => '$months tháng trước';
  @override
  String aboutAYear(int year) => '1 năm trước';
  @override
  String years(int years) => '$years năm trước';
  @override
  String wordSeparator() => ' ';
}