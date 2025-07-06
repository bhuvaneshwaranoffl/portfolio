import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../core/app_colors.dart';
import '../widgets/responsive_builder.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;

  final List<String> _items = [
    'Home',
    'About',
    'Skills',
    'Experience',
    'Contact',
  ];

  late final AnimationController _controller;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat();

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      mobile: _buildMobile(),
      tablet: _buildMobile(),
      desktop: _buildDesktop(),
    );
  }

  Widget _buildMobile() {
    return AppBar(
      backgroundColor: AppColors.primary.withOpacity(0.3),
      elevation: 0,
      title: const Text("Bhuvaneshwaran"),
      actions: [
        Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openEndDrawer(),
          ),
        )
      ],
    );
  }

  Widget _buildDesktop() {
    return Center(
      child: Container(
        height: 45.h,
        width: 540.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.r),
          color: Colors.white.withOpacity(0.1),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24.r),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(_items.length, (index) {
                final isSelected = _selectedIndex == index;
                return GestureDetector(
                  onTap: () => _onItemTap(index),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _items[index],
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.white70,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          shadows: isSelected
                              ? const [
                                  Shadow(
                                    color: Colors.cyanAccent,
                                    blurRadius: 12,
                                  ),
                                ]
                              : null,
                        ),
                      ),
                      if (isSelected)
                        AnimatedBuilder(
                          animation: _animation,
                          builder: (_, __) {
                            return Container(
                              height: 2,
                              width: 36,
                              margin: EdgeInsets.only(top: 6.h),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: const [
                                    Colors.red,
                                    Colors.orange,
                                    Colors.yellow,
                                    Colors.green,
                                    Colors.blue,
                                    Colors.indigo,
                                    Colors.purple,
                                  ],
                                  transform:
                                      GradientRotation(_animation.value * 6.28),
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            );
                          },
                        ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
