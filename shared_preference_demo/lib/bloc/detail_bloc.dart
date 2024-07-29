import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preference_demo/bloc/detail_event.dart';
import 'package:shared_preference_demo/bloc/detail_state.dart';
import 'package:shared_preference_demo/model/shared_preference.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  List<String> userDetail = [];
  DetailBloc() : super(DetailStateInitial()) {
    on<DetailEventSaveInfo>(_onDetailEventSaveInfo);
    on<DetalEventDeleteInfo>(_onDetalEventDeleteInfo);
    on<DetailEventShowInfo>(_onDetailEventShowInfo);
  }
  FutureOr<void> _onDetailEventSaveInfo(
    DetailEventSaveInfo event,
    Emitter<DetailState> emit,
  ) async {
    emit(DetailStateLoading());
    SharedPreference pref = SharedPreference();
    await pref.init();

    try {
      if (state is DetailStateLoading) {
        if (event.index == null) {
          pref.setDetails(event.userDetail, null);
        } else {
          pref.setDetails(event.userDetail, event.index);
        }
        userDetail = pref.getDetail(null);
        log(userDetail.toString());
        emit(DetailStateLoaded(userDetail: userDetail));
      }
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  Future<FutureOr<void>> _onDetalEventDeleteInfo(
    DetalEventDeleteInfo event,
    Emitter<DetailState> emit,
  ) async {
    emit(DetailStateLoading());
    SharedPreference pref = SharedPreference();
    await pref.init();

    try {
      if (state is DetailStateLoading) {
        pref.deleteDetail(event.index);
        userDetail = pref.getDetail(null);
        log(userDetail.toString());
        emit(DetailStateLoaded(userDetail: userDetail));
      }
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  Future<FutureOr<void>> _onDetailEventShowInfo(
    DetailEventShowInfo event,
    Emitter<DetailState> emit,
  ) async {
    emit(DetailStateLoading());
    SharedPreference pref = SharedPreference();
    await pref.init();
    try {
      if (state is DetailStateLoading) {
        userDetail = pref.getDetail(event.query);
        log(userDetail.toString());
        emit(DetailStateLoaded(userDetail: userDetail));
      }
    } on Exception catch (e) {
      log(e.toString());
    }
  }
}
