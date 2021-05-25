import 'package:onlinetodoshipping/common/Observable.dart';

abstract class BaseObservable<LISTENER> implements Observable<LISTENER> {
  Set<LISTENER> _listeners = Set();

  void register(LISTENER listener) {
    _listeners.add(listener);
  }

  void unRegister(LISTENER listener) {
    _listeners.remove(listener);
  }

  Set<LISTENER> get listeners => _listeners;
}
