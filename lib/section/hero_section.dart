import 'package:flutter/material.dart';
import 'package:portfolio/animations/star_field.dart';
import 'package:portfolio/core/styles.dart';
import 'package:portfolio/data/hero_data.dart';
import 'package:portfolio/widgets/glowing_button.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Positioned.fill(child: StarField()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 48, vertical: 120),
          child: Row(
            children: [
              // Left: Text + CTA
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(HeroData.title, style: AppTextStyles.heroHeading),
                    const SizedBox(height: 20),
                     Text(
                      HeroData.subtitle,
                      style: AppTextStyles.heroSubtitle
                    ),
                    const SizedBox(height: 32),
                    glowingButton(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
