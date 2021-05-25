import 'package:onlinetodoshipping/domain_interface/TodoItemRepository.dart';

enum UpdateTodoItemStateResultType { Success, NetworkError, GeneralError }

class UpdateTodoItemStateResult {
  UpdateTodoItemStateResultType type;

  UpdateTodoItemStateResult(this.type);
}

class UpdateTodoItemStateUseCase {
  UpdateTodoItemDoneStateRepoAction _updateTodoItemDoneState;

  UpdateTodoItemStateUseCase(
      UpdateTodoItemDoneStateRepoAction updateTodoItemDoneState) {
    _updateTodoItemDoneState = updateTodoItemDoneState;
  }

  Future<UpdateTodoItemStateResult> execute(
      String id, bool isDone, String finisherEmail) async {
    assert(isDone && (finisherEmail != null && finisherEmail.isNotEmpty),
        'UpdateTodoItemStateUseCase: finisherEmail could not be null when isDone = true');
    await _updateTodoItemDoneState.execute(id, isDone ? finisherEmail : '');
    return UpdateTodoItemStateResult(UpdateTodoItemStateResultType.Success);
  }
}
