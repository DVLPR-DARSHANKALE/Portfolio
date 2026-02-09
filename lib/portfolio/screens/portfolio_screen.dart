import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/portfolio/screens/animatebackground.dart';
import 'package:portfolio/portfolio/widgets/feature_project_card.dart';
import 'package:portfolio/portfolio/widgets/info_chip.dart';
import 'package:url_launcher/url_launcher.dart';
import '../sections/company_apps_carousel.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedGradientBackground(),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 80),
                  child: const NameCard()
                      .animate()
                      .fadeIn(duration: 700.ms)
                      .slideY(begin: 0.12, curve: Curves.easeOut),
                ),
                const SizedBox(height: 100),
                const CompanyAppsCarousel()
                    .animate()
                    .fadeIn(delay: 150.ms)
                    .slideY(begin: 0.1),
                const SizedBox(height: 120),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 80),
                  child: const SideProjectsSection()
                      .animate()
                      .fadeIn(delay: 250.ms)
                      .slideY(begin: 0.1),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// =======================
/// PROFILE CARD
/// =======================
class NameCard extends StatefulWidget {
  const NameCard({super.key});

  @override
  State<NameCard> createState() => _NameCardState();
}

class _NameCardState extends State<NameCard> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 280),
        curve: Curves.easeOut,
        transform: Matrix4.translationValues(0, _hover ? -6 : 0, 0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(32),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
            child: Container(
              padding: const EdgeInsets.all(36),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.white.withOpacity(_hover ? 0.18 : 0.15),
                    Colors.white.withOpacity(0.04),
                  ],
                ),
                border: Border.all(
                  color: Colors.white.withOpacity(0.18),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Avatar
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.pinkAccent
                              .withOpacity(_hover ? 0.7 : 0.55),
                          blurRadius: 46,
                        ),
                      ],
                    ),
                    child: const CircleAvatar(
                      radius: 58,
                      backgroundImage:
                          AssetImage('assets/images/imagesam.jpeg'),
                    ),
                  )
                      .animate()
                      .scale(duration: 700.ms, curve: Curves.easeOutBack),

                  const SizedBox(width: 36),

                  // Text Content
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Darshan Kale',
                          style: TextStyle(
                            fontSize: 46,
                            fontWeight: FontWeight.w900,
                            letterSpacing: -0.6,
                            color: Colors.white,
                          ),
                        ).animate().fadeIn(delay: 150.ms).slideX(begin: -0.04),

                        const SizedBox(height: 10),

                        Wrap(
                          spacing: 10,
                          runSpacing: 8,
                          children: const [
                            InfoChip('Flutter Developer'),
                            InfoChip('2+ Years Experience'),
                            InfoChip('Production Apps'),
                          ],
                        ).animate().fadeIn(delay: 280.ms).slideY(begin: 0.15),

                        const SizedBox(height: 16),

                        // ✅ Email Row
                        // EMAIL ROW
                        GestureDetector(
                          onTap: () async {
                            final Uri emailUri = Uri(
                                scheme: 'mailto',
                                path: 'dev.kaledarshan@gmail.com');

                            if (await canLaunchUrl(emailUri)) {
                              await launchUrl(emailUri);
                            }
                          },
                          onLongPress: () {
                            Clipboard.setData(
                              const ClipboardData(
                                  text: 'dev.kaledarshan@gmail.com'),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Email copied")),
                            );
                          },
                          child: Row(
                            children: const [
                              Icon(Icons.email_outlined,
                                  size: 18, color: Colors.white70),
                              SizedBox(width: 8),
                              Text(
                                'dev.kaledarshan@gmail.com',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 6),

// PHONE ROW
                        GestureDetector(
                          onTap: () async {
                            final Uri phoneUri =
                                Uri(scheme: 'tel', path: '+919730165039');

                            if (await canLaunchUrl(phoneUri)) {
                              await launchUrl(phoneUri);
                            }
                          },
                          onLongPress: () {
                            Clipboard.setData(
                              const ClipboardData(text: '+919730165039'),
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Phone copied")),
                            );
                          },
                          child: Row(
                            children: const [
                              Icon(Icons.phone_outlined,
                                  size: 18, color: Colors.white70),
                              SizedBox(width: 8),
                              Text(
                                '+91 9730165039',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(height: 18),

                        const Text(
                          'Flutter Developer with 2+ years of experience building production-grade mobile applications. '
                          'Currently working at Probity IT Services, contributing to scalable Flutter apps with clean architecture, '
                          'REST APIs, Firebase, and modern state management.',
                          style: TextStyle(
                            color: Colors.white60,
                            fontSize: 16,
                            height: 1.65,
                          ),
                        ).animate().fadeIn(delay: 420.ms).slideY(begin: 0.12),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// =======================
/// INFO CHIP
/// =======================

/// =======================
/// SIDE PROJECTS
/// =======================
class SideProjectsSection extends StatelessWidget {
  const SideProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Tools & Developer Utilities',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w900,
            letterSpacing: -0.4,
            color: Colors.white,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 12, bottom: 50),
          height: 3,
          width: 72,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
              colors: [Colors.cyanAccent, Colors.pinkAccent],
            ),
          ),
        ),
        FeatureProjectCard(
          title: 'VS Code Extension',
          description:
              'Clean Flutter BLoC Feature is a Visual Studio Code extension that automates the creation of scalable BLoC architecture '
              'feature folders in Flutter projects, improving developer productivity and maintainability.',
          tech: 'JavaScript • VS Code API',
          link:
              'https://open-vsx.org/extension/samarth/clean-flutter-bloc-feature',
          icon: Icons.extension,
        ),
      ],
    );
  }
}
