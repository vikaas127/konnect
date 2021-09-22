import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';

class Network extends ChangeNotifier {
  ConnectivityResult? result;

  bool get wifi => result == ConnectivityResult.wifi;

  bool get mobile => result == ConnectivityResult.mobile;

  bool get none => result == ConnectivityResult.none || result == null;

  Network() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      print('Network => $this');
      this.result = result;
      notifyListeners();
    });
  }

  @override
  String toString() => jsonEncode({
        'wifi': wifi,
        'none': none,
        'mobile': mobile,
      });
}
