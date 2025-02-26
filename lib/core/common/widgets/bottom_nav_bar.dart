import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:lg_task_two/features/home/presentation/screens/home_page.dart';
import 'package:lg_task_two/features/settings/presentation/screens/settings_page.dart';

class BottomNavBar extends StatefulWidget {
  final int initialIndex;

  const BottomNavBar({super.key, this.initialIndex = 0});

  @override
  BottomNavBarState createState() => BottomNavBarState();
}

class BottomNavBarState extends State<BottomNavBar> {
  late int _currentIndex = widget.initialIndex;

  List<Widget> _buildPages() {
    return [
      const HomePage(),
      SettingsPage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(opacity: animation, child: child);
        },
        switchInCurve: Curves.easeInOut,
        switchOutCurve: Curves.easeInOut,
        child: _buildPages()[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 14,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

          if (index == 0) {
            log("Home page selected");
          } else if (index == 1) {
            log("Settings page selected");
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Container(
              height: 40,
              width: 60,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Theme.of(context).colorScheme.surface,
              ),
              child: const Icon(Iconsax.home),
            ),
            activeIcon: Container(
              height: 40,
              width: 60,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Theme.of(context).colorScheme.secondary,
              ),
              child: const Icon(Iconsax.home),
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Container(
              height: 40,
              width: 60,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Theme.of(context).colorScheme.surface,
              ),
              child: const Icon(Iconsax.document),
            ),
            activeIcon: Container(
              height: 40,
              width: 60,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Theme.of(context).colorScheme.secondary,
              ),
              child: const Icon(Iconsax.document),
            ),
            label: "Settings",
          ),
        ],
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor:
            Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
    );
  }
}
