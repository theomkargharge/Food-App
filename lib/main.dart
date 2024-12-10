import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task/presentation/get_started_screen/binding/get_started_binding.dart';
import 'package:task/presentation/get_started_screen/get_started_screen.dart';
import 'package:task/presentation/home_screen/binding/home_screen_binding.dart';
import 'package:task/presentation/home_screen/home_screen.dart';
import 'package:task/presentation/splash_screen/binding/splash_binding.dart';
import 'package:task/presentation/splash_screen/splash_screen.dart';

void main() {
  runApp( const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
 
      title: 'Feastify',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
        useMaterial3: true,
      ),
      initialBinding: SplashBinding(),
      getPages: [

           GetPage(
          name: '/',
          page: () => const SplashScreen(),
          bindings: [SplashBinding()],
        ),
        GetPage(
          name: '/homeScreen',
          page: () => const HomeScreen(),
          bindings: [HomeScreenBinding()],
        ),
        GetPage(
          name: '/getStarted',
          page: () => const GetStarted(),
          bindings: [GetStartedBinding()],
        )
      ],
    );
  }
}
