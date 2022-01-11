import 'package:flutter/material.dart';

import './color_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _bloc = ColorBloc();

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BLoC with Streams'),
        centerTitle: true,
      ),
      body: StreamBuilder<Color>(
          stream: _bloc.outputStateStream,
          initialData: Colors.red,
          builder: (context, snapshot) {
            return Center(
              child: AnimatedContainer(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: snapshot.data,
                ),
                duration: const Duration(milliseconds: 500),
                width: 100.0,
                height: 100.0,
              ),
            );
          }),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            onPressed: () => _bloc.inputEventSink.add(ColorEvent.eventRed),
            backgroundColor: Colors.red,
          ),
          const SizedBox(
            width: 10.0,
          ),
          FloatingActionButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            onPressed: () => _bloc.inputEventSink.add(ColorEvent.eventGreen),
            backgroundColor: Colors.green,
          ),
        ],
      ),
    );
  }
}
