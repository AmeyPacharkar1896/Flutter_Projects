abstract class DetailEvent {}

class DetailEventShowInfo extends DetailEvent {}

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
