import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier{
  String languuageCode = "en";
  void changLanguge(langCode)
  {
    languuageCode = langCode;
    notifyListeners();
  }
}