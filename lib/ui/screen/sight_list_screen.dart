import 'package:flutter/material.dart';
import 'package:places/text_string_const.dart';

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
            style: textStyle,
            children: [
              TextSpan(
                text: placesN,
                style: textStyle1,
              ),
              TextSpan(
                text: 'и',
                style: textStyle2,
              ),
              TextSpan(
                text: nPlaces,
                style: textStyle3,
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

const textStyle = TextStyle(
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w700,
  fontSize: 32,
  color: Colors.green,
);

const textStyle1 = TextStyle(
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w700,
  fontSize: 32,
  color: const Color(0xFF3B3E5B),
);

const textStyle2 = TextStyle(
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w700,
  fontSize: 32,
  color: Colors.yellow,
);

const textStyle3 = TextStyle(
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w700,
  fontSize: 32,
  color: const Color(0xFF3B3E5B),
);
