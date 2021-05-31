import 'package:localstorage/localstorage.dart';
import 'package:onlinetodoshipping/common/Config.dart';

class GetAllUserFormInputUseCase {
  LocalStorage storage = new LocalStorage(UserInputDbName);

  Map<String, String> execute(String todoId) {
    Map<String, Object> result = storage.getItem(todoId);

    if (result == null) {
      return null;
    }
    return result.map((key, value) => MapEntry(key, value.toString()));
  }
}
