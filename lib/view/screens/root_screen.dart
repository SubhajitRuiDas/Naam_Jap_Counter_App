import 'package:flutter/material.dart';
import 'package:naam_jap_counter_app/utils/constants.dart';
import 'package:naam_jap_counter_app/view/screens/home_screen.dart';
import 'package:naam_jap_counter_app/view/screens/mantra_screen.dart';
import 'package:naam_jap_counter_app/view/screens/stats_screen.dart';
import 'package:naam_jap_counter_app/viewmodel/theme_provider.dart';
import 'package:provider/provider.dart';

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int _pageIndex = 0;

  void togglePagesIndex(int ind){
    setState(() {
      _pageIndex = ind;
    });
  }

  List<Widget> pages = [
    const HomeScreen(),
    const StatsScreen(),
    const MantraScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              context.read<ThemeProvider>().toggleTheme();
            }, 
            icon: themeProvider.isDarkTheme ? 
            Icon(Icons.dark_mode) : Icon(Icons.light_mode),
          ),
        ],
      ),
      body: pages[_pageIndex],
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle_outline_rounded),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bar_chart),
          label: 'Stats',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu_book),
          label: 'Mantras',
        ),
      ],
      currentIndex: _pageIndex,
      onTap: (value) {
        togglePagesIndex(value);
      },
      selectedItemColor: saffronMid,
      ),
    );
  }
}