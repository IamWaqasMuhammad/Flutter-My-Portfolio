import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/nav_controller.dart';
import '../widgets/nav_bar.dart';
import '../widgets/hero_section.dart';
import '../widgets/about_section.dart';
import '../widgets/skills_section.dart';
import '../widgets/contact_section.dart';
import '../widgets/footer.dart';
import '../widgets/projects_section.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    final navController = Get.put(NavController());

    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children: [
            NavBar(),
             HeroSection(),
             AboutSection(),
             SkillsSection(),
             ProjectsSection(),
             ContactSection(),
             const Footer(),
          ],
        ),
      ),
    );
  }
}
