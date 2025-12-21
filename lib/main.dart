import 'package:flutter/material.dart';
import 'package:naam_jap_counter_app/view/screens/home_screen.dart';
import 'package:naam_jap_counter_app/view/screens/splash_screen.dart';
import 'package:naam_jap_counter_app/viewmodel/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Naam Jap App',
      initialRoute: "/",
      routes: {
        "/": (context) => const SplashScreen(),
        "/home": (context) => const HomeScreen(),
      },
    );
  }
}