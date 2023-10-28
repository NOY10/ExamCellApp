import 'package:examcellapp/firebase_options.dart';
import 'package:examcellapp/views/Student/studenHome.dart';
import 'package:examcellapp/views/splash_screen/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:examcellapp/views/login_view.dart';
import 'package:examcellapp/views/Teacher/TeacherHome.dart';
import 'package:examcellapp/views/Examcell/ExamcellHome.dart';
import 'package:examcellapp/views/Examcell/Dashboard/ModuleResultPage.dart';
import 'package:examcellapp/views/Examcell/Dashboard/ResultView.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
      routes: {
        // The home screen route
        '/login/': (context) => const Login(), // The login screen route
        '/moduleResultPage': (context) => ModuleResultPage(),
        '/ResultView': (context) => ResultView(),
      },
    );
  }
}
