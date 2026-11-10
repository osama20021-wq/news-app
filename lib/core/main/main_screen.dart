import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/bookmark/book_mark_screen.dart';
import 'package:flutter_application_1/features/news/home/screen/home_screen.dart';
import 'package:flutter_application_1/features/profile/profile_screen.dart';
import 'package:flutter_application_1/features/search/search_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 0;
  final List<Widget> _screens = [
    HomeScreen(),
    SearchScreen(),
    BookMarkScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 84,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          selectedItemColor: Theme.of(context).primaryColor,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              label: "Home",
              icon: _svgImage(0, "images/Icon-home.svg"),
            ),
            BottomNavigationBarItem(
              label: "Search",
              icon: _svgImage(1, "images/search_Icon.svg"),
            ),
            BottomNavigationBarItem(
              label: "Bookmark",
              icon: _svgImage(2, "images/save_Icon.svg"),
            ),
            BottomNavigationBarItem(
              label: "Profile",
              icon: _svgImage(3, "images/Icon-person.svg"),
            ),
          ],
        ),
      ),
      body: Scaffold(body: SafeArea(child: _screens[currentIndex])),
    );
  }

  Widget _svgImage(int index, String imagePath) {
    return SvgPicture.asset(
      height: 20,
      width: 20,
      imagePath,
      colorFilter: ColorFilter.mode(
        currentIndex == index
            ? Theme.of(context).primaryColor
            : Color(0xFF363636),
        BlendMode.srcIn,
      ),
    );
  }
}
