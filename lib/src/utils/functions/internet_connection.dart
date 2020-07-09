import 'package:connectivity/connectivity.dart';
import 'package:footScore/src/utils/exceptions/errors.dart';
import 'package:footScore/src/utils/exceptions/exception.dart';

Future connectionChecker() async {
  try {
    final connection = await Connectivity().checkConnectivity();
    if (connection == ConnectivityResult.none) throw new InternetException();
  } on InternetException {
    throw new InternetFailure();
  } catch (e) {
    throw new Error();
  }
}
