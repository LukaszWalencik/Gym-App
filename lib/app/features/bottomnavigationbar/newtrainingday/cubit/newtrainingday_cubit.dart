import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'newtrainingday_state.dart';

class NewtrainingdayCubit extends Cubit<NewtrainingdayState> {
  NewtrainingdayCubit() : super(NewtrainingdayState(documents: []));
}
