import 'package:flutter/material.dart';
import '../widgets/feature_project_card.dart';

class SideProjectsSection extends StatelessWidget {
  SideProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 120),
        const Text(
          'Tools & Developer Utilities',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 40),
        FeatureProjectCard(
          title: 'Clean Flutter BLoC Feature',
          description:
              'A VS Code extension that generates clean BLoC feature templates for Flutter, reducing boilerplate and enforcing scalable architecture.',
          tech: 'JavaScript • VS Code API',
          link:
              'https://open-vsx.org/extension/samarth/clean-flutter-bloc-feature',
          icon: Icons.extension,
        ),
      ],
    );
  }
}
