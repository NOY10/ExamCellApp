import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SharedPreferencesManager {
  Future<String?> getUserID() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('userID');
  }

  Future<void> setUserID(String userID) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userID', userID);
  }

  Future<String?> getSemester() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('Semester');
  }

  Future<String?> getSemNo() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('SemNo');
  }

  Future<String?> getcode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('mCode');
  }


  Future<String?> getProgram() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('Program');
  }

  Future<void> setUsername(String userID) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('UserName', userID);
  }

  
  
}
