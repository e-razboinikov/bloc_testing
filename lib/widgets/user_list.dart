import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user_bloc.dart';
import '../bloc/user_state.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (ctx, state) {
        if (state is UserEmptyState) {
          return const Center(
            child: Text(
              'No data received. Press load button',
              style: TextStyle(fontSize: 20.0),
            ),
          );
        }
        if (state is UserLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is UserLoadedState) {
          return ListView.builder(
            itemCount: state.loadedUser.length,
            itemBuilder: (ctx, index) => Container(
              color:
                  index % 2 == 0 ? Colors.white : Colors.pink.withOpacity(0.5),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'ID: ${state.loadedUser[index].id}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        state.loadedUser[index].name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            state.loadedUser[index].email,
                            style: const TextStyle(
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                          Text(
                            state.loadedUser[index].phone,
                            style: const TextStyle(
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        }

        if (state is UserErrorState) {
          return const Center(
            child: Text(
              'Error fetching users',
              style: TextStyle(fontSize: 20.0),
            ),
          );
        }
        return const Center(
          child: Text('Error'),
        );
      },
    );
  }
}
