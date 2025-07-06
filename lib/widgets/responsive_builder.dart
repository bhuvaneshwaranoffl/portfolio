import 'package:flutter/material.dart';
import 'package:portfolio/core/responsive.dart';


class ResponsiveBuilder extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const ResponsiveBuilder({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width >= AppBreakpoints.desktop) {
      return desktop;
    } else if (width >= AppBreakpoints.tablet) {  
      return tablet;
    } else {
      return mobile;
    }
  }
}
