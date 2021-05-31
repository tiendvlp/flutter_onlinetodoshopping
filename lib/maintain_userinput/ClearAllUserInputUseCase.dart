import 'package:localstorage/localstorage.dart';
import 'package:onlinetodoshipping/common/Config.dart';

class ClearAllUserInputUseCase {
  LocalStorage storage = new LocalStorage(UserInputDbName);

  void execute() {
    storage.clear();
  }
}
