import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

String getFormattedDate(DateTime? dateTime) {
  if (dateTime == null) {
    return '';
  }
  return '${dateTime.day} ${getMonth(dateTime.month)} ${dateTime.year}';
}

// Format date to 'dd/MM/yyyy'
String getFormattedDateCompact(DateTime? dateTime) {
  if (dateTime == null) {
    return '';
  }
  DateFormat formatter = DateFormat('dd/MM/yyyy');
  return formatter.format(dateTime);
}

String formatDuration(Duration duration) {
  final int minutes = duration.inMinutes;
  final int seconds = duration.inSeconds % 60;
  final String minutesStr = minutes < 10 ? '0$minutes' : '$minutes';
  final String secondsStr = seconds < 10 ? '0$seconds' : '$seconds';
  return '$minutesStr:$secondsStr';
}

DateTime getDateTime(String date) {
  final List<String> dateList = date.split(' ');
  final int day = int.parse(dateList[0]);
  final int month = getMonthNumber(dateList[1]);
  final int year = int.parse(dateList[2]);
  return DateTime(year, month, day);
}

String changeTextToPath(String text) {
  return text.replaceAll('/', '-');
}

String removeFileExtension(String fileName) {
  return fileName.split('.').first;
}

String pathToLinkBase(String streamUrl, String path) {
  final base64 = base64Encode(utf8.encode(path));
  if (path == '') {
    return '';
  }
  return '$streamUrl/$base64';
}

String getMonth(int month) {
  switch (month) {
    case 1:
      return 'Januari';
    case 2:
      return 'Februari';
    case 3:
      return 'Maret';
    case 4:
      return 'April';
    case 5:
      return 'Mei';
    case 6:
      return 'Juni';
    case 7:
      return 'Juli';
    case 8:
      return 'Agustus';
    case 9:
      return 'September';
    case 10:
      return 'Oktober';
    case 11:
      return 'November';
    case 12:
      return 'Desember';
    default:
      return '';
  }
}

int getMonthNumber(String dateList) {
  switch (dateList) {
    case 'Januari':
      return 1;
    case 'Februari':
      return 2;
    case 'Maret':
      return 3;
    case 'April':
      return 4;
    case 'Mei':
      return 5;
    case 'Juni':
      return 6;
    case 'Juli':
      return 7;
    case 'Agustus':
      return 8;
    case 'September':
      return 9;
    case 'Oktober':
      return 10;
    case 'November':
      return 11;
    case 'Desember':
      return 12;
    default:
      return 0;
  }
}

extension FileExtention on FileSystemEntity {
  String? get name {
    var path = this.path;
    var fileNameWithoutExtension =
        path.split(Platform.pathSeparator).last.split('.').first;
    return fileNameWithoutExtension;
  }
}

String removeExceptionPrefix(String message) {
  if (message.contains('DioException [unknown]: ')) {
    return message.replaceAll('DioException [unknown]: ', '');
  }
  if (message.contains('Exception: ')) {
    return message.replaceAll('Exception: ', '');
  }
  return message;
}

extension NotNullIterable<E> on Iterable<E?> {
  Iterable<E> whereNotNullable() => whereType<E>();
}

TextInputFormatter emailFormatter() {
  return FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9@.]'));
}

bool isEmailValid(String email) {
  final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  return emailRegex.hasMatch(email);
}

String changeToHttps(String url) {
  if (url.startsWith('http://')) {
    return url.replaceFirst('http://', 'https://');
  }
  return url;
}

String changeToHttp(String url) {
  if (url.startsWith('https://')) {
    return url.replaceFirst('https://', 'http://');
  }
  return url;
}

String removeNewLine(String text) {
  var newText = text.replaceAll('\n', '');
  newText = newText.replaceAll('\r', '');
  newText = newText.replaceAll('%0A', '');
  newText = newText.replaceAll('%0a', '');
  return newText;
}

// 00:00 AM add 0 if hour or minute is less than 10
String getFormattedTime(DateTime dateTime) {
  final String hour =
      dateTime.hour < 10 ? '0${dateTime.hour}' : '${dateTime.hour}';
  final String minute =
      dateTime.minute < 10 ? '0${dateTime.minute}' : '${dateTime.minute}';
  final String amPm = dateTime.hour < 12 ? 'AM' : 'PM';
  return '$hour:$minute $amPm';
}

String getFormattedDuration(int duration) {
  final int minutes = duration ~/ 60;
  final int seconds = duration % 60;
  if (seconds == 0) {
    return '$minutes minutes';
  }
  return '$minutes minutes $seconds seconds';
}

String getFormattedDateTime(DateTime dateTime) {
  final DateTime now =
      DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  final DateTime date = DateTime(dateTime.year, dateTime.month, dateTime.day);
  final bool isToday = now.difference(date).inDays == 0;
  final bool isYesterday = now.difference(date).inDays == 1;
  final bool isThisWeek = now.difference(date).inDays < 7;

  if (isToday) {
    return 'Today';
  } else if (isYesterday) {
    return 'Yesterday';
  } else if (isThisWeek) {
    return getDay(dateTime.weekday);
  } else {
    return getFormattedDate(dateTime);
  }
}

String getDay(int weekday) {
  switch (weekday) {
    case 1:
      return 'Monday';
    case 2:
      return 'Tuesday';
    case 3:
      return 'Wednesday';
    case 4:
      return 'Thursday';
    case 5:
      return 'Friday';
    case 6:
      return 'Saturday';
    case 7:
      return 'Sunday';
    default:
      return '';
  }
}

String randomString({int length = 10}) {
  const chars = 'abcdefghijklmnopqrstuvwxyz0123456789';
  final random = Random.secure();
  final result =
      List.generate(length, (index) => chars[random.nextInt(chars.length)])
          .join();
  return result;
}

String nameToUsername(String name) {
  return name.toLowerCase().replaceAll(' ', '');
}
