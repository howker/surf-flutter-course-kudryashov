import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:places/domain/sight.dart';
import 'package:places/mock.dart';
import 'package:places/styles.dart';
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

  SightCard({
    Key key,
    this.sight,
  }) {
    this.sight = sight ?? mocks[0];
    this.secondIcon = secondIcon ?? const Icon(Icons.favorite_border);
    this.descriptionCardHeight = 92;
    this.details = sight.details;
    this.closed = 'закрыто до 10:00';
  }
  SightCard.wantToVisit(this.sight) {
    firstIcon = 'res/icons/Calendar.svg';
    secondIcon = const Icon(Icons.close);
    descriptionCardHeight = 102;
    details = planned;
    closed = close;
    detailsStyle = textRegular14Grey.copyWith(color: Colors.green);
  }

  SightCard.alreadyVisited(this.sight) {
    firstIcon = 'res/icons/Share.svg';
    secondIcon = const Icon(Icons.close);
    descriptionCardHeight = 102;
    details = aimReached;
    closed = close;
    detailsStyle = textRegular14Grey;
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: AspectRatio(
        aspectRatio: 3 / 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Stack(
            children: [
              Container(
                height: 188,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    sight.url,
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
                left: 0,
                child: Container(
                  height: descriptionCardHeight,
                  width: 380,
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
                      Container(
                        padding: const EdgeInsets.only(
                          left: 16,
                          right: 16,
                        ),
                        child: Text(
                          details,
                          style: detailsStyle ??
                              Theme.of(context).textTheme.headline4,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
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
        ),
      ),
    );
  }

  void _onSecondIconTap() {
    if (secondIcon.icon == Icons.close) {
      print('close');
    } else
      print('to favourites');
  }

  void _onFirstIconTap() {
    if (firstIcon == 'res/icons/Calendar.svg') {
      print('calendar');
    } else
      print('share');
  }
}
