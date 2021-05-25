import 'package:onlinetodoshipping/domain_interface/RequestRepository.dart';
import 'package:onlinetodoshipping/entity/RequestEntity.dart';

class GetAllRequestRepoActionImp implements GetAllRequestRepoAction {
  GetAllRequestRepoActionImp() {}

  @override
  Future<List<RequestEntity>> execute(String userEmail) async {}
}
