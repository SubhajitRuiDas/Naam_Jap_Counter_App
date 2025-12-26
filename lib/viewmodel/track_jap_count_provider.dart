import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:naam_jap_counter_app/utils/hive_keys.dart';

class TrackJapCountProvider extends ChangeNotifier{
  final Box _box = Hive.box('japBox');
  final Box _historyBox = Hive.box('japHistoryBox');

  int _totalAllOverCount = 0;
  int _dailyTotalCount = 0;

  TrackJapCountProvider() {
    _loadCounts();
  }

  void _loadCounts(){
    _totalAllOverCount = _box.get(HiveKeys.totalCount, defaultValue: 0);
    _dailyTotalCount = _box.get(HiveKeys.dailyCount, defaultValue: 0);
  }

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

    _box.put(HiveKeys.totalCount, _totalAllOverCount);
    _box.put(HiveKeys.dailyCount, _dailyTotalCount);

    notifyListeners();
  }

  void resetDailyCount(){
    final DateTime today = _todayDate();
    _historyBox.put(today, _dailyTotalCount);
    
    _dailyTotalCount = 0;
    _box.put(HiveKeys.dailyCount, 0);
    notifyListeners();
  }

  DateTime _todayDate(){
    final now = DateTime.now();
    return now;
  }

}