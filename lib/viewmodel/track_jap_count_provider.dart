import 'package:flutter/material.dart';

class TrackJapCountProvider extends ChangeNotifier{
  int _totalAllOverCount = 0;
  int _dailyTotalCount = 0;

  int get totalAllOverCount => _totalAllOverCount;
  int get  dailyTotalCount=> _dailyTotalCount;

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