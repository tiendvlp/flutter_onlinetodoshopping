class TodoItemEntity {
  String id;
  bool _isDone;
  String _finisherEmail = '';
  String todoId;
  String title;
  String where = '';
  String price = '';
  String deadline = '';
  String count = '';
  // An available time allow user to know when does this item ready to buy. Ex: When the store open ?
  String availableTime = '';
  String type = '';
  String others = '';

  TodoItemEntity(this.id, this.todoId, this.title) {
    assert(id != null || id.isNotEmpty,
        'TodoItemEntity.id can not be null || Empty');
    assert(todoId != null || todoId.isNotEmpty,
        'TodoItemEntity.todoId can not be null || Empty');
  }

  bool get isDone {
    return _isDone;
  }

  String get finisherEmail {
    return _finisherEmail;
  }

  void done(String finisherEmail) {
    _finisherEmail = finisherEmail;
    _isDone = true;
  }

  void unDone() {
    _finisherEmail = '';
    _isDone = false;
  }
}
