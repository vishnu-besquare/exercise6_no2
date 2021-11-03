import 'dart:async';

import 'convert_event.dart';

class ConvertBloc {
  //String _input = " "; //inital value of counter is 0

  final _convertStateController = StreamController<String>(); // counter stream

  StreamSink<String> get _inCounter => _convertStateController.sink;

  Stream<String> get counter => _convertStateController.stream;

  final _convertEventController =
      StreamController<ConvertEvent>(); //event Stream

  Sink<ConvertEvent> get convertEventSink => _convertEventController
      .sink; // this one we only need sink and not stream because we get info frm UI and not send it put anywhere

  ConvertBloc() {
    _convertEventController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(ConvertEvent event) {
    if (event is CapitalizeEvent)
      _inCounter.add(event.msg.toUpperCase());
    else {
      _inCounter.add("bye");
    } //remove ths curly braces
    //   _counter--;

    // _inCounter.add(_counter);
  }

  void dispose() {
    _convertEventController.close();
    _convertStateController.close();
  }
}
