import 'package:flutter/material.dart';
import 'package:naam_jap_counter_app/utils/constants.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: saffronGradient,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "NAAM JAP COUNTER APP",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: textPrimary,
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 20,),
              Image.asset(
                "${assetImage}/omm.png",
                height: 180,
              ),
              const SizedBox(height: 15,),
              const Text(
                'Track your daily mantra chanting\nwith peace and devotion',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  color: textSecondary,
                ),
              ),
              const SizedBox(height: 50,),
              ElevatedButton(
                onPressed: (){
                  Navigator.pushReplacementNamed(context, "/root");
                }, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: divineGold,
                  foregroundColor: saffronDark,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text("Start Naam Jap",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),),
              ),
            ],
          ),
        ),
      )
    );
  }
}