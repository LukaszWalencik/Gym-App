import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit()
      : super(
          HomeState(buttonIndex: 0),
        );
  Future<void> readIndex() async {
    emit(HomeState(buttonIndex: 3));
  }
}
