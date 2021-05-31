import 'package:localstorage/localstorage.dart';
import 'package:onlinetodoshipping/common/Config.dart';

class ClearAllUserFormAddTodoInputUseCase {
  LocalStorage storage = new LocalStorage(UserInputDbName);

  void execute(String todoId) {
    storage.deleteItem(todoId);
  }
}
