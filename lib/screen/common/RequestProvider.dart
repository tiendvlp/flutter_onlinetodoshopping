import 'package:onlinetodoshipping/entity/RequestType.dart';
import 'package:onlinetodoshipping/screen/common/helper/Helper.dart';

class RequestProvider {
  List<RequestItem> requests = [
    RequestItem(RequestType.Title),
    RequestItem(RequestType.Where),
    RequestItem(RequestType.Price),
    RequestItem(RequestType.Type),
    RequestItem(RequestType.OpenTime),
    RequestItem(RequestType.Count),
    RequestItem(RequestType.Deadline),
    RequestItem(RequestType.Branch),
    RequestItem(RequestType.Others),
  ];
}

class RequestItem {
  final RequestType type;

  RequestItem(this.type);

  @override
  String toString() {
    return getEnumValue(type);
  }
}
