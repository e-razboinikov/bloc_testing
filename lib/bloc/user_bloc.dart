import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/user.dart';
import '../services/user_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

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
