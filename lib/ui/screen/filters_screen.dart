import 'package:flutter/material.dart';

class FiltersScreen extends StatelessWidget {
  final RangeValues _rangeValues = const RangeValues(100, 10000);
  final double userLat = 46.348838;
  final double userLng = 48.029816;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.navigate_before),
          onPressed: () {},
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Очистить',
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(color: Colors.green),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Расстояние',
                  style: Theme.of(context).textTheme.caption,
                ),
                Text(
                  'от до',
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      .copyWith(color: const Color(0xFF7C7E92)),
                )
              ],
            ),
          ),
          RangeSlider(
            values: _rangeValues,
            max: 10000,
            min: 0,
            onChanged: (newValue) {},
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 48),
              ),
              onPressed: () {
                print('show');
              },
              child: Text(
                'ПОКАЗАТЬ (190)',
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
