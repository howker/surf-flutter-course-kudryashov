import 'package:flutter/material.dart';

class SightListScreen extends StatefulWidget {
  @override
  _SightListScreenState createState() => _SightListScreenState();
}

class _SightListScreenState extends State<SightListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 136,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: RichText(
          text: TextSpan(
            text: 'С',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w700,
              fontSize: 32,
              color: Colors.green,
            ),
            children: [
              TextSpan(
                text: 'писок\n',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                  fontSize: 32,
                  color: Color(0xFF3B3E5B),
                ),
              ),
              TextSpan(
                text: 'и',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                  fontSize: 32,
                  color: Colors.yellow,
                ),
              ),
              TextSpan(
                text: 'нтересных мест',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                  fontSize: 32,
                  color: Color(0xFF3B3E5B),
                ),
              ),
            ],
          ),
          textAlign: TextAlign.left,
          maxLines: 2,
        ),
      ),
    );
  }
}
