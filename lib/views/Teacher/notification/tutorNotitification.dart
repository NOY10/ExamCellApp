import 'dart:convert';

import 'package:http/http.dart' as http;

Future<void> sendTutorNotification(String tid, String moduleCode, String semester) async {
  final url = Uri.parse("https://resultsystemdb.000webhostapp.com/notiTutor.php");

  final response = await http.post(url, body: {
    'tid' : tid,
    'mid' : moduleCode,
    'semester' : semester,
  });

  if (response.statusCode == 200){
    print("Notification Inserted Succesfully");
  }else {
    print('Error Inserting Notifications');
  }
}

Future<List<Map<String, dynamic>>> receiveNotifications() async {
  final url = Uri.parse("https://resultsystemdb.000webhostapp.com/notiData.php");
  var response = await http.get(url);

  if (response.statusCode == 200){
    List<dynamic> jsonResponse = json.decode(response.body);
    List<Map<String, dynamic>> data = List<Map<String, dynamic>>.from(jsonResponse);

    return data;
  } else {
    throw Exception("Failed to Load Notifactions");
  }
}