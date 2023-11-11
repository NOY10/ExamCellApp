// import 'package:examcellapp/firebase_options.dart';
// import 'package:examcellapp/views/Student/studenHome.dart';
// import 'package:examcellapp/views/splash_screen/splash_screen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:examcellapp/views/login_view.dart';
// import 'package:examcellapp/views/Teacher/TeacherHome.dart';
// import 'package:examcellapp/views/Examcell/ExamcellHome.dart';
// import 'package:examcellapp/views/Examcell/Dashboard/ModuleResultPage.dart';
// import 'package:examcellapp/views/Examcell/Dashboard/ResultView.dart';
// import 'package:flutter/services.dart';
// //theme
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:examcellapp/views/theme/theme.dart';
// import 'package:examcellapp/views/theme/theme_provider.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );

//   runApp(const ProviderScope(child: MyApp()));

//   // WidgetsFlutterBinding.ensureInitialized();
//   // await SystemChrome.setPreferredOrientations([
//   //   DeviceOrientation.portraitUp,
//   //   DeviceOrientation.portraitDown,
//   // ]);
//   // runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     // var isDarkMode = ref.watch(appThemeProvider);
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
//         useMaterial3: true,
//       ),
//       //123
//       // theme: getAppTheme(context, ref.watch(appThemeProvider)),
//       home: const StudentHome(),
//       routes: {
//         // The home screen route
//         '/login/': (context) => const Login(), // The login screen route
//         '/moduleResultPage': (context) => ModuleResultPage(),
//         '/ResultView': (context) => ResultView(),
//       },
//     );
//   }

//   ///
//   // Widget build(BuildContext context) => ChangeNotifierProvider(
//   //       create: (context) => ThemeProvider(),
//   //       builder: (context, _) {
//   //         final themeProvider = Provider.of<ThemeProvider>(context);

//   //         return MaterialApp(
//   //           // title: title,
//   //           themeMode: themeProvider.themeMode,
//   //           theme: MyThemes.lightTheme,
//   //           darkTheme: MyThemes.darkTheme,
//   //           home: SplashScreen(),
//   //         );
//   //       },
//   //       routes: {
//   //         //       // The home screen route
//   //         '/login/': (context) => const Login(), // The login screen route
//   //         '/moduleResultPage': (context) => ModuleResultPage(),
//   //         '/ResultView': (context) => ResultView(),
//   //       },
//   //     );
//   // @override
//   // Widget build(BuildContext context) {
//   //   return ChangeNotifierProvider(
//   //     create: (context) => ThemeProvider(),
//   //     child: Builder(
//   //       builder: (context) {
//   //         final themeProvider = Provider.of<ThemeProvider>(context);

//   //         return MaterialApp(
//   //           debugShowCheckedModeBanner: false,
//   //           themeMode: themeProvider.themeMode,
//   //           theme: MyThemes.lightTheme,
//   //           darkTheme: MyThemes.darkTheme,
//   //           home: StudentHome(),
//   //           routes: {
//   //             '/login/': (context) => const Login(),
//   //             '/moduleResultPage': (context) => ModuleResultPage(),
//   //             '/ResultView': (context) => ResultView(),
//   //           },
//   //         );
//   //       },
//   //     ),
//   //   );
//   // }
// }

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
import 'package:flutter/services.dart';

import 'package:examcellapp/views/theme/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Your App Title',
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      //   useMaterial3: true,
      // ),
      theme: theme(),

      home: const SplashScreen(),
      routes: {
        '/login/': (context) => const Login(),
        '/moduleResultPage': (context) => ModuleResultPage(),
        '/ResultView': (context) => ResultView(),
      },
    );
  }
}
