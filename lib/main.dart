import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TITLE',
      home: MyFirstWidget(),
    );
  }
}

class MyFirstWidget extends StatelessWidget {
  runtypeReturn() {
    return context.runtimeType;
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class MyStatefullWidget extends StatefulWidget {
  @override
  _MyStatefullWidgetState createState() => _MyStatefullWidgetState();
}

class _MyStatefullWidgetState extends State<MyStatefullWidget> {
  runtypeReturn() {
    return context.runtimeType;
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

/* 
1 - приложение не запустится т.к. отсутствует точка входа main 
2 - значение title будет виден в верхней части в диспетчере задач, если нажать кнопку "последние приложения".
3 - context.runtimeType не получилось реализовать в StatelessWidget, так как нет контекста 
4 - context.runtimeType получилось реализовать в StatefullWidget в части State, т.к здесь контекст уже есть 
*/
