import 'dart:async';

import 'package:flutter/material.dart';

enum ColorEvent {
  eventRed,
  eventGreen,
}

class ColorBloc {
  Color _color = Colors.red;

  final _inputEventController = StreamController<ColorEvent>();
  StreamSink<ColorEvent> get inputEventSink => _inputEventController.sink;

  final _outputStateController = StreamController<Color>();
  Stream<Color> get outputStateStream => _outputStateController.stream;

  void mapEventToStream(ColorEvent event) {
    if (event == ColorEvent.eventRed) {
      _color = Colors.red;
    } else if (event == ColorEvent.eventGreen) {
      _color = Colors.green;
    } else {
      throw ('Wrong event');
    }
    _outputStateController.sink.add(_color);
  }

  ColorBloc() {
    _inputEventController.stream.listen(mapEventToStream);
  }

  void dispose () {
    _inputEventController.close();
    _outputStateController.close();
  }
}
