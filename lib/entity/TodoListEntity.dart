class TodoListEntity {
  String title;
  String id;
  String roomId;
  int finishedCount;
  int totalItems;
  int latestUpdate;

  TodoListEntity(this.title, this.id, this.roomId, this.finishedCount,
      this.totalItems, this.latestUpdate) {
    assert(id != null || id.isNotEmpty,
        'TodoListEntity.id can not be null || Empty');
    assert(title != null || title.isNotEmpty,
        'TodoListEntity.name can not be null || Empty');
  }
}
