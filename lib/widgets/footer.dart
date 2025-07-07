// lib/widgets/footer.dart
import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      width: double.infinity,
      color: Theme.of(context).colorScheme.surfaceVariant,
      child: Column(
        children: const [
          Text("© 2025 Waqas Muhammad", style: TextStyle(fontSize: 14)),
          SizedBox(height: 8),
          Text("Built with Flutter 💙", style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}
