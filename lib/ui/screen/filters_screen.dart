import 'dart:math';
import 'package:flutter/material.dart';
import 'package:places/colors.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mock.dart';
import 'package:places/svg_path_const.dart';
import 'package:places/text_string_const.dart';
import 'package:places/ui/widgets/filter_item.dart';

///Экран фильтров
class FiltersScreen extends StatefulWidget {
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  RangeValues _rangeValues = const RangeValues(100, 10000);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.navigate_before),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(
                () {
                  _rangeValues = const RangeValues(100, 10000);
                  for (var item in filters.entries) {
                    filters[item.key] = false;
                  }
                },
              );
            },
            child: Text(
              clear,
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
                  category,
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
                  distance,
                  style: Theme.of(context).textTheme.caption,
                ),
                Text(
                  '$distanceFrom ${(_rangeValues.start * 0.001).toInt()} $distanceTo ${(_rangeValues.end * 0.001).toInt()} км',
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
                listAreaByRadius(mocks, userLat, userLng, _rangeValues)
                    .forEach((element) {
                  print(element.nameSights);
                  filters.forEach(
                    (key, value) {
                      print('$key : $value');
                    },
                  );
                });
              },
              child: Text(
                '$show (${listAreaByRadius(mocks, userLat, userLng, _rangeValues).length})',
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
          svgPath: hotel,
          value: 1,
          description: filterTypeHotel,
          isChecked: filters[filterTypeHotel],
        ),
        FilterItem(
          svgPath: restourant,
          value: 2,
          description: filterTypeRestaurant,
          isChecked: filters[filterTypeRestaurant],
        ),
        FilterItem(
          svgPath: particular_place,
          value: 3,
          description: filterTypeSpecial,
          isChecked: filters[filterTypeSpecial],
        ),
        FilterItem(
          svgPath: park,
          value: 4,
          description: filterTypePark,
          isChecked: filters[filterTypePark],
        ),
        FilterItem(
          svgPath: museum,
          value: 5,
          description: filterTypeMuseum,
          isChecked: filters[filterTypeMuseum],
        ),
        FilterItem(
          svgPath: cafe,
          value: 6,
          description: filterTypeCafe,
          isChecked: filters[filterTypeCafe],
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
