import 'package:flutter/material.dart';
import 'package:places/colors.dart';
import 'package:places/domain/utils.dart';
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
    final double deviceHeigh = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;
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
        mainAxisAlignment: MainAxisAlignment.start,
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
            child: deviceHeigh > 800 && deviceWidth > 480
                ? FilterItemsGrid()
                : FilterItemsHorizontalList(),
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
                sortedByRadius =
                    listAreaByRadius(mocks, userLat, userLng, _rangeValues);
              });
            },
          ),
          const SizedBox(height: 120),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 48),
              ),
              onPressed: () {},
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
}

class FilterItemsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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

class FilterItemsHorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 86,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          FilterItem(
            svgPath: hotel,
            value: 1,
            description: filterTypeHotel,
            isChecked: filters[filterTypeHotel],
            elementPadding: 44,
          ),
          FilterItem(
            svgPath: restourant,
            value: 2,
            description: filterTypeRestaurant,
            isChecked: filters[filterTypeRestaurant],
            elementPadding: 44,
          ),
          FilterItem(
            svgPath: particular_place,
            value: 3,
            description: filterTypeSpecial,
            isChecked: filters[filterTypeSpecial],
            elementPadding: 44,
          ),
          FilterItem(
            svgPath: park,
            value: 4,
            description: filterTypePark,
            isChecked: filters[filterTypePark],
            elementPadding: 44,
          ),
          FilterItem(
            svgPath: museum,
            value: 5,
            description: filterTypeMuseum,
            isChecked: filters[filterTypeMuseum],
            elementPadding: 44,
          ),
          FilterItem(
            svgPath: cafe,
            value: 6,
            description: filterTypeCafe,
            isChecked: filters[filterTypeCafe],
          )
        ],
      ),
    );
  }
}
