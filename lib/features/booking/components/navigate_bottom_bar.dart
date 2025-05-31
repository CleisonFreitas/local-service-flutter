import 'package:flutter/material.dart';
import 'package:local_services/core/constants/app_colors.dart';
import 'package:local_services/shared/components/content_container.dart';
import 'package:local_services/shared/components/custom_navigate_menu.dart';

class NavigateBottomBar extends StatefulWidget {
  final List<Widget> pages;
  const NavigateBottomBar({super.key, required this.pages});

  @override
  State<NavigateBottomBar> createState() => _NavigateBottomBarState();
}

class _NavigateBottomBarState extends State<NavigateBottomBar> {
  int currentPageIndex = 0;
  List<Widget> get _pages => widget.pages;

  final List<CustomNavigateMenu> _navigationDestinations = [
    CustomNavigateMenu(icon: Icons.home_filled),
    CustomNavigateMenu(icon: Icons.assistant_navigation),
    CustomNavigateMenu(icon: Icons.calendar_month),
    CustomNavigateMenu(icon: Icons.notifications, hasBadge: true),
    CustomNavigateMenu(icon: Icons.person),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        backgroundColor: AppColors.input,
        selectedIndex: currentPageIndex,
        animationDuration: const Duration(milliseconds: 300),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.transparent,
        indicatorShape: CircleBorder(),
        destinations: _navigationDestinations,
      ),
      body: ContentContainer(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 70),
          child: _pages[currentPageIndex],
        ),
      ),
    );
  }
}
