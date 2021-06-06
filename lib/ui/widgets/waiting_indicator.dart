import 'package:flutter/cupertino.dart';

///Индикатор загрузки
class WaitingIndicator extends StatelessWidget {
  const WaitingIndicator({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: const CupertinoActivityIndicator(
        radius: 16,
        animating: true,
      ),
    );
  }
}
