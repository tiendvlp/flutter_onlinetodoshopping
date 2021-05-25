import 'package:onlinetodoshipping/domain_interface/RequestRepository.dart';
import 'package:onlinetodoshipping/entity/QuestionEntity.dart';

class CreateNewRequestRepoActionImp implements CreateNewRequestRepoAction {
  CreateNewRequestRepoActionImp() {}

  @override
  Future<void> execute(String roomId, String roomName, String todoId,
      String todoTitle, QuestionEntity question) async {}
}
