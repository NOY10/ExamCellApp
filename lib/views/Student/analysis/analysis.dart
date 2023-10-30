import 'package:http/http.dart' as http;
import 'dart:convert';

class SemesterData {
  final String semester;
  final double total;
  final double totCm;
  final double totCmMax;

  SemesterData({
    required this.semester,
    required this.total,
    required this.totCm,
    required this.totCmMax,
  });

  factory SemesterData.fromJson(Map<String, dynamic> json) {
    return SemesterData(
      semester: json['semester'],
      total: json['total'].toDouble(),
      totCm: json['totCm'].toDouble(),
      totCmMax: json['totCmMax'].toDouble(),
    );
  }

  Future<void> fetchData() async {
    final url = "https://resultsystemdb.000webhostapp.com/getAnalysis.php?sid=02210233";

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);

        // Create a list of SemesterData objects
        List<SemesterData> semesterDataList = jsonData.map((json) => SemesterData.fromJson(json)).toList();

        // Now you can work with semesterDataList
        print(semesterDataList);

      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}


