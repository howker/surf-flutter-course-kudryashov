import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/data/interactor/place_interactor.dart';
import 'package:places/data/model/place.dart';
import 'package:places/styles.dart';
import 'package:places/svg_path_const.dart';
import 'package:places/text_string_const.dart';
import 'package:places/ui/screen/sight_details.dart';
import 'package:provider/provider.dart';

/// Карточка интересного места
class SightCard extends StatelessWidget {
  Place place;
  String firstIcon;
  Icon secondIcon;
  double descriptionCardHeight;
  String details;
  String closed;
  TextStyle detailsStyle;
  Key key;
  Function onRemoveCard;
  Function onReorderCard;
  Function onDismissedCard;
  List<Place> candidateDataList;

  SightCard({
    this.place,
    this.key,
    this.onRemoveCard,
    this.onReorderCard,
    this.onDismissedCard,
    this.candidateDataList,
  }) : super(key: key) {
    this.place = place;
    this.secondIcon = secondIcon ?? const Icon(Icons.favorite_border);
    this.descriptionCardHeight = 102;
    this.details = place.description;
    this.closed = close;
    this.key = key ?? ValueKey(this.place.name);
  }
  SightCard.wantToVisit({
    this.place,
    this.key,
    this.onRemoveCard,
    this.onReorderCard,
    this.onDismissedCard,
    this.candidateDataList,
  }) : super(key: key) {
    firstIcon = calendar;
    secondIcon = const Icon(Icons.close);
    descriptionCardHeight = 102;
    details = planned;
    closed = close;
    detailsStyle = textRegular14Grey.copyWith(color: Colors.green);
    this.key = key ?? ValueKey(this.place.name);
  }

  SightCard.alreadyVisited({
    this.place,
    this.key,
    this.onRemoveCard,
    this.onReorderCard,
    this.onDismissedCard,
    this.candidateDataList,
  }) : super(key: key) {
    firstIcon = share;
    secondIcon = const Icon(Icons.close);
    descriptionCardHeight = 102;
    details = aimReached;
    closed = close;
    detailsStyle = textRegular14Grey;
    this.key = key ?? ValueKey(this.place.name);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Dismissible(
          background: const SizedBox.shrink(),
          secondaryBackground: _buildSecondaryBackground(context),
          direction: DismissDirection.endToStart,
          key: key,
          onDismissed: (direction) {
            onDismissedCard();
          },
          child: _buildTarget(context),
        ),
      ],
    );
  }

  Widget _buildSecondaryBackground(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Container(
              color: Colors.red,
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width - 32,
                maxHeight: 198,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          bucketSvg,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          sightBackgroundDelete,
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTarget(context) {
    return DragTarget<Place>(
      builder: (
        BuildContext context,
        List<Place> candidateData,
        List<dynamic> rejectedData,
      ) {
        return LongPressDraggable(
          data: place,
          axis: Axis.vertical,
          feedback: _buildCard(context),
          child: _buildCard(context),
          childWhenDragging: const SizedBox.shrink(),
        );
      },
      onAccept: (acceptedSight) {
        int targetIndex = 0;
        candidateDataList.forEach((element) {
          if (element.id == place.id)
            targetIndex = candidateDataList.indexOf(element);
        });
        int acceptedIndex = 0;
        candidateDataList.forEach((element) {
          if (element.id == acceptedSight.id)
            acceptedIndex = candidateDataList.indexOf(element);
        });

        candidateDataList[targetIndex] = acceptedSight;
        candidateDataList[acceptedIndex] = place;
        onReorderCard();
      },
    );
  }

  Widget _buildCard(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width - 32,
              maxHeight: 198,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                place.urls[0],
                height: 198,
                width: double.infinity,
                fit: BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes
                              : null,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.grey),
                          strokeWidth: 6,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          Positioned(
            top: 96,
            child: Container(
              height: descriptionCardHeight,
              width: MediaQuery.of(context).size.width - 32,
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: const Radius.circular(15),
                  bottomRight: const Radius.circular(15),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                    ),
                    child: Text(
                      place.name ?? '',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                      ),
                      child: Text(
                        closed,
                        style: textRegular14Grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned.fill(
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                borderRadius: BorderRadius.circular(16),
                onTap: () {
                  showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return SafeArea(
                        minimum: const EdgeInsets.only(top: 50),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                          child: SightDetails(place: place),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
          Positioned(
            top: 19,
            left: 16,
            child: Text(
              place.placeType ?? '',
              style: textBold14Black.copyWith(color: Colors.white),
            ),
          ),
          Positioned(
            top: 19,
            right: 16,
            child: Row(
              children: [
                firstIcon == null
                    ? const SizedBox()
                    : InkWell(
                        child: SvgPicture.asset(firstIcon),
                        onTap: () async {
                          if (firstIcon == calendar) {
                            if (Platform.isAndroid) {
                              var resDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate:
                                    DateTime.now().subtract(Duration(days: 30)),
                                lastDate:
                                    DateTime.now().add(Duration(days: 30)),
                              );
                              print(resDate);
                            } else if (Platform.isIOS) {
                              showCupertinoModalPopup(
                                context: context,
                                builder: (context) => Container(
                                  height: 300,
                                  child: CupertinoDatePicker(
                                    onDateTimeChanged: (DateTime value) {
                                      print(value);
                                    },
                                    initialDateTime: DateTime.now(),
                                    minimumDate: DateTime.now()
                                        .subtract(Duration(days: 30)),
                                    maximumDate:
                                        DateTime.now().add(Duration(days: 30)),
                                    backgroundColor:
                                        Theme.of(context).backgroundColor,
                                  ),
                                ),
                              );
                            }
                          } else
                            print('share');
                        },
                      ),
                const SizedBox(width: 23),
                InkWell(
                  child: secondIcon,
                  onTap: () => _onSecondIconTap(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onSecondIconTap(context) {
    if (secondIcon.icon == Icons.close) {
      onRemoveCard();
    } else
      Provider.of<PlaceInteractor>(context).addToFavorites(place);
  }
}
