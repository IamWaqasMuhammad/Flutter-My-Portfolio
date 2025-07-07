import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/nav_controller.dart';
import 'social_row.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final nav = Get.find<NavController>();
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Container(
      key: nav.sectionKeys['home'],
      width: double.infinity,
      height: isMobile ? 500 : 600,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/profile.png'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.6), // adjust opacity here
            BlendMode.darken,
          ),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.black54,
              Colors.white24,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("👋 Hi, I’m", style: TextStyle(fontSize: 18, color: Colors.white)),
              Text(
                "Waqas Muhammad",
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              const Text(
                "Flutter Developer | Backend Learner | UET CS Student",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70),
              ),
              const SizedBox(height: 24),
              Wrap(
                spacing: 16,
                runSpacing: 10,
                alignment: WrapAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () => nav.scrollTo("contact"),
                    icon: const Icon(Icons.mail),
                    label: const Text("Hire Me"),
                  ),
                  OutlinedButton.icon(
                    onPressed: () async {
                      final uri = Uri.parse("https://yourdomain.com/waqas_resume.pdf");
                      if (await canLaunchUrl(uri)) {
                        await launchUrl(uri);
                      }
                    },
                    icon: const Icon(Icons.download),
                    label: const Text("Resume"),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const SocialRow(),
            ],
          ),
        ),
      ),
    );
  }
}
