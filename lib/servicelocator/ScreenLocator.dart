import 'package:get_it/get_it.dart';
import 'package:onlinetodoshipping/screen/loginscreen/controller/LoginController.dart';
import 'package:onlinetodoshipping/screen/mainscreen/controller/RoomController.dart';
import 'package:onlinetodoshipping/screen/mainscreen/model/MainPageState.dart';
import 'package:onlinetodoshipping/screen/roomscreen/constrollers/TodoListController.dart';
import 'package:onlinetodoshipping/screen/roomscreen/model/RoomScreenState.dart';
import 'package:onlinetodoshipping/screen/todoscreen/controller/TodoController.dart';
import 'package:onlinetodoshipping/screen/todoscreen/model/TodoScreenState.dart';
import 'package:onlinetodoshipping/servicelocator/locator.dart';

class ScreenLocator {
  static void setup() {
    _setupMainScreenControllers();
    _setupRoomScreenControllers();
    _setupTodoScreen();
  }

  static void _setupRoomScreenControllers() {
    locator.registerFactoryParam<TodoListController, RoomScreenState, void>(
        (p1, p2) => TodoListController(locator.get(), p1));
  }

  static void _setupMainScreenControllers() {
    locator.registerFactoryParam<RoomController, MainPageState, void>(
        (mainPageState, _) => RoomController(mainPageState, locator.get()));
    locator.registerFactory<LoginController>(() => LoginController());
  }

  static void _setupTodoScreen() {
    locator.registerFactoryParam<TodoController, TodoScreenState, void>(
        (todoScreenState, _) =>
            TodoController(locator.get(), todoScreenState, locator.get()));
  }
}
