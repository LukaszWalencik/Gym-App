import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
part 'root_state.dart';

class RootCubit extends Cubit<RootState> {
  RootCubit()
      : super(const RootState(
          user: null,
          isLoading: false,
          errorMessage: '',
        ));

  StreamSubscription? _streamSubscription;

  Future<void> userChecker() async {
    emit(
      const RootState(
        user: null,
        isLoading: true,
        errorMessage: '',
      ),
    );

    _streamSubscription =
        FirebaseAuth.instance.authStateChanges().listen((user) {
      emit(
        RootState(
          user: user,
          isLoading: false,
          errorMessage: '',
        ),
      );
    })
          ..onError((error) {
            const RootState(
              user: null,
              isLoading: false,
              errorMessage: 'error',
            );
          });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
