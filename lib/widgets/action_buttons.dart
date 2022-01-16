import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/user_bloc.dart';
import '../bloc/user_event.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: () {
            userBloc.add(
              UserLoadEvent(),
            );
          },
          child: const Text(
            'Load',
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.green,
          ),
        ),
        const SizedBox(
          width: 8.0,
        ),
        ElevatedButton(
          onPressed: () {
            userBloc.add(
              UserClearEvent(),
            );
          },
          child: const Text(
            'Clear',
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
          ),
        ),
      ],
    );
  }
}
