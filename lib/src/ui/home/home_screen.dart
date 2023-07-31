import 'package:clean_architecture/src/common/resource/fonts.dart';
import 'package:clean_architecture/src/common/utils/ui.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../common/assets/colors.gen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/homeScreen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final _screens = [
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.yellow,
    ),
    Container(
      color: Colors.blue,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    setNavColor();
    final screenTitles = [
      'main',
      'global',
      'publish',
      'profile',
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: ColorName.darkGreen,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(
            () {
              selectedIndex = index;
            },
          );
        },
        selectedItemColor: ColorName.white,
        unselectedItemColor: Colors.white.withAlpha(72),
        unselectedLabelStyle: const TextStyle(color: Colors.black12),
        items: const [
          BottomNavigationBarItem(
            label: 'main',
            icon: Icon(Icons.pending),
          ),
          BottomNavigationBarItem(
            label: 'global',
            icon: Icon(Icons.public),
          ),
          BottomNavigationBarItem(
            label: 'publish',
            icon: Icon(Icons.add),
          ),
          BottomNavigationBarItem(
            label: 'profile',
            icon: Icon(Icons.person),
          ),
        ],
      ),
      appBar: AppBar(
        elevation: 0,
        title: Text(
          screenTitles[selectedIndex].tr(),
          style: primaryTextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: ColorName.primaryColorBlack,
      ),
      body: _screens[selectedIndex],
    );
  }
}
