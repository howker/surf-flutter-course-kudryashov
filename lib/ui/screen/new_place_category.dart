import 'package:flutter/material.dart';
import 'package:places/mock.dart';
import 'package:places/text_string_const.dart';

/// Экран выбора категории нового места
class NewPlaceCategoryScreen extends StatefulWidget {
  @override
  _NewPlaceCategoryScreenState createState() => _NewPlaceCategoryScreenState();
}

class _NewPlaceCategoryScreenState extends State<NewPlaceCategoryScreen> {
  String newPlaceCategory = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 80,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          newPlaceCategoryScreenCategory,
          style: Theme.of(context).textTheme.headline1,
        ),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.navigate_before),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: _buildCheckboxListTile(context),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 48),
                ),
                onPressed: () {
                  Navigator.pop(context, newPlaceCategory);
                },
                child: Text(
                  newPlaceCategoryScreenSave,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildCheckboxListTile(BuildContext context) {
    List<Widget> listWhitestars = placesCategory.entries
        .map(
          (e) => Column(
            children: [
              CheckboxListTile(
                activeColor: Theme.of(context).primaryColor,
                checkColor: Colors.green,
                title: Text(
                  e.key,
                  style: Theme.of(context).textTheme.caption,
                ),
                value: e.value,
                onChanged: (bool newValue) {
                  setState(() {
                    placesCategory.updateAll((key, value) => false);
                    placesCategory.update(e.key, (value) => newValue);
                    newPlaceCategory = e.key;
                  });
                },
              ),
              const Divider(),
            ],
          ),
        )
        .toList();

    return listWhitestars;
  }
}
