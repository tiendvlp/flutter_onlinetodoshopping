class TodoListEntity {
  String name;
  String id;
  String roomId;

  TodoListEntity(this.name, this.id, this.roomId) {
    assert(id != null || id.isNotEmpty,
        'TodoListEntity.id can not be null || Empty');
    assert(name != null || name.isNotEmpty,
        'TodoListEntity.name can not be null || Empty');
  }
}
