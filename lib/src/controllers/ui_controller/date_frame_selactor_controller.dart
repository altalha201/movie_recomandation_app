import 'package:flutter/material.dart';
import 'package:model/model.dart';
import 'package:provider/provider.dart';

import '../data_controller/tranding_controllers.dart';

class DateFrameSelectorController extends ChangeNotifier {
  int _value = 1;

  int get value => _value;

  void updateValue(BuildContext context, int? val) {
    _value = val ?? 1;
    notifyListeners();
    var trandingController = Provider.of<TrandingController>(
      context,
      listen: false,
    );
    switch (_value) {
      case 2:
        trandingController.getTrandings(timeWindow: TrandingTimeFrame.week);
        break;
      case 1:
      default:
        trandingController.getTrandings();
        break;
    }
  }
}
