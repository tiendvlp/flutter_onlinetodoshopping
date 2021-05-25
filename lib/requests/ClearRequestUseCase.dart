import 'package:get_it/get_it.dart';
import 'package:onlinetodoshipping/domain_interface/RequestRepository.dart';

import 'AnswerRequestUseCase.dart';

enum ClearRequestResultType { Success, NetworkError, GeneralError }

class ClearRequestResult {
  final ClearRequestResultType type;

  ClearRequestResult(this.type);
}

class ClearRequestUseCase {
  RemoveAllRequestRepoAction _removeAllRequestRepoAction;

  ClearRequestUseCase(RemoveAllRequestRepoAction removeAllRequestRepoAction) {
    _removeAllRequestRepoAction = removeAllRequestRepoAction;
    final getIt = GetIt.instance;
    getIt.registerFactory<AnswerRequestUseCase>(
        () => AnswerRequestUseCase(getIt.get()));
  }

  Future<ClearRequestResult> execute(String userEmail) async {
    await _removeAllRequestRepoAction.execute(userEmail);
    return ClearRequestResult(ClearRequestResultType.Success);
  }
}
