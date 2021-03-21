import 'package:flutter/material.dart';
import 'package:places/colors.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mock.dart';
import 'package:places/text_string_const.dart';
import 'package:places/ui/screen/new_place_category.dart';

/// Экран "Добавить новое место"
class AddSightScreen extends StatefulWidget {
  @override
  _AddSightScreenState createState() => _AddSightScreenState();
}

class _AddSightScreenState extends State<AddSightScreen> {
  final textControllerLat = TextEditingController();
  final textControllerLon = TextEditingController();
  final FocusNode focusNodeNewPlaceScreenName = FocusNode();
  final FocusNode focusNodeNewPlaceScreenLat = FocusNode();
  final FocusNode focusNodeNewPlaceScreenLon = FocusNode();
  final FocusNode focusNodeNewPlaceScreenDescription = FocusNode();

  String newPlaceCategory = newPlaceScreenNotChosen;
  String nameSight = '';
  double latSight = 0.0;
  double lonSight = 0.0;
  String urlSight = urlByDefault;
  String detailsSight = '';
  String typeSight = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leadingWidth: 80,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          newPlaceScreenTitle,
          style: Theme.of(context).textTheme.headline1,
        ),
        elevation: 0,
        centerTitle: true,
        leading: TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            newPlaceScreenCancel,
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(color: lmHeadline4Color),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Text(
              newPlaceScreenCategory,
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontSize: 12,
                    color: lmInactiveBlackColor,
                  ),
            ),
            const SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  newPlaceCategory,
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      .copyWith(color: lmInactiveBlackColor),
                ),
                IconButton(
                  icon: Icon(
                    Icons.navigate_next,
                    color: Theme.of(context).primaryColorDark,
                  ),
                  onPressed: () {
                    _returnNewPlaceCategory(context);
                  },
                ),
              ],
            ),
            const SizedBox(height: 14),
            const Divider(thickness: 0.8),
            const SizedBox(height: 24),
            Text(
              newPlaceScreenName,
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontSize: 12,
                    color: lmInactiveBlackColor,
                  ),
            ),
            const SizedBox(height: 12),
            TextField(
              focusNode: focusNodeNewPlaceScreenName,
              textCapitalization: TextCapitalization.sentences,
              style: Theme.of(context).textTheme.caption,
              cursorWidth: 1,
              cursorHeight: 24,
              onChanged: (String value) {
                nameSight = value;
              },
              onEditingComplete: () {
                focusNodeNewPlaceScreenLat.requestFocus();
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  newPlaceScreenLat,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(fontSize: 12, color: lmInactiveBlackColor),
                ),
                const SizedBox(width: 156),
                Text(
                  newPlaceScreenLon,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(fontSize: 12, color: lmInactiveBlackColor),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Flexible(
                  child: TextField(
                    focusNode: focusNodeNewPlaceScreenLat,
                    controller: textControllerLat,
                    keyboardType: TextInputType.number,
                    style: Theme.of(context).textTheme.caption,
                    cursorWidth: 1,
                    cursorHeight: 24,
                    onEditingComplete: () {
                      focusNodeNewPlaceScreenLon.requestFocus();
                    },
                    onChanged: (String value) {
                      latSight = double.tryParse(value);
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Flexible(
                  child: TextField(
                    focusNode: focusNodeNewPlaceScreenLon,
                    controller: textControllerLon,
                    keyboardType: TextInputType.number,
                    style: Theme.of(context).textTheme.caption,
                    cursorWidth: 1,
                    cursorHeight: 24,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.cancel),
                        onPressed: () {
                          textControllerLat.clear();
                          textControllerLon.clear();
                        },
                        color: Theme.of(context).primaryColorDark,
                      ),
                    ),
                    onEditingComplete: () {
                      focusNodeNewPlaceScreenDescription.requestFocus();
                    },
                    onChanged: (String value) {
                      lonSight = double.tryParse(value);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Text(
              newPlaceScreenPointAtMap,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(color: Colors.green),
            ),
            const SizedBox(height: 37),
            Text(
              newPlaceScreenDescription,
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontSize: 12,
                    color: lmInactiveBlackColor,
                  ),
            ),
            TextField(
              focusNode: focusNodeNewPlaceScreenDescription,
              style: Theme.of(context).textTheme.caption,
              cursorWidth: 1,
              cursorHeight: 24,
              decoration: InputDecoration(
                labelText: newPlaceScreenInputText,
                labelStyle: Theme.of(context)
                    .textTheme
                    .caption
                    .copyWith(color: lmInactiveBlackColor),
              ),
              onEditingComplete: () {
                focusNodeNewPlaceScreenDescription.unfocus();
              },
              onChanged: (String value) {
                detailsSight = value;
              },
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 48),
                ),
                onPressed: () {
                  Sight newSight = Sight(
                    nameSights: nameSight,
                    lat: latSight,
                    lon: lonSight,
                    url: urlSight,
                    details: detailsSight,
                    type: typeSight,
                  );
                  mocks.add(newSight);
                },
                child: Text(
                  newPlaceScreenCreateButton,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _returnNewPlaceCategory(BuildContext context) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => NewPlaceCategoryScreen()));
    setState(() {
      newPlaceCategory = result ?? newPlaceScreenNotChosen;
      typeSight = newPlaceCategory;
      focusNodeNewPlaceScreenName.requestFocus();
    });
  }
}
