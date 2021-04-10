import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/svg_path_const.dart';

///сплэш-экран
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<bool> isInitialized() =>
      Future.delayed(Duration(seconds: 2), () => true);

  @override
  void initState() {
    _navigateToNext();
    super.initState();
  }

  Future<void> _navigateToNext() async {
    if (await isInitialized()) print("Переход на следующий экран");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          const Color(0xFFFCDD3D),
          const Color(0xFF4CAF50),
        ]),
      ),
      child: Center(
        child: Container(
          height: 160,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: SvgPicture.asset(
              map,
              color: Colors.green,
              height: 80,
            ),
          ),
        ),
      ),
    );
  }
}
