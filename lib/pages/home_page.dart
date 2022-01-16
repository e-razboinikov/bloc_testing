import 'package:flutter/material.dart';

import '../widgets/action_buttons.dart';
import '../widgets/user_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Users list'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            ActionButtons(),
            Expanded(
              child: UserList(),
            )
          ],
        ),
      ),
    );
  }
}
