import 'dart:async';
import 'package:flutter/material.dart';
import '../models/company_app_model.dart';
import '../widgets/company_app_card.dart';

class CompanyAppsCarousel extends StatefulWidget {
  const CompanyAppsCarousel({super.key});

  @override
  State<CompanyAppsCarousel> createState() => _CompanyAppsCarouselState();
}

class _CompanyAppsCarouselState extends State<CompanyAppsCarousel> {
  final PageController controller = PageController(viewportFraction: 0.72);
  Timer? _timer;
  int _currentPage = 0;
  bool _isHovering = false;

  final List<CompanyApp> apps = [
    CompanyApp(
      title: 'ReshimGathi',
      subtitle: 'Matrimony Platform',
      description:
          'Contributed to a large-scale matrimony platform built with Flutter, focusing on clean architecture, secure matchmaking flows, and verified user profiles. Worked closely on API integration, performance optimization, and ensuring a smooth, reliable user experience for a community-driven product used in production.',
      link:
          'https://play.google.com/store/apps/details?id=dev.probity.reshimgathi',
      gradient: [Colors.pinkAccent, Colors.deepPurple],
    ),
    CompanyApp(
      title: 'Ok Barter',
      subtitle: 'Marketplace Application',
      description:
          'Worked on a Flutter-based marketplace application that enables users to list, browse, and trade products seamlessly. Contributed to building responsive UI flows, integrating backend APIs, and improving overall performance to support secure interactions and smooth trading experiences.',
      link: 'https://play.google.com/store/apps/details?id=com.okbarter.app',
      gradient: [Colors.cyanAccent, Colors.blueAccent],
    ),
    CompanyApp(
      title: 'QuickGig',
      subtitle: 'Gig & Services Platform',
      description:
          'Contributed to the development of a gig-based service platform where users can discover, book, and manage on-demand services. Worked on implementing intuitive user flows, real-time interactions, and scalable Flutter UI components to support a fast and reliable service experience.',
      link:
          'https://play.google.com/store/apps/details?id=com.quickgig.customer',
      gradient: [Colors.orangeAccent, Colors.deepOrange],
    ),
  ];

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(const Duration(seconds: 2), (_) {
      if (_isHovering || !controller.hasClients) return;

      _currentPage = (_currentPage + 1) % apps.length;

      controller.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 900),
        curve: Curves.easeInOutCubicEmphasized,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Applications Built at Company',
                style: TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -0.5,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 90,
                ),
                margin: const EdgeInsets.only(top: 12, bottom: 50),
                height: 3,
                width: 72,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: const LinearGradient(
                    colors: [Colors.pinkAccent, Colors.cyanAccent],
                  ),
                ),
              ),
            ],
          ),
        ),

        SizedBox(
          height: 360,
          child: MouseRegion(
            onEnter: (_) => _isHovering = true,
            onExit: (_) => _isHovering = false,
            cursor: SystemMouseCursors.grab,
            child: PageView.builder(
              controller: controller,
              physics: const BouncingScrollPhysics(),
              itemCount: apps.length,
              itemBuilder: (context, index) {
                return AnimatedBuilder(
                  animation: controller,
                  builder: (context, child) {
                    double value = 1.0;

                    if (controller.position.haveDimensions) {
                      value = controller.page! - index;
                      value = (1 - value.abs() * 0.28).clamp(0.82, 1.0);
                    }

                    return Transform.translate(
                      offset: Offset(
                        0,
                        (1 - value) * 46, // floating depth
                      ),
                      child: Transform.scale(
                        scale: value,
                        child: Opacity(
                          opacity: value,
                          child: child,
                        ),
                      ),
                    );
                  },
                  child: CompanyAppCard(app: apps[index]),
                );
              },
            ),
          ),
        ),

        // subtle hint
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 60,
          ),
          child: const Text(
            '← swipe or drag →',
            style: TextStyle(
              fontSize: 12,
              color: Colors.white38,
              letterSpacing: 1.2,
            ),
          ),
        ),
      ],
    );
  }
}
