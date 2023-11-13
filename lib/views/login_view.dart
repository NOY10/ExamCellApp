import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
  bool isPasswordVisible = false; // Password visibility toggle
  bool isEmailWrong = false; // Variable to track wrong email
  bool isPasswordWrong = false; // Variable to track wrong password

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  // Future login() async {
  //   final Uri url =
  //       Uri.parse("https://resultsystemdb.000webhostapp.com/login.php");
  //   final response = await http.post(url, body: {
  //     "Email": email.text,
  //     "Password": password.text,
  //   });
  //   var data = json.decode(response.body);

  //   String current = data['role'];

  //   setState(() {
  //     isEmailWrong = false;
  //     isPasswordWrong = false;
  //   });

  //   if (current != "Error") {
  //     final SharedPreferences prefs = await SharedPreferences.getInstance();
  //     await prefs.setString('userID', data['userID']);

  //     Fluttertoast.showToast(
  //       msg: "Login",
  //       toastLength: Toast.LENGTH_SHORT,
  //       gravity: ToastGravity.CENTER,
  //       timeInSecForIosWeb: 1,
  //       backgroundColor: Colors.red,
  //       textColor: Colors.white,
  //       fontSize: 16.0,
  //     );

  //     if (current == "student") {
  //       Navigator.push(
  //           context, MaterialPageRoute(builder: (context) => StudentHome()));
  //     } else if (current == "examcell") {
  //       Navigator.push(
  //           context, MaterialPageRoute(builder: (context) => ExamcellHome()));
  //     } else if (current == "tutor") {
  //       Navigator.push(
  //           context, MaterialPageRoute(builder: (context) => MyHomePage()));
  //     }
  //   } else {
  //     if (data['errorType'] == 'email') {
  //       setState(() {
  //         isEmailWrong = true;
  //       });
  //     } else if (data['errorType'] == 'password') {
  //       setState(() {
  //         isPasswordWrong = true;
  //       });
  //     } else {
  //       setState(() {
  //         isEmailWrong = true;
  //         isPasswordWrong = true;
  //       });
  //     }

  //     Fluttertoast.showToast(
  //         msg: "Email and/or password are/is incorrect",
  //         toastLength: Toast.LENGTH_SHORT,
  //         gravity: ToastGravity.CENTER,
  //         timeInSecForIosWeb: 1,
  //         backgroundColor: Colors.red,
  //         textColor: Colors.white,
  //         fontSize: 16.0);
  //   }
  // }
  Future login() async {
    final Uri url =
        Uri.parse("https://resultsystemdb.000webhostapp.com/login.php");
    final response = await http.post(url, body: {
      "Email": email.text,
      "Password": password.text,
    });
    var data = json.decode(response.body);

    String current = data['role'];

    print(data);

    setState(() {
      isEmailWrong = false;
      isPasswordWrong = false;
    });

    if (current != "Error") {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('userID', data['userID']);
      await prefs.setString('userRole', data['role']);
      await prefs.setString('userName', data['Name']);
      await prefs.setString('userEmail', data['email']);

      if (current == "student") {
        Fluttertoast.showToast(
          msg: "Logged in as a student",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => StudentHome()));
      } else if (current == "examcell") {
        Fluttertoast.showToast(
          msg: "Logged in as an exam cell member",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ExamcellHome()));
      } else if (current == "tutor") {
        Fluttertoast.showToast(
          msg: "Logged in as a tutor",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyHomePage()));
      }
    } else {
      if (data['errorType'] == 'email') {
        setState(() {
          isEmailWrong = true;
        });
      } else if (data['errorType'] == 'password') {
        setState(() {
          isPasswordWrong = true;
        });
      } else {
        setState(() {
          isEmailWrong = true;
          isPasswordWrong = true;
        });
      }

      // Fluttertoast.showToast(
      //     msg: "Email and/or password are/is incorrect",
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.CENTER,
      //     timeInSecForIosWeb: 1,
      //     backgroundColor: Colors.red,
      //     textColor: Colors.white,
      //     fontSize: 16.0);
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
                    // Image.asset(
                    //   "assets/images/logo-removebg-preview.png",
                    //   height: 120,
                    //   width: 240,),
                    //   Text(
                    //     "Result Processing System",
                    //     style: TextStyle(
                    //       fontSize: 16,
                    //       fontWeight: FontWeight.w700,
                    //       color: const Color.fromARGB(255, 71, 170, 252),
                    //     ),),
                    SizedBox(height: 120),
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
                          // Change the underline color based on the isEmailWrong variable
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: isEmailWrong
                                  ? Colors.red
                                  : Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: TextField(
                        controller: password,
                        obscureText: !isPasswordVisible,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(10),
                            child: SvgPicture.asset('Images/password.svg'),
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isPasswordVisible = !isPasswordVisible;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: SvgPicture.asset(
                                isPasswordVisible
                                    ? 'Images/eye-svgrepo-com.svg'
                                    : 'Images/password_hide.svg',
                              ),
                            ),
                          ),
                          // Change the underline color based on the isPasswordWrong variable
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: isPasswordWrong
                                  ? Colors.red
                                  : Theme.of(context).primaryColor,
                            ),
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
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Expanded(
                    //       child: Padding(
                    //         padding: const EdgeInsets.symmetric(horizontal: 30),
                    //         child: Divider(
                    //           color: Colors.black,
                    //         ),
                    //       ),
                    //     ),
                    //     Padding(
                    //       padding: const EdgeInsets.symmetric(horizontal: 20),
                    //       child: Text(
                    //         'Or',
                    //         style: TextStyle(
                    //           fontSize: 16,
                    //           fontWeight: FontWeight.bold,
                    //         ),
                    //       ),
                    //     ),
                    //     Expanded(
                    //       child: Padding(
                    //         padding: const EdgeInsets.symmetric(horizontal: 30),
                    //         child: Divider(
                    //           color: Colors.black,
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(height: 30),
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 70),
                    //   child: ElevatedButton(
                    //     onPressed: () {
                    //       // sign up with Google action
                    //     },
                    //     style: ElevatedButton.styleFrom(
                    //       backgroundColor:
                    //           const Color.fromARGB(188, 255, 255, 255),
                    //       foregroundColor: Colors.black,
                    //       shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(20),
                    //       ),
                    //     ),
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.center,
                    //       children: [
                    //         Image.asset(
                    //           'Images/google_logo.png',
                    //           height: 30,
                    //           width: 30,
                    //         ),
                    //         SizedBox(width: 10),
                    //         Text(
                    //           'Sign Up with Google',
                    //           style: TextStyle(
                    //             fontSize: 14,
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
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
