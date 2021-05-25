import 'package:onlinetodoshipping/domain_interface/RequestRepository.dart';
import 'package:onlinetodoshipping/entity/RequestEntity.dart';

class GetRoomRequestRepoActionImp implements GetRoomRequestRepoAction {
  GetRoomRequestRepoActionImp() {}

  @override
  Future<List<RequestEntity>> execute(String roomId) async {}
}
