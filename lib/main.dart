import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';// for app-wide texts
import 'package:portfolio/core/app_colors.dart';
import 'pages/home_page.dart'; // your main page

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1512, 982), // MacBook Pro base size
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Bhuvaneshwaran | Portfolio',
          
          // Localization setup
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''), // Default English
            // Locale('ta', ''), // Tamil (future-ready)
            // Locale('hi', ''), // Hindi (optional)
          ],

         theme: ThemeData(
            useMaterial3: true,
            scaffoldBackgroundColor: AppColors.primary,
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppColors.primary,
              brightness:
                  Brightness.dark, // important for white text on dark bg
            ),
            textTheme: GoogleFonts.playfairDisplayTextTheme().apply(
              bodyColor: AppColors.text,
              displayColor: AppColors.text,
            ),
          ),

          home: const HomePage(),
        );
      },
    );
  }
}
