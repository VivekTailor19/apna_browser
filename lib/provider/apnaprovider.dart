import 'package:flutter/cupertino.dart';

class ApnaProvider extends ChangeNotifier
{
  double p1 = 0;

  void changeprogress(double updated)
  {
    p1 = updated;
    notifyListeners();
  }
}