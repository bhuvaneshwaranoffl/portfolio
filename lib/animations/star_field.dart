import 'dart:math';
import 'package:flutter/material.dart';

class StarField extends StatefulWidget {
  const StarField({super.key});

  @override
  State<StarField> createState() => _StarFieldState();
}

class _StarFieldState extends State<StarField> with TickerProviderStateMixin {
  final List<_Star> _stars = [];
  final List<_ShootingStar> _shootingStars = [];
  final Random _random = Random();

  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    // Create random drifting stars
    for (int i = 0; i < 150; i++) {
      _stars.add(_Star(
        position:
            Offset(_random.nextDouble() * 1600, _random.nextDouble() * 1000),
        velocity: Offset(
          (_random.nextDouble() - 0.5) * 0.5, // x drift
          (_random.nextDouble() - 0.5) * 0.5, // y drift
        ),
      ));
    }

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(days: 365), // long-running
    )
      ..addListener(_updateStars)
      ..forward();

    // Trigger shooting star every 3 seconds
    _spawnShootingStar();
  }

  void _updateStars() {
    for (var star in _stars) {
      star.position += star.velocity;

      // Wrap around the screen
      if (star.position.dx < 0) star.position = Offset(1600, star.position.dy);
      if (star.position.dx > 1600) star.position = Offset(0, star.position.dy);
      if (star.position.dy < 0) star.position = Offset(star.position.dx, 1000);
      if (star.position.dy > 1000) star.position = Offset(star.position.dx, 0);
    }

    // Move shooting stars
    _shootingStars.removeWhere((s) => s.life > 60);
    for (var star in _shootingStars) {
      star.position += star.velocity;
      star.life++;
    }

    setState(() {});
  }

  void _spawnShootingStar() {
    Future.delayed(const Duration(seconds: 3), () {
      final angle = _random.nextDouble() * pi / 2 + pi / 4; // random direction
      final velocity = Offset(cos(angle), sin(angle)) * 12;

      _shootingStars.add(
        _ShootingStar(
          position:
              Offset(_random.nextDouble() * 800, _random.nextDouble() * 200),
          velocity: velocity,
        ),
      );

      _spawnShootingStar(); // recursively spawn every 3s
    });
  }

  void _onTapStar(Offset pos) {
    _stars.removeWhere((star) =>
        (star.position.dx - pos.dx).abs() < 20 &&
        (star.position.dy - pos.dy).abs() < 20);
    setState(() {});
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) => _onTapStar(details.localPosition),
      child: CustomPaint(
        size: Size.infinite,
        painter: _StarPainter(_stars, _shootingStars),
      ),
    );
  }
}

class _Star {
  Offset position;
  Offset velocity;

  _Star({required this.position, required this.velocity});
}

class _ShootingStar {
  Offset position;
  Offset velocity;
  int life = 0;

  _ShootingStar({required this.position, required this.velocity});
}

class _StarPainter extends CustomPainter {
  final List<_Star> stars;
  final List<_ShootingStar> shootingStars;

  _StarPainter(this.stars, this.shootingStars);

  @override
  void paint(Canvas canvas, Size size) {
    final starPaint = Paint()..color = Colors.white.withValues(alpha:0.8);

    for (var star in stars) {
      canvas.drawCircle(star.position, 1.5, starPaint);
    }

    final shootingPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 1.8
      ..style = PaintingStyle.stroke;

    for (var shoot in shootingStars) {
      final trail = Offset(shoot.position.dx - shoot.velocity.dx * 4,
          shoot.position.dy - shoot.velocity.dy * 4);

      final path = Path()
        ..moveTo(shoot.position.dx, shoot.position.dy)
        ..lineTo(trail.dx, trail.dy);

      canvas.drawPath(path, shootingPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
