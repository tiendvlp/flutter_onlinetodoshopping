import 'package:onlinetodoshipping/domain_interface/RequestRepository.dart';
import 'package:onlinetodoshipping/entity/RequestEntity.dart';

class GetTodoRequestRepoActionImp implements GetTodoRequestRepoAction {
  GetTodoRequestRepoActionImp() {}

  @override
  Future<List<RequestEntity>> execute(String todoId) async {
  }
}
