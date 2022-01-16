import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ElevatedButton(
          onPressed: () {},
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
          onPressed: () {},
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
