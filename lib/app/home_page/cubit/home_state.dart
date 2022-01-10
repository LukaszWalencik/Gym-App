part of 'home_cubit.dart';

@immutable
class HomeState {
  final User? user;
  final bool isLoading;
  final String errorMessage;

  const HomeState(
      {required this.user,
      required this.isLoading,
      required this.errorMessage});
}