import 'package:connectivity_plus/connectivity_plus.dart';

Future<bool> checkInternetConnection() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult.isNotEmpty) {
    return ConnectivityResult.wifi == connectivityResult[0] ||
        ConnectivityResult.mobile == connectivityResult[0];
  }
  return false;
}
