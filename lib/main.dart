import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Roboto',
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyFirstWidgetFull(),
    );
  }
}

class MyFirstWidget extends StatelessWidget {
  int _counter = 1;
  @override
  Widget build(BuildContext context) {
    print('функция запустилась ${_counter++} раз');
    return Container(
      child: Center(
        child: Text('Hello!'),
      ),
    );
  }
}

class MyFirstWidgetFull extends StatefulWidget {
  @override
  _MyFirstWidgetFullState createState() => _MyFirstWidgetFullState();
}

class _MyFirstWidgetFullState extends State<MyFirstWidgetFull> {
  int _counter = 1;
  @override
  Widget build(BuildContext context) {
    print('функция запустилась ${_counter++} раз');
    return Container(
      child: Center(
        child: Text('Hello!'),
      ),
    );
  }
}
