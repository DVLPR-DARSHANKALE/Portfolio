import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 55,
          backgroundImage: const AssetImage('assets/images/imagesam.jpeg'),
        ).animate().scale(duration: 500.ms, curve: Curves.easeOutBack),

        const SizedBox(height: 16),

        const Text(
          'Samarth Shillak',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.3),

        const SizedBox(height: 6),

        Text(
          'Flutter Developer',
          style: TextStyle(color: Colors.grey[600]),
        ).animate().fadeIn(delay: 350.ms),

        const SizedBox(height: 12),

        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            'I build clean, scalable Flutter apps with API & Firebase integration.',
            textAlign: TextAlign.center,
          ),
        ).animate().fadeIn(delay: 500.ms).slideY(begin: 0.4),
      ],
    );
  }
}
