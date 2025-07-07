// lib/widgets/social_row.dart
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialRow extends StatelessWidget {
  const SocialRow({super.key});

  void _launch(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri)) throw 'Could not launch $url';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            icon: const Icon(Icons.code),
            tooltip: "GitHub",
            onPressed: () => _launch("https://github.com/IamWaqasMuhammad")),
        IconButton(
            icon: const Icon(Icons.business),
            tooltip: "LinkedIn",
            onPressed: () => _launch("https://www.linkedin.com/in/waqas-muhammad-0ba609290/")),
        IconButton(
            icon: const Icon(Icons.email),
            tooltip: "Email",
            onPressed: () => _launch("mailto:waqasmuhammad5254@email.com")),
      ],
    );
  }
}
