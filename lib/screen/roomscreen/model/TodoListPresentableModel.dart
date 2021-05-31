import 'package:intl/intl.dart';

class TodoListPresentableModel implements Comparable<TodoListPresentableModel> {
  final String title;
  final String id;
  final int finishedCount;
  final int totalItem;
  final int _latestUpdate;
  String _lastestUpdateInString;

  String get latestUpdate => _lastestUpdateInString;

  TodoListPresentableModel(this.title, this.id, this.finishedCount,
      this.totalItem, this._latestUpdate) {
    final formater = DateFormat("hh:mm E-dd-M");
    _lastestUpdateInString =
        formater.format(DateTime.fromMillisecondsSinceEpoch(_latestUpdate));
  }

  @override
  int compareTo(TodoListPresentableModel other) {
    if (other.id == id) {
      return 0;
    }
    if (other._latestUpdate > _latestUpdate) {
      return 1;
    }

    return -1;
  }
}
