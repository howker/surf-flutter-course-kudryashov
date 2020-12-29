import 'package:flutter/material.dart';
import 'package:places/appicons.dart';
import 'package:places/domain/sight.dart';
import 'package:places/mock.dart';
import 'package:places/styles.dart';
import 'package:places/text_string_const.dart';

/// Карточка интересного места
class SightCard extends StatelessWidget {
  Sight sight;
  Icon firstIcon, secondIcon;
  double descriptionCardHeight;
  String details;
  String closed;
  TextStyle detailsStyle;

  SightCard({
    Key key,
    this.sight,
  }) {
    this.sight = sight ?? mocks[0];
    this.secondIcon = secondIcon ?? const Icon(Appicons.heart);
    this.descriptionCardHeight = 92;
    this.details = sight.details;
    this.closed = '';
  }
  SightCard.wanttovisit(this.sight) {
    firstIcon = const Icon(
      Appicons.calendar,
      color: Colors.white,
    );
    secondIcon = const Icon(Appicons.close);
    descriptionCardHeight = 102;
    details = planned;
    closed = close;
    detailsStyle = textRegular14Grey.copyWith(color: Colors.green);
  }

  SightCard.alreadyvisited(this.sight) {
    firstIcon = const Icon(Icons.share);
    secondIcon = const Icon(Appicons.close);
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
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 16, right: 16),
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
              left: 16,
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
                      height: 14,
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
            Positioned(
              top: 19,
              left: 36,
              child: Text(
                sight.type,
                style: textBold14Black.copyWith(color: Colors.white),
              ),
            ),
            Positioned(
              top: 19,
              right: 36,
              child: Row(
                children: [
                  firstIcon ?? const SizedBox(),
                  const SizedBox(width: 23),
                  secondIcon,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
