import 'package:localstorage/localstorage.dart';
import 'package:onlinetodoshipping/common/Config.dart';

class GetSingleUserFormInputUseCase {
  LocalStorage storage = new LocalStorage(UserInputDbName);

  String execute(String todoId, String requestType) {
    return storage.getItem(todoId)[requestType].toString();
  }
}
