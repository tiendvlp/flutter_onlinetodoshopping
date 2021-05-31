import 'RequestType.dart';

class RequestEntity {
  final String id;
  final String roomId;
  final String todoId;
  final String roomName;
  final String todoTitle;
  final int date;
  final RequestType question;
  String answer;

  RequestEntity(this.id, this.roomId, this.roomName, this.todoId, this.question,
      this.todoTitle, this.date) {
    assert(roomId != null || roomId.isNotEmpty,
        'RequestEntity.roomId could not be null or empty');

    assert(roomName != null || roomName.isNotEmpty,
        'RequestEntity.roomName could not be null or empty');

    assert(todoId != null || todoId.isNotEmpty,
        'RequestEntity.todoId could not be null or empty');

    assert(
        question != null, 'RequestEntity.question could not be null or empty');

    assert(todoTitle != null || todoTitle.isNotEmpty,
        'RequestEntity.todoTitle could not be null or empty');
  }
}
