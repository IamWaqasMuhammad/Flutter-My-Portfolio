// lib/widgets/projects_section.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../controllers/nav_controller.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final nav = Get.find<NavController>();
    final isMobile = MediaQuery.of(context).size.width < 800;

    final projects = [
      {
        'title': 'Flutter Portfolio Website',
        'description': 'My own portfolio built with Flutter and GetX.',
        'image': 'assets/images/portfolio.png',
        'url': 'https://github.com/yourusername/ecommerce-app'
      },
      {
        'title': 'Food Hub App UI',
        'description': 'Food Hub App UI with few screens',
        'image': 'assets/images/food hub.jpeg',
        'url': 'https://github.com/yourusername/portfolio-app'
      },
      {
        'title': 'Coffee Shop App UI',
        'description': 'Coffee shop App UI with few screens',
        'image': 'assets/images/coffee shop.jpeg',
        'url': 'https://github.com/yourusername/portfolio-app'
      },
      {
        'title': 'WhatsApp App UI',
        'description': 'Complete WhatsApp UI Clone',
        'image': 'assets/images/food hub.jpeg',
        'url': 'https://github.com/yourusername/portfolio-app'
      },
      {
        'title': 'Calculator App UI',
        'description': 'Calculator for Arithmetic Operation',
        'image': 'assets/images/calculator.jpeg',
        'url': 'https://github.com/yourusername/portfolio-app'
      },
    ];

    return Container(
      key: nav.sectionKeys['projects'],
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Projects", style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 20),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: projects.map((proj) {
              return Card(
                elevation: 4,
                clipBehavior: Clip.antiAlias,
                child: SizedBox(
                  width: isMobile ? 300 : 400,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(proj['image']!, fit: BoxFit.cover, height: 200, width: double.infinity),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(proj['title']!, style: Theme.of(context).textTheme.titleMedium),
                            const SizedBox(height: 6),
                            Text(proj['description']!),
                            const SizedBox(height: 8),
                            ElevatedButton(
                              onPressed: () => launchUrl(Uri.parse(proj['url']!)),
                              child: const Text("View on GitHub"),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
