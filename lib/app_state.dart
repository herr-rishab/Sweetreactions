import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _height = prefs.getString('ff_height') ?? _height;
    });
    _safeInit(() {
      _weight = prefs.getString('ff_weight') ?? _weight;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _height = '';
  String get height => _height;
  set height(String value) {
    _height = value;
    prefs.setString('ff_height', value);
  }

  String _weight = '';
  String get weight => _weight;
  set weight(String value) {
    _weight = value;
    prefs.setString('ff_weight', value);
  }

  String _appMainGoal = '';
  String get appMainGoal => _appMainGoal;
  set appMainGoal(String value) {
    _appMainGoal = value;
  }

  String _appSpecificDiet = '';
  String get appSpecificDiet => _appSpecificDiet;
  set appSpecificDiet(String value) {
    _appSpecificDiet = value;
  }

  String _appSugarIssues = '';
  String get appSugarIssues => _appSugarIssues;
  set appSugarIssues(String value) {
    _appSugarIssues = value;
  }

  String _appGender = '';
  String get appGender => _appGender;
  set appGender(String value) {
    _appGender = value;
  }

  String _currentTime = '';
  String get currentTime => _currentTime;
  set currentTime(String value) {
    _currentTime = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
