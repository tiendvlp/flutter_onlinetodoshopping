import 'package:localstorage/localstorage.dart';
import 'package:onlinetodoshipping/common/Config.dart';
import 'package:onlinetodoshipping/entity/RequestType.dart';
import 'package:onlinetodoshipping/screen/common/helper/Helper.dart';

class SaveUserAddTodoFormInputUseCase {
  LocalStorage storage = new LocalStorage(UserInputDbName);

  void execute(String todoId, RequestType type, String content) {
    Map<String, Object> currentDoc = Map<String, Object>();
    if (storage.getItem(todoId) != null) {
      currentDoc = storage.getItem(todoId);
    }
    currentDoc[getEnumValue(type)] = content;
    storage.setItem(todoId, currentDoc);
  }
}
