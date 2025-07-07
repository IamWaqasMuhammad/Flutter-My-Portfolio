// lib/widgets/about_section.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/nav_controller.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final nav = Get.find<NavController>();
    final width = MediaQuery.of(context).size.width;

    return Container(
      key: nav.sectionKeys['about'],
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("About Me", style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 20),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: width > 800 ? 700 : width * 0.9),
            child: const Text(
              "I'm Waqas Muhammad, a Flutter developer with a passion for crafting beautiful, responsive, and performant apps. "
                  "Currently a BSCS student at UET Peshawar, I’m also exploring backend technologies like Node.js and MongoDB. "
                  "I aim to become a team leader and problem solver in the tech industry.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}
