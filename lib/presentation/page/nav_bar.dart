import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:myapp/presentation/page/create_feed_page.dart';
import 'package:myapp/presentation/page/home_page.dart';
import 'package:myapp/presentation/page/profile_page.dart';

enum _SelectedTab {
  home,
  // favorite,
  add,
  // search,
  person,
}

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  var _selectedTab = _SelectedTab.home;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: _SelectedTab.values.indexOf(_selectedTab),
        children: [
          // Halaman Home
          HomePage(),
          CreateFeedPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: CrystalNavigationBar(
        currentIndex: _SelectedTab.values.indexOf(_selectedTab),
        height: 10,
        // indicatorColor: Colors.blue,
        unselectedItemColor: Colors.pink[500],
        backgroundColor: Colors.pink.withOpacity(0.1),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.5),
            blurRadius: 4,
            spreadRadius: 2,
            offset: Offset(0, 4),
          ),
        ],
        onTap: _handleIndexChanged,
        items: [
          /// Home
          CrystalNavigationBarItem(
            icon: IconlyBold.home,
            unselectedIcon: IconlyLight.home,
            selectedColor: Colors.pink,
          ),

          /// Favourite
          // CrystalNavigationBarItem(
          //   icon: IconlyBold.heart,
          //   unselectedIcon: IconlyLight.heart,
          //   selectedColor: Colors.red,
          // ),

          /// Add
          CrystalNavigationBarItem(
            icon: IconlyBold.plus,
            unselectedIcon: IconlyLight.plus,
            selectedColor: Colors.pink,
          ),

          /// Search
          // CrystalNavigationBarItem(
          //     icon: IconlyBold.search,
          //     unselectedIcon: IconlyLight.search,
          //     selectedColor: Colors.pink),

          /// Profile
          CrystalNavigationBarItem(
            icon: IconlyBold.user_2,
            unselectedIcon: IconlyLight.user,
            selectedColor: Colors.pink,
          ),
        ],
      ),
    );
  }
}
