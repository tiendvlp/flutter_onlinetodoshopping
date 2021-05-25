import 'RoomMemberEntity.dart';
import 'TodoItemEntity.dart';

class RoomEntity {
  String name;
  String id;
  int lastUpdate;
  final List<RoomMemberEntity> _members = <RoomMemberEntity>[];

  RoomEntity(
      this.name, this.id, this.lastUpdate, List<RoomMemberEntity> members) {
    assert(name != null || name.isNotEmpty,
        'RoomEntity.name can not be null || Empty');
    assert(
        id != null || id.isNotEmpty, 'RoomEntity.id can not be null || Empty');
    assert(lastUpdate != null || lastUpdate > 0,
        'RoomEntity.lastUpdate can not be null || Empty');
    _members.addAll(members);
  }

  List<RoomMemberEntity> get members => _members;

  void addMembers(List<RoomMemberEntity> mems) {
    _members.addAll(mems);
  }

  void addMember(RoomMemberEntity mem) {
    _members.add(mem);
  }
}
