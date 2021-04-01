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

  SightCard({this.sight, this.key, this.onRemoveCard}) : super(key: key) {
    this.sight = sight ?? mocks[0];
    this.secondIcon = secondIcon ?? const Icon(Icons.favorite_border);
    this.descriptionCardHeight = 92;
    this.details = sight.details;
    this.closed = close;
    this.key = key ?? ValueKey(this.sight.nameSights);
  }
  SightCard.wantToVisit({this.sight, this.key, this.onRemoveCard})
      : super(key: key) {
    firstIcon = calendar;
    secondIcon = const Icon(Icons.close);
    descriptionCardHeight = 102;
    details = planned;
    closed = close;
    detailsStyle = textRegular14Grey.copyWith(color: Colors.green);
    this.key = key ?? ValueKey(this.sight.nameSights);
  }

  SightCard.alreadyVisited({this.sight, this.key, this.onRemoveCard})
      : super(key: key) {
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
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Material(
        child: buildStack(context),
      ),
    );
  }

  Widget buildStack(BuildContext context) {
    return Stack(
      children: [
        Image.network(
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
        Positioned(
          top: 96,
          child: Container(
            height: descriptionCardHeight,
            width: MediaQuery.of(context).size.width,
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
          bottom: 57,
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
    );
  }

  void _onSecondIconTap() {
    if (secondIcon.icon == Icons.close) {
      print('delete card');
      onRemoveCard();
    } else
      print('to favourites');
  }

  void _onFirstIconTap() {
    if (firstIcon == calendar) {
      print('calendar');
    } else
      print('share');
  }
}

// Stack buildStack(BuildContext context) {
//     return Stack(
//         children: [
//           Container(
//             height: 188,
//             width: double.infinity,
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(15),
//               child: Image.network(
//                 sight.url,
//                 fit: BoxFit.cover,
//                 loadingBuilder: (BuildContext context, Widget child,
//                     ImageChunkEvent loadingProgress) {
//                   if (loadingProgress == null) return child;
//                   return Center(
//                     child: CircularProgressIndicator(
//                       value: loadingProgress.expectedTotalBytes != null
//                           ? loadingProgress.cumulativeBytesLoaded /
//                               loadingProgress.expectedTotalBytes
//                           : null,
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),
//           Positioned(
//             top: 120,
//             left: 0,
//             child: Container(
//               height: descriptionCardHeight,
//               width: 380,
//               decoration: BoxDecoration(
//                 color: Theme.of(context).backgroundColor,
//                 borderRadius: const BorderRadius.only(
//                   bottomLeft: const Radius.circular(15),
//                   bottomRight: const Radius.circular(15),
//                 ),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(
//                     height: 16,
//                   ),
//                   Container(
//                     padding: const EdgeInsets.only(
//                       left: 16,
//                       right: 16,
//                     ),
//                     child: Text(
//                       sight.nameSights,
//                       style: Theme.of(context).textTheme.headline5,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 2,
//                   ),
//                   Expanded(
//                     child: Container(
//                       padding: const EdgeInsets.only(
//                         left: 16,
//                         right: 16,
//                       ),
//                       child: Text(
//                         closed,
//                         style: textRegular14Grey,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Positioned.fill(
//             bottom: 62,
//             child: Material(
//               type: MaterialType.transparency,
//               child: InkWell(
//                 borderRadius: BorderRadius.circular(16),
//                 onTap: () {
//                   print('onTap');
//                 },
//               ),
//             ),
//           ),
//           Positioned(
//             top: 19,
//             left: 16,
//             child: Text(
//               sight.type,
//               style: textBold14Black.copyWith(color: Colors.white),
//             ),
//           ),
//           Positioned(
//             top: 19,
//             right: 16,
//             child: Row(
//               children: [
//                 firstIcon == null
//                     ? const SizedBox()
//                     : InkWell(
//                         child: SvgPicture.asset(firstIcon),
//                         onTap: _onFirstIconTap,
//                       ),
//                 const SizedBox(width: 23),
//                 InkWell(
//                   child: secondIcon,
//                   onTap: _onSecondIconTap,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       );
//   }
