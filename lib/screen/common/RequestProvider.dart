enum RequestType {
  Where,
  OpenTime,
  Price,
  Count,
  Title,
  Deadline,
  Branch,
  Type,
  Others
}

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
    return type.toString().split('.')[1];
  }
}
