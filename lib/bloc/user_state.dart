part of 'user_bloc.dart';

abstract class UserState {}

class UserEmptyState extends UserState {}

class UserLoadingState extends UserState {}

class UserLoadedState extends UserState {
  final List loadedUser;
  UserLoadedState({required this.loadedUser});
}

class UserErrorState extends UserState {}
