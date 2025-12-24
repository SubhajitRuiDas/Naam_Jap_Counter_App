import 'package:flutter/material.dart';

class TrackJapCountProvider extends ChangeNotifier{
  int _totalAllOverCount = 0;
  int _dailyTotalCount = 0;

  static const int _malaLimit = 108;
  int get totalAllOverCount => _totalAllOverCount;
  int get  dailyTotalCount=> _dailyTotalCount;

  int get malaJapCount => _dailyTotalCount ~/ _malaLimit;
  int get currentMalaJap => _dailyTotalCount % _malaLimit;
  int get malaJapCountPercentage => ((currentMalaJap/_malaLimit)*100).toInt();

  double get malaJapCountPercent => currentMalaJap/_malaLimit;

  void increaseCount() {
    _totalAllOverCount = _totalAllOverCount+1;
    _dailyTotalCount = _dailyTotalCount+1;
    notifyListeners();
  }

  void resetDailyCount(){
    _dailyTotalCount = 0;
    notifyListeners();
  }

}