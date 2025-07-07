import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/nav_controller.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  bool isMenuOpen = false;

  @override
  Widget build(BuildContext context) {
    final nav = Get.find<NavController>();
    final isMobile = MediaQuery.of(context).size.width < 800;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
      width: double.infinity,
      color: Theme.of(context).colorScheme.background,
      child: isMobile ? _buildMobileNav(nav) : _buildDesktopNav(nav),
    );
  }

  /// 🟡 Mobile View with Hamburger Menu
  Widget _buildMobileNav(NavController nav) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset('assets/images/profile.png', height: 32),
                const SizedBox(width: 8),
                const Text(
                  "Waqas",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.brightness_6),
                  onPressed: () => Get.changeThemeMode(
                    Get.isDarkMode ? ThemeMode.light : ThemeMode.dark,
                  ),
                ),
                IconButton(
                  icon: Icon(isMenuOpen ? Icons.close : Icons.menu),
                  onPressed: () => setState(() => isMenuOpen = !isMenuOpen),
                ),
              ],
            ),
          ],
        ),
        if (isMenuOpen)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: _buildNavItems(nav),
          ),
      ],
    );
  }

  /// 🟢 Desktop/Tablet View with Safe Layout
  Widget _buildDesktopNav(NavController nav) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// Logo + Name
        Row(
          children: [
            CircleAvatar(
              backgroundImage:  AssetImage('assets/images/profile.png'),
            ),
            const SizedBox(width: 8),
            const Text(
              "Waqas",
              style: TextStyle(fontSize: 24, fontFamily: 'Poppins', fontWeight: FontWeight.bold),
            ),
          ],
        ),

        /// Nav Items + Theme Toggle in WRAP
        Flexible(
          child: Wrap(
            alignment: WrapAlignment.end,
            spacing: 12,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              ..._buildNavItems(nav),
              IconButton(
                icon: const Icon(Icons.brightness_6),
                onPressed: () => Get.changeThemeMode(
                  Get.isDarkMode ? ThemeMode.light : ThemeMode.dark,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Common Nav Items List
  List<Widget> _buildNavItems(NavController nav) {
    final sections = ['home', 'about', 'skills', 'projects', 'contact'];
    return sections
        .map(
          (section) => TextButton(
        onPressed: () {
          setState(() => isMenuOpen = false);
          nav.scrollTo(section);
        },
        child: Text(
          section.capitalizeFirst!,
          style: const TextStyle(fontSize: 16),
        ),
      ),
    )
        .toList();
  }
}
