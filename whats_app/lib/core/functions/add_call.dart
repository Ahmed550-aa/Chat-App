import 'package:intl/intl.dart';
import 'package:whats_app/const/data.dart';
import 'package:whats_app/const/recent_call_data.dart';

String getFormattedDateTime(DateTime dateTime) {
  DateTime now = DateTime.now();
  String formattedTime = DateFormat('h:mm a').format(dateTime);

  String formattedDate;
  if (DateFormat('yyyy-MM-dd').format(dateTime) ==
      DateFormat('yyyy-MM-dd').format(now)) {
    formattedDate = "Today";
  } else {
    formattedDate = DateFormat('d MMM yyyy').format(dateTime);
  }
  print("$formattedDate, $formattedTime");
  return "$formattedDate, $formattedTime";
}

 void addCall(int index) {
  
      DateTime now = DateTime.now();
    Map<String, dynamic> m = {
      'name': data[index]['name'],
      'date': getFormattedDateTime(now),
      'image': data[index]['image'],
      'phone': data[index]['phone'],
    };
    recentcall.add(m);
  }
