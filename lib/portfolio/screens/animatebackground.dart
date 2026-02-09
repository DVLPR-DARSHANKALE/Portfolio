import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AnimatedGradientBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF0F0C29), Color(0xFF302B63), Color(0xFF24243E)],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -200,
            left: -200,
            child: GlowBlob(color: Colors.pinkAccent),
          ),
          Positioned(
            bottom: -200,
            right: -200,
            child: GlowBlob(color: Colors.cyanAccent),
          ),
        ],
      ),
    );
  }
}

class GlowBlob extends StatelessWidget {
  final Color color;
  const GlowBlob({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 400,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.withOpacity(0.35),
      ),
    ).animate().blur(duration: 3.seconds).scale(begin: const Offset(0.8, 0.8));
  }
}
