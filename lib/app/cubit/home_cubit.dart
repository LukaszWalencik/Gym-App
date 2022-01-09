import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit()
      : super(HomeState(
          user: null,
          isLoading: false,
          errorMessage: '',
        ));

  StreamSubscription? _streamSubscription;

  Future<void> iniciation() async {
    emit(
      HomeState(user: null, isLoading: true, errorMessage: ''),
    );

    _streamSubscription =
        FirebaseAuth.instance.authStateChanges().listen((user) {
      emit(HomeState(user: user, isLoading: false, errorMessage: ''));
    })
          ..onError((error) {
            emit(
              HomeState(user: null, isLoading: false, errorMessage: 'error'),
            );
          });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
