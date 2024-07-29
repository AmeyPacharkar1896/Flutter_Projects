abstract class DetailEvent {}

class DetailEventShowInfo extends DetailEvent {
  DetailEventShowInfo({this.query});

  final String? query;
}

class DetailEventSaveInfo extends DetailEvent {
  DetailEventSaveInfo({
    required this.userDetail,
    this.index,
  });

  final String userDetail;
  final int? index;
}

class DetalEventDeleteInfo extends DetailEvent {
  DetalEventDeleteInfo({
    required this.index,
  });

  final int index;
}
