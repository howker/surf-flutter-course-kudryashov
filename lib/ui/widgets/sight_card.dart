import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mock.dart';
import 'package:places/styles.dart';
import 'package:places/svg_path_const.dart';
import 'package:places/text_string_const.dart';

/// Карточка интересного места
class SightCard extends StatelessWidget {
  Sight sight;
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

  SightCard({
    this.sight,
    this.key,
    this.onRemoveCard,
    this.onReorderCard,
    this.onDismissedCard,
  }) : super(key: key) {
    this.sight = sight ?? mocks[0];
    this.secondIcon = secondIcon ?? const Icon(Icons.favorite_border);
    this.descriptionCardHeight = 92;
    this.details = sight.details;
    this.closed = close;
    this.key = key ?? ValueKey(this.sight.nameSights);
  }
  SightCard.wantToVisit({
    this.sight,
    this.key,
    this.onRemoveCard,
    this.onReorderCard,
    this.onDismissedCard,
  }) : super(key: key) {
    firstIcon = calendar;
    secondIcon = const Icon(Icons.close);
    descriptionCardHeight = 102;
    details = planned;
    closed = close;
    detailsStyle = textRegular14Grey.copyWith(color: Colors.green);
    this.key = key ?? ValueKey(this.sight.nameSights);
  }

  SightCard.alreadyVisited({
    this.sight,
    this.key,
    this.onRemoveCard,
    this.onReorderCard,
    this.onDismissedCard,
  }) : super(key: key) {
    firstIcon = share;
    secondIcon = const Icon(Icons.close);
    descriptionCardHeight = 102;
    details = aimReached;
    closed = close;
    detailsStyle = textRegular14Grey;
    this.key = key ?? ValueKey(this.sight.nameSights);
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
    return DragTarget<Sight>(
      builder: (
        BuildContext context,
        List<Sight> candidateData,
        List<dynamic> rejectedData,
      ) {
        return LongPressDraggable(
          data: sight,
          axis: Axis.vertical,
          feedback: _buildCard(context),
          child: _buildCard(context),
          childWhenDragging: const SizedBox.shrink(),
        );
      },
      onAccept: (acceptedSight) {
        final int targetIndex = mocks.indexOf(sight);
        final int acceptedIndex = mocks.indexOf(acceptedSight);
        mocks[targetIndex] = acceptedSight;
        mocks[acceptedIndex] = sight;
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
                sight.url,
                height: 198,
                width: double.infinity,
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
                      sight.nameSights,
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
                  print('onTap');
                },
              ),
            ),
          ),
          Positioned(
            top: 19,
            left: 16,
            child: Text(
              sight.type,
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
                        onTap: _onFirstIconTap,
                      ),
                const SizedBox(width: 23),
                InkWell(
                  child: secondIcon,
                  onTap: _onSecondIconTap,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onFirstIconTap() {
    if (firstIcon == calendar) {
      print('calendar');
    } else
      print('share');
  }

  void _onSecondIconTap() {
    if (secondIcon.icon == Icons.close) {
      print('delete card');
      onRemoveCard();
    } else
      print('to favourites');
  }
}
