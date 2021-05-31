import 'package:onlinetodoshipping/requests/AnswerRequestUseCase.dart';
import 'package:onlinetodoshipping/requests/ClearRequestUseCase.dart';
import 'package:onlinetodoshipping/rooms/CreateRoomUseCase.dart';
import 'package:onlinetodoshipping/rooms/GetRoomUseCase.dart';
import 'package:onlinetodoshipping/servicelocator/locator.dart';
import 'package:onlinetodoshipping/todo_item/CreateNewTodoItemUseCase.dart';
import 'package:onlinetodoshipping/todo_item/GetAllTodoItemUseCase.dart';
import 'package:onlinetodoshipping/todo_item/RemoveTodoItemUseCase.dart';
import 'package:onlinetodoshipping/todo_item/UpdateTodoItemInfoUseCase.dart';
import 'package:onlinetodoshipping/todo_item/UpdateTodoItemStateUseCase.dart';
import 'package:onlinetodoshipping/todo_list/CreateTodoListUseCase.dart';
import 'package:onlinetodoshipping/todo_list/GetTodoListUseCase.dart';
import 'package:onlinetodoshipping/todo_list/UpdateTodoListTitleUseCase.dart';

class DomainLocator {
  static void setup() {
    _setupRoomUseCases();
    _setupNotificationUseCases();
    _setupRequestUseCases();
    _setupUserUseCases();
    _setupTodoItemUseCases();
    _setupTodoListUseCases();
  }

  static void _setupRoomUseCases() {
    locator
        .registerFactory(() => CreateRoomUseCase(locator.get(), locator.get()));
    locator.registerFactory(() => GetRoomUseCase(locator.get()));
  }

  static void _setupNotificationUseCases() {}

  static void _setupRequestUseCases() {
    locator.registerFactory(() => AnswerRequestUseCase(locator.get()));
    locator.registerFactory(() => ClearRequestUseCase(locator.get()));
  }

  static void _setupUserUseCases() {}

  static void _setupTodoItemUseCases() {
    locator.registerFactory(() => CreateNewTodoItemUseCase(locator.get()));
    locator.registerFactory(() => GetAllTodoItemUseCase(locator.get()));
    locator.registerFactory(() => RemoveTodoItemUseCase(locator.get()));
    locator.registerFactory(() => UpdateTodoItemInfoUseCase(locator.get()));
    locator.registerFactory(() => UpdateTodoItemStateUseCase(locator.get()));
  }

  static void _setupTodoListUseCases() {
    locator.registerFactory(() => CreateTodoListUseCase(locator.get()));
    locator.registerFactory(() => GetTodoListUseCase(locator.get()));
    locator.registerFactory(() => UpdateTodoListTitleUseCase(locator.get()));
  }
}
