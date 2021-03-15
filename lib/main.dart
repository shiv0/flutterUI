import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:luxury_flavor_app/screens/LoginScreen.dart';

import 'ui/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const MaterialColor kPrimaryColor = const MaterialColor(
    0xFF0E7AC7,
    const <int, Color>{
      50: const Color(0xFFff9cad),
      100: const Color(0xFFff9cad),
      200: const Color(0xFFff9cad),
      300: const Color(0xFFff9cad),
      400: const Color(0xFFff9cad),
      500: const Color(0xFFff9cad),
      600: const Color(0xFFff9cad),
      700: const Color(0xFFff9cad),
      800: const Color(0xFFff9cad),
      900: const Color(0xFFff9cad),
    },
  );
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(1080, 1920),
      allowFontScaling: false,
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Luxury Flavor App',
        theme: ThemeData(
          accentColor: Color(0xFFff9cad),
          primarySwatch: kPrimaryColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LoginScreen(),
      ),
    );
  }
}
