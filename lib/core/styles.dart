import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  /// Hero Section - Heading
  static final TextStyle heroHeading = GoogleFonts.playfairDisplay(
    fontSize: 64.sp,
    color: AppColors.text,
    letterSpacing: 0,
    fontWeight: FontWeight.w700,
  );

  /// Hero Section - Subtitle
  static final TextStyle heroSubtitle = GoogleFonts.playfairDisplay(
    fontSize: 20.sp,
    color: AppColors.text,
    fontWeight: FontWeight.w400,
  );

  /// About Page - Main Heading
  static final TextStyle aboutHeading = GoogleFonts.playfairDisplay(
    fontSize: 40.sp,
    color: AppColors.text,
    fontWeight: FontWeight.w700,
  );

  /// About Page - Subtext
  static final TextStyle aboutSub = GoogleFonts.playfairDisplay(
    fontSize: 16.sp,
    color: AppColors.text,
    fontWeight: FontWeight.w400,
  );

  /// About Page - Italic Subtext
  static final TextStyle aboutSubItalic = GoogleFonts.playfairDisplay(
    fontSize: 16.sp,
    color: AppColors.text,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.w400,
  );

  /// Common Section Headings (e.g., Skills, Experience, Projects)
  static final TextStyle sectionHeading = GoogleFonts.playfairDisplay(
    fontSize: 40.sp,
    color: AppColors.text,
    fontWeight: FontWeight.w700,
  );

  /// Common Section Subtitles
  static final TextStyle sectionSub = GoogleFonts.playfairDisplay(
    fontSize: 20.sp,
    color: AppColors.text,
    fontWeight: FontWeight.w400,
  );

  /// Contact Section - "Get in Touch" Heading
  static final TextStyle contactTitle = GoogleFonts.playfairDisplay(
    fontSize: 54.sp,
    color: AppColors.text,
    fontWeight: FontWeight.w700,
  );

  /// Contact Section - "I'd love to hear..." Subtext
  static final TextStyle contactSubtitle = GoogleFonts.playfairDisplay(
    fontSize: 20.sp,
    color: AppColors.text,
    fontWeight: FontWeight.w400,
  );
}
