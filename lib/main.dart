import 'package:flutter/material.dart';
import 'convert_bloc.dart';
import 'convert_event.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String _convert = " ";
  final _bloc = ConvertBloc();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: StreamBuilder(
          stream: _bloc.counter,
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextField(
                  onChanged: (input) {
                    setState(() {
                      _convert = input;
                    });
                  },
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Type Here',
                  ),
                ),
                Text(
                  '$_convert',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            );
          },
        ),
        // child: Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: <Widget>[
        // TextField(
        //   onChanged: (input) {
        //     setState(() {
        //       _convert = input;
        //     });
        //   },
        //   obscureText: false,
        //   decoration: InputDecoration(
        //     border: OutlineInputBorder(),
        //     labelText: 'Type Here',
        //   ),
        // ),
        // Text(
        //   '$_counter',
        //   style: Theme.of(context).textTheme.headline4,
        // ),
        //   ],
        // ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _bloc.convertEventSink.add(CapitalizeEvent(_convert)),
        tooltip: 'Convert',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
