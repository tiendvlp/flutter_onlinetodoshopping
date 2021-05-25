import 'package:get_it/get_it.dart';
import 'package:onlinetodoshipping/domain_interface/RequestRepository.dart';

void main() {}

enum AnswerRequestResultType { Success, NetworkError, GeneralError }

class AnswerRequestResult {
  final AnswerRequestResultType type;

  AnswerRequestResult(this.type);
}

class AnswerRequestUseCase {
  AnswerRequestRepoAction _answerRequestRepoAction;

  AnswerRequestUseCase(AnswerRequestRepoAction answerRequestRepoAction) {
    _answerRequestRepoAction = answerRequestRepoAction;
    final getIt = GetIt.instance;
    getIt.registerFactory<AnswerRequestUseCase>(
        () => AnswerRequestUseCase(getIt.get()));
  }

  Future<AnswerRequestResult> execute(String requestId, String answer) async {
    await _answerRequestRepoAction.execute(requestId, answer);
    return AnswerRequestResult(AnswerRequestResultType.Success);
  }
}
