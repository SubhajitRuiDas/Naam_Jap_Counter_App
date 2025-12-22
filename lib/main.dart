import 'package:flutter/material.dart';
import 'package:naam_jap_counter_app/utils/app_theme.dart';
import 'package:naam_jap_counter_app/view/screens/home_screen.dart';
import 'package:naam_jap_counter_app/view/screens/root_screen.dart';
import 'package:naam_jap_counter_app/view/screens/splash_screen.dart';
import 'package:naam_jap_counter_app/viewmodel/theme_provider.dart';
import 'package:naam_jap_counter_app/viewmodel/track_jap_count_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => TrackJapCountProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Naam Jap App',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.themeMode,
      initialRoute: "/",
      routes: {
        "/": (context) => const SplashScreen(),
        "/root": (context) => const RootScreen(),
        "/home": (context) => const HomeScreen(),
      },
    );
  }
}