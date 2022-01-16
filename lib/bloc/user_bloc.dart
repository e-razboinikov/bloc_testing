import 'package:bloc_test/bloc/user_event.dart';
import 'package:bloc_test/bloc/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../services/user_repository.dart';
import '../models/user.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UsersRepository usersRepository;

  UserBloc({required this.usersRepository});

  @override
  get initialState => UserEmptyState();

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is UserLoadEvent) {
      yield UserLoadingState();
      try {
        final List<User> _loadedUserList = await usersRepository.getAllUsers();
        yield UserLoadedState(loadedUser: _loadedUserList);
      } catch (_) {
        yield UserErrorState();
      }
    } else if (event is UserClearEvent) {
      yield UserEmptyState();
    }
  }
}
