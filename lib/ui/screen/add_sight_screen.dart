import 'package:flutter/material.dart';
import 'package:places/colors.dart';
import 'package:places/text_string_const.dart';

/// Экран "Добавить новое место"
class AddSightScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          onPressed: () {},
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
                  newPlaceScreenNotChosen,
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
                  onPressed: () {},
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
            Container(height: 40),
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
            Container(height: 40),
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
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 48),
              ),
              onPressed: () {},
              child: Text(
                newPlaceScreenCreateButton,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
