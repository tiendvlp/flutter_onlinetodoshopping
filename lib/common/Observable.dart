abstract class Observable<LISTENER> {
  void register(LISTENER listener);
  void unRegister(LISTENER listener);
}
