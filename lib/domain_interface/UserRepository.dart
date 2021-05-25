import 'package:onlinetodoshipping/entity/UserEntity.dart';

abstract class AddUserRepoAction {
  Future<void> execute(String email);
}

abstract class UpdateUserNickNameRepoAction {
  Future<void> execute(String userEmail, String nickName);
}

abstract class AddJoinedRoomIdRepoAction {
  Future<void> execute(String userEmail, String newRoomId);
}

abstract class RemoveJoinedRoomIdRepoAction {
  Future<void> execute(String userEmail, String newRoomId);
}

abstract class GetUserRepoAction {
  Future<UserEntity> execute(String userEmail);
}
