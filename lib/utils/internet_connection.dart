
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';

class InternetConnection {
  checkInternet() async{
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    else{
      return false;
    }
  }
}