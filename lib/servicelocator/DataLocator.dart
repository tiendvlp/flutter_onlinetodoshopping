import 'package:onlinetodoshipping/datasource/datamapper/RoomDataMapper.dart';
import 'package:onlinetodoshipping/datasource/datamapper/TodoListDataMapper.dart';
import 'package:onlinetodoshipping/datasource/repository/request/AnswerRequestRepoActionImp.dart';
import 'package:onlinetodoshipping/datasource/repository/request/CreateNewRequestRepoActionImp.dart';
import 'package:onlinetodoshipping/datasource/repository/request/GetAllRequestRepoActionImp.dart';
import 'package:onlinetodoshipping/datasource/repository/request/GetRoomRequestRepoActionImp.dart';
import 'package:onlinetodoshipping/datasource/repository/request/GetTodoRequestRepoActionImp.dart';
import 'package:onlinetodoshipping/datasource/repository/request/RemoveAllRoomRequestRepoActionImp.dart';
import 'package:onlinetodoshipping/datasource/repository/request/RemoveRequestRepoActionImp.dart';
import 'package:onlinetodoshipping/datasource/repository/request/RemoveTodoRequestRepoActionImp.dart';
import 'package:onlinetodoshipping/datasource/repository/room/AddRoomRepoActionImp.dart';
import 'package:onlinetodoshipping/datasource/repository/room/GetRoomsRepoActionImp.dart';
import 'package:onlinetodoshipping/datasource/repository/todoitem/AddTodoItemRepoActionImp.dart';
import 'package:onlinetodoshipping/datasource/repository/todoitem/GetTodoItemRepoActionImp.dart';
import 'package:onlinetodoshipping/datasource/repository/todoitem/RemoveTodoItemRepoActionImp.dart';
import 'package:onlinetodoshipping/datasource/repository/todoitem/UpdateTodoItemDoneStateRepoActionImp.dart';
import 'package:onlinetodoshipping/datasource/repository/todoitem/UpdateTodoItemsRepoActionImp.dart';
import 'package:onlinetodoshipping/datasource/repository/todolist/AddTodoListRepoActionImp.dart';
import 'package:onlinetodoshipping/datasource/repository/todolist/GetRoomTodoListRepoActionImp.dart';
import 'package:onlinetodoshipping/datasource/repository/todolist/UpdateTodoListTitleRepoActionImp.dart';
import 'package:onlinetodoshipping/domain_interface/RequestRepository.dart';
import 'package:onlinetodoshipping/domain_interface/RoomRepository.dart';
import 'package:onlinetodoshipping/domain_interface/TodoItemRepository.dart';
import 'package:onlinetodoshipping/domain_interface/TodoListRepository.dart';

import 'locator.dart';

class DataLocator {
  static void setup() {
    _setupDataMapper();
    _setupRequestRepositories();
    _setupRoomRepositories();
    _setupTodoItemRepositories();
    _setupTodoListRepositories();
  }

  static void _setupRequestRepositories() {
    locator.registerFactory<CreateNewRequestRepoAction>(
        () => CreateNewRequestRepoActionImp());

    locator.registerFactory<RemoveRequestRepoAction>(
        () => RemoveRequestRepoActionImp());

    locator.registerFactory<RemoveTodoRequestRepoAction>(
        () => RemoveTodoRequestRepoActionImp());

    locator.registerFactory<RemoveAllRoomRequestRepoAction>(
        () => RemoveAllRoomRequestRepoActionImp());

    locator.registerFactory<GetAllRequestRepoAction>(
        () => GetAllRequestRepoActionImp());

    locator.registerFactory<GetTodoRequestRepoAction>(
        () => GetTodoRequestRepoActionImp());

    locator.registerFactory<GetRoomRequestRepoAction>(
        () => GetRoomRequestRepoActionImp());

    locator.registerFactory<AnswerRequestRepoAction>(
        () => AnswerRequestRepoActionImp());
  }

  static void _setupRoomRepositories() {
    locator.registerFactory<AddRoomRepoAction>(() => AddRoomRepoActionImp());

    locator.registerFactory<GetAllUserRoomsRepoAction>(
        () => GetAllUserRoomsRepoActionImp(locator.get()));
  }

  static void _setupTodoItemRepositories() {
    locator.registerFactory<AddTodoItemRepoAction>(
        () => AddTodoItemRepoActionImp());
    locator.registerFactory<GetTodoItemsRepoAction>(
        () => GetTodoItemRepoActionImp());
    locator.registerFactory<UpdateTodoItemsRepoAction>(
        () => UpdateTodoItemsRepoActionImp());
    locator.registerFactory<UpdateTodoItemDoneStateRepoAction>(
        () => UpdateTodoItemDoneStateRepoActionImp());
    locator.registerFactory<RemoveTodoItemRepoAction>(
        () => RemoveTodoItemRepoActionImp());
  }

  static void _setupDataMapper() {
    locator.registerFactory(() => RoomDataMapper());
    locator.registerFactory(() => TodoListDataMapper());
  }

  static void _setupTodoListRepositories() {
    locator.registerFactory<AddTodoListRepoAction>(
        () => AddTodoListRepoActionImp());
    locator.registerFactory<GetRoomTodoListRepoAction>(
        () => GetRoomTodoListRepoActionImp(locator.get()));
    locator.registerFactory<UpdateTodoListTitleRepoAction>(
        () => UpdateTodoListTitleRepoActionImp());
  }
}
