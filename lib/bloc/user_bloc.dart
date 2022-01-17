import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user_event.dart';
import '../bloc/user_state.dart';
import '../models/user.dart';
import '../services/user_repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UsersRepository usersRepository;

  UserBloc({required this.usersRepository}) : super(UserEmptyState()) {
    on<UserClearEvent>((event, emit) => emit(UserEmptyState()));
    on<UserLoadEvent>(
      (event, emit) async {
        emit(UserLoadingState());
        try {
          List<User> _loadedUserList = await usersRepository.getAllUsers();
          emit(UserLoadedState(loadedUser: _loadedUserList));
        } catch (_) {
          emit(UserErrorState());
        }
      },
    );
  }
}
