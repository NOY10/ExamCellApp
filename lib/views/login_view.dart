import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:examcellapp/views/Teacher/TeacherHome.dart';
import 'package:examcellapp/views/Examcell/ExamcellHome.dart';
import 'package:examcellapp/views/Student/studenHome.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late Color mycolor;
  late Size mediaSize;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future login() async {
    final Uri url =
        Uri.parse("https://examcellflutter.000webhostapp.com/login.php");
    final response = await http.post(url, body: {
      "Email": email.text,
      "Password": password.text,
    });
    var data = json.decode(response.body);

    String current = data['role'];

    if (current != "Error") {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('userID', data['userID']);

      Fluttertoast.showToast(
        msg: "Login",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );

      if (current == "Student") {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => StudentHome()));
      } else if (current == "Examcell") {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ExamcellHome()));
      } else if (current == "Tutor") {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyHomePage()));
      }
    } else {
      Fluttertoast.showToast(
          msg: "Email and password are incorrect",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    mycolor = Theme.of(context).primaryColor;
    mediaSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                constraints:
                    BoxConstraints(maxHeight: 200, maxWidth: double.infinity),
                decoration: BoxDecoration(
                  color: mycolor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.zero,
                    topRight: Radius.zero,
                    bottomLeft: Radius.elliptical(700, 590),
                    bottomRight: Radius.elliptical(700, 590),
                  ),
                  image: DecorationImage(
                    image: AssetImage('Images/basketball_Login.jpeg'),
                    fit: BoxFit.fitWidth,
                    colorFilter: ColorFilter.mode(
                        mycolor.withOpacity(0.4), BlendMode.dstATop),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  verticalDirection: VerticalDirection.down,
                  children: [
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextField(
                        controller: email,
                        decoration: InputDecoration(
                          labelText: 'Email Address',
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(10),
                            child: SvgPicture.asset('Images/email.svg'),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextField(
                        controller: password,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(10),
                            child: SvgPicture.asset('Images/password.svg'),
                          ),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(10),
                            child: SvgPicture.asset('Images/password_hide.svg'),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 70),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color(0xff0028a8),
                              Color(0xff2a54d5),
                              Color(0xff0028a8),
                            ],
                          ),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            login();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Divider(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            'Or',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Divider(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 70),
                      child: ElevatedButton(
                        onPressed: () {
                          // Add your sign up with Google action here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(188, 255, 255, 255),
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'Images/google_logo.png',
                              height: 30,
                              width: 30,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Sign Up with Google',
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
