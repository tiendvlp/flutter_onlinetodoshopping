import 'package:localstorage/localstorage.dart';
import 'package:onlinetodoshipping/common/Config.dart';
import 'package:onlinetodoshipping/servicelocator/locator.dart';

class ApplicationLocator {
  static void setup() {
    locator.registerSingleton(() => ApplicationModule());
  }
}

class ApplicationModule {
  final LocalStorage localStorage = LocalStorage(UserInputDbName);
}
