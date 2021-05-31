import 'package:get_it/get_it.dart';
import 'package:onlinetodoshipping/datasource/repository/request/CreateNewRequestRepoActionImp.dart';
import 'package:onlinetodoshipping/domain_interface/RequestRepository.dart';

import 'ApplicationLocator.dart';
import 'DataLocator.dart';
import 'DomainLocator.dart';
import 'ScreenLocator.dart';

final locator = GetIt.instance;

void setup() {
  DataLocator.setup();
  DomainLocator.setup();
  ApplicationLocator.setup();
  ScreenLocator.setup();
}
