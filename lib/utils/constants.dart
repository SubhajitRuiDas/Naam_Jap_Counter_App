import 'package:flutter/material.dart';

String assetImage = "assets/images";

// colors
const Color saffronDark = Color(0xFF8E3B00);   
const Color saffronMid  = Color(0xFFB64A00);   
const Color saffronLight = Color(0xFFD86A00);  
const Color divineGold = Color(0xFFFFC94A);   
const Color divineYellow = Color(0xFFFFB300);
const Color malaBrown = Color(0xFF6A2C00);   
const Color malaLightBrown = Color(0xFF8A3A00);
const Color textPrimary = Color(0xFFFFE0A3); 
const Color textSecondary = Color(0xFFFFC977); 
const Color textMuted = Color(0xFFD9A441); 

// gradient
const LinearGradient saffronGradient = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [
    saffronDark,
    saffronMid,
  ],
);

const RadialGradient glowGradient = RadialGradient(
  center: Alignment.center,
  radius: 0.6,
  colors: [
    // divineGold,
    saffronLight,
    malaBrown,
  ],
);
