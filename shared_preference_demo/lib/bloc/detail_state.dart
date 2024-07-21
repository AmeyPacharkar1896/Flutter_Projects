abstract class DetailState {}

class DetailStateInitial extends DetailState {}

class DetailStateLoading extends DetailState {}

class DetailStateLoaded extends DetailState {
  DetailStateLoaded({
    required this.userDetail,
  });

  final List<String> userDetail;
}
