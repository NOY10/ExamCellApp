import 'package:http/http.dart' as http;

Future<String> deleteMark(String code) async {
  final Uri url = Uri.parse("https://resultsystemdb.000webhostapp.com/Tutor/deleteMark.php?code=${code}");

  var response = await http.get(url);

  if (response.statusCode == 200) {
    // Successful response
    return response.body;
  } else {
    // Handle error
    throw Exception('Failed to delete data');
  }
}
