import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/app_colors.dart';

Widget glowingButton() {
  return Container(
    height: 50.h,
    width: 110.w,
    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(40),
     color: AppColors.glowButton,
      boxShadow: [
        BoxShadow(
          color: Colors.deepPurpleAccent.withValues(alpha:0.6),
          blurRadius: 20.r,
          spreadRadius: 2.r,
        ),
      ],
    ),
    child: Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children:  [
          Icon(Icons.auto_awesome, color: Colors.white, size: 16),
          SizedBox(width: 6.w
          ),
          Text(
            'Hire Me',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}
