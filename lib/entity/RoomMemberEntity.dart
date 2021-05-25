class RoomMemberEntity {
  final String nickName;
  final String email;

  RoomMemberEntity(this.nickName, this.email) {
    assert(nickName != null && nickName.isNotEmpty);
    assert(email != null && email.isNotEmpty);
  }
}
