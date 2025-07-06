import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/coponents/navbar.dart';
import 'package:portfolio/section/hero_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SafeArea(
       child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w,vertical: 10.h),
         child: ListView(
          children: [
            NavBar(),
            HeroSection(),
          ],  
         ),
       ),
     ),
    );
  }
}
