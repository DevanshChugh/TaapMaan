import 'package:catalogapp/Pages/admin_landing_page.dart';
import 'package:catalogapp/Pages/login_page.dart';
import 'package:catalogapp/Pages/result_page1.dart';
import 'package:catalogapp/Pages/result_page2.dart';
import 'package:catalogapp/Pages/result_page3.dart';
import 'package:catalogapp/Pages/result_page4.dart';
import 'package:catalogapp/Pages/user_enter.dart';
import 'package:catalogapp/Pages/admin_req.dart';
import 'package:catalogapp/utils/routes.dart';
import 'package:catalogapp/Pages/admin_result1.dart';
import 'package:catalogapp/Pages/admin_result2.dart';
import 'package:catalogapp/Pages/admin_result3.dart';
import 'package:catalogapp/Pages/aduser_enter.dart';
// import 'package:catalogapp/utils/user_sheets_api.dart';
import 'package:flutter/material.dart';
import 'package:catalogapp/Pages/landing_page.dart';
import 'Pages/login_page.dart';
import 'package:google_fonts/google_fonts.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: const HomePage(),
      themeMode: ThemeMode.light,
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        // primarySwatch: Colors.red,
      ),
      initialRoute: "/landing",
      routes: {
        "/": (context) => const LandingPage(),
        MyRoutes.loginRoute: (context) => const LoginPage(),
        MyRoutes.enterRoute:(context) => const UserEnter(),
        MyRoutes.resultRoute1:(context) => const ResultShow1(),
        MyRoutes.resultRoute2:(context) => const ResultShow2(),
        MyRoutes.resultRoute3:(context) => const ResultShow3(),
        MyRoutes.resultRoute4:(context) => const ResultShow4(),
        MyRoutes.adminLandRoute:(context) => const AdminLanding(),
        MyRoutes.landingRoute:(context)=> const LandingPage(),
        MyRoutes.adminreq:(context)=>const AdminReq(),
        MyRoutes.adresultRoute1:(context) => const AdResultShow1(),
        MyRoutes.adresultRoute2:(context) => const AdResultShow2(),
        MyRoutes.adresultRoute3:(context) => const AdResultShow3(),
        MyRoutes.adenterRoute:(context) => const AdUserEnter(),


      },
    );
  }
}
