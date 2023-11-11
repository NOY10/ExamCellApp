// import 'package:flutter/material.dart';

// AppColors colors(context) => Theme.of(context).extension<AppColors>()!;

// ThemeData getAppTheme(BuildContext context, bool isDarkTheme) {
//   return ThemeData(
//     extensions: <ThemeExtension<AppColors>>[
//       AppColors(
//         color1: isDarkTheme ? Colors.blue : Colors.green,
//         color2: isDarkTheme ? Colors.pink : Colors.blue,
//         color3: isDarkTheme ? Colors.yellow : Colors.red,
//       ),
//     ],
//     scaffoldBackgroundColor: isDarkTheme ? Colors.black : Colors.white,
//     textTheme: Theme.of(context)
//         .textTheme
//         .copyWith(
//           titleSmall:
//               Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 12),
//         )
//         .apply(
//           bodyColor: isDarkTheme ? Colors.white : Colors.black,
//           displayColor: Colors.grey,
//         ),
//     switchTheme: SwitchThemeData(
//       thumbColor: MaterialStateProperty.all(
//           isDarkTheme ? Colors.orange : Colors.purple),
//     ),
//     listTileTheme: ListTileThemeData(
//         iconColor: isDarkTheme ? Colors.orange : Colors.purple),
//     appBarTheme: AppBarTheme(
//         backgroundColor: isDarkTheme ? Colors.black : Colors.white,
//         iconTheme:
//             IconThemeData(color: isDarkTheme ? Colors.white : Colors.black54)),
//   );
// }

// @immutable
// class AppColors extends ThemeExtension<AppColors> {
//   final Color? color1;
//   final Color? color2;
//   final Color? color3;

//   const AppColors({
//     required this.color1,
//     required this.color2,
//     required this.color3,
//   });

//   @override
//   AppColors copyWith({
//     Color? color1,
//     Color? color2,
//     Color? color3,
//   }) {
//     return AppColors(
//       color1: color1 ?? this.color1,
//       color2: color2 ?? this.color2,
//       color3: color3 ?? this.color3,
//     );
//   }

//   @override
//   AppColors lerp(ThemeExtension<AppColors>? other, double t) {
//     if (other is! AppColors) {
//       return this;
//     }
//     return AppColors(
//       color1: Color.lerp(color1, other.color1, t),
//       color2: Color.lerp(color2, other.color2, t),
//       color3: Color.lerp(color3, other.color3, t),
//     );
//   }
// }

import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: Color(0xFF3385FF),
    secondaryHeaderColor: Colors.black,
    cardColor: Colors.white,

    // Font
    fontFamily: 'Future',
    textTheme: TextTheme(
      headline1: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
      headline2: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      headline3: TextStyle(
        // Use headline3 instead of titleSmall
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      bodyText1: TextStyle(
        // Use bodyText1 instead of bodyLarge
        color: Colors.black,
        fontWeight: FontWeight.normal,
        fontSize: 16,
      ),
      bodyText2: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.normal,
        fontSize: 12,
      ),
      caption: TextStyle(
        // Use caption for small body text
        color: Colors.black,
        fontWeight: FontWeight.normal,
        fontSize: 10,
      ),
    ),
  );
}
