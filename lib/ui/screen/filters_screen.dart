import 'dart:math';
import 'package:flutter/material.dart';
import 'package:places/colors.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mock.dart';
import 'package:places/ui/widgets/filter_item.dart';

class FiltersScreen extends StatefulWidget {
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  RangeValues _rangeValues = const RangeValues(100, 10000);
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
            onPressed: () {
              setState(() {
                _rangeValues = const RangeValues(100, 10000);
              });
            },
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
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text(
                  'КАТЕГОРИИ',
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                        fontSize: 12,
                        color: lmInactiveBlackColor,
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: _buildFilterItems(),
          ),
          const SizedBox(height: 60),
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
                  'от ${(_rangeValues.start * 0.001).toInt()} до ${(_rangeValues.end * 0.001).toInt()} км',
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
            onChanged: (newValues) {
              setState(() {
                _rangeValues = newValues;
              });
            },
          ),
          const SizedBox(height: 140),
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
                'ПОКАЗАТЬ (${listAreaByRadius(mocks, userLat, userLng, _rangeValues).length})',
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _buildFilterItems() {
    return Wrap(
      spacing: 44,
      alignment: WrapAlignment.spaceEvenly,
      runSpacing: 40,
      children: [
        FilterItem(
          svgPath: 'res/icons/Hotel.svg',
          value: 1,
          description: 'Отель',
        ),
        FilterItem(
          svgPath: 'res/icons/Restourant.svg',
          value: 1,
          description: 'Ресторан',
        ),
        FilterItem(
          svgPath: 'res/icons/Particular_place.svg',
          value: 1,
          description: 'Особое место',
        ),
        FilterItem(
          svgPath: 'res/icons/Park.svg',
          value: 1,
          description: 'Парк',
        ),
        FilterItem(
          svgPath: 'res/icons/Museum.svg',
          value: 1,
          description: 'Музей',
        ),
        FilterItem(
          svgPath: 'res/icons/Cafe.svg',
          value: 1,
          description: 'Кафе',
        ),
      ],
    );
  }
}

List<Sight> listAreaByRadius(
    List<Sight> inputList, userLat, userLng, RangeValues rangeValues) {
  List<Sight> listAreaByRadius = [];
  inputList.forEach((element) {
    if (arePointsNear(userLat, userLng, element.lat, element.lon,
        rangeValues.start, rangeValues.end)) listAreaByRadius.add(element);
  });
  return listAreaByRadius;
}

bool arePointsNear(
    userPointLat, userPointLng, checkPointLat, checkPointLng, kmStart, kmEnd) {
  const double pi = 3.1415926535897932;
  const ky = 40000 / 360;
  double kx = cos(pi * userPointLat / 180.0) * ky;
  var dx = (userPointLng - checkPointLng).abs() * kx;
  var dy = (userPointLat - checkPointLat).abs() * ky;
  if (sqrt(dx * dx + dy * dy) <= kmEnd * 0.001 &&
      sqrt(dx * dx + dy * dy) >= kmStart * 0.001)
    return true;
  else
    return false;
}
