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
  void dispose() {
    textControllerLat.dispose();
    textControllerLon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: _buildPhotoCardList(),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                newPlaceScreenCategory,
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      fontSize: 12,
                      color: lmInactiveBlackColor,
                    ),
              ),
              const SizedBox(height: 14),
              _buildCategoryFrame(context),
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
              _buildNameFrame(context),
              const SizedBox(height: 24),
              _buildLatLonLabels(context),
              const SizedBox(height: 12),
              _buildLatLonFrame(context),
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
              const SizedBox(height: 12),
              _buildDescriptionFrame(context),
              const SizedBox(height: 58),
              _buildCreateButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      leadingWidth: 80,
      backgroundColor: Theme.of(context).primaryColor,
      title: Text(
        newPlaceScreenTitle,
        style: Theme.of(context).textTheme.headline1,
      ),
      elevation: 0,
      centerTitle: true,
      leading: _buildCancelButton(context),
    );
  }

  List<Widget> _buildPhotoCardList() {
    List<Widget> photoCardList = [
      Padding(
        padding: const EdgeInsets.only(right: 16),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.green,
              width: 2,
            ),
          ),
          height: 72,
          width: 72,
          child: const Icon(
            Icons.add,
            color: Colors.green,
            size: 34,
          ),
        ),
      ),
    ];

    for (var element in mocksPhotos) {
      photoCardList.add(
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  height: 72,
                  width: 72,
                  child: Image.network(
                    element.url,
                    fit: BoxFit.cover,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes
                              : null,
                        ),
                      );
                    },
                  ),
                ),
              ),
              Positioned(
                right: 5,
                top: 5,
                child: GestureDetector(
                  child: const Icon(Icons.cancel),
                  onTap: () {
                    setState(() {
                      mocksPhotos.remove(element);
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      );
    }
    return photoCardList;
  }

  Widget _buildCategoryFrame(BuildContext context) {
    return Row(
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
    );
  }

  Widget _buildNameFrame(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      child: TextField(
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
          contentPadding: const EdgeInsets.all(10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green, width: 1.0),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }

  Widget _buildLatLonLabels(BuildContext context) {
    return Row(
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
    );
  }

  Widget _buildLatLonFrame(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: Container(
            height: 40,
            width: double.infinity,
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
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green, width: 1.0),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green, width: 1.0),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Flexible(
          child: Container(
            height: 40,
            width: double.infinity,
            child: TextField(
              focusNode: focusNodeNewPlaceScreenLon,
              controller: textControllerLon,
              keyboardType: TextInputType.number,
              style: Theme.of(context).textTheme.caption,
              cursorWidth: 1,
              cursorHeight: 24,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(10),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.cancel),
                  onPressed: () {
                    textControllerLat.clear();
                    textControllerLon.clear();
                  },
                  color: Theme.of(context).primaryColorDark,
                ),
                enabledBorder: _outlineInputBorder(),
                focusedBorder: _outlineInputBorder(),
              ),
              onEditingComplete: () {
                focusNodeNewPlaceScreenDescription.requestFocus();
              },
              onChanged: (String value) {
                lonSight = double.tryParse(value);
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDescriptionFrame(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      child: TextField(
        textCapitalization: TextCapitalization.sentences,
        focusNode: focusNodeNewPlaceScreenDescription,
        style: Theme.of(context).textTheme.caption,
        cursorWidth: 1,
        cursorHeight: 24,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 10, left: 16, bottom: 80),
          hintText: newPlaceScreenInputText,
          hintStyle: Theme.of(context)
              .textTheme
              .caption
              .copyWith(color: lmInactiveBlackColor),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.green, width: 1.0),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onEditingComplete: () {
          focusNodeNewPlaceScreenDescription.unfocus();
        },
        onChanged: (String value) {
          detailsSight = value;
        },
      ),
    );
  }

  Widget _buildCreateButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
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
    );
  }

  OutlineInputBorder _outlineInputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.green, width: 1.0),
      borderRadius: BorderRadius.circular(8),
    );
  }

  Widget _buildCancelButton(BuildContext context) {
    return TextButton(
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
    );
  }

  void _returnNewPlaceCategory(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => NewPlaceCategoryScreen(),
      ),
    );
    setState(() {
      newPlaceCategory = result ?? newPlaceScreenNotChosen;
      typeSight = newPlaceCategory;
      focusNodeNewPlaceScreenName.requestFocus();
    });
  }
}
