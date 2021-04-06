import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/colors.dart';
import 'package:places/domain/sight.dart';
import 'package:places/styles.dart';
import 'package:places/svg_path_const.dart';
import 'package:places/text_string_const.dart';

/// Экран детализации интересного места
class SightDetails extends StatelessWidget {
  final Sight sight;
  PageController _pageController = PageController();

  SightDetails({this.sight}) {
    _initPageController();
  }

  void _initPageController() {
    int currentPage = 0;
    Timer.periodic(
      Duration(seconds: 3),
      (timer) {
        _pageController.nextPage(
          duration: Duration(seconds: 3),
          curve: Curves.linear,
        );
        currentPage++;
        if (currentPage > 3) {
          currentPage = 0;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          SizedBox(
            height: 360,
            child: PageView.builder(
              controller: _pageController,
              itemCount: sight.urlsImages.length,
              itemBuilder: (BuildContext context, int index) {
                return ImageGallery(sight: sight, index: index);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const SizedBox(
                  height: 24,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    sight.nameSights,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Text(
                        sight.type,
                        style: Theme.of(context).textTheme.subtitle2,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        close,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    sight.details,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 48),
                  ),
                  onPressed: () {
                    print('ПОСТРОИТЬ МАРШРУТ');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        go,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        buildRoute,
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                const Divider(),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      IconButton(
                        padding: EdgeInsets.only(left: 33),
                        icon: Icon(
                          Icons.calendar_today,
                          color: lmInactiveBlackColor,
                        ),
                        onPressed: () {
                          print('Запланировать');
                        },
                      ),
                      const SizedBox(width: 9),
                      Text(
                        toPlain,
                        style: textRegular14Grey.copyWith(
                          color: lmInactiveBlackColor,
                        ),
                      ),
                      IconButton(
                        padding: EdgeInsets.only(left: 40),
                        icon: Icon(
                          Icons.favorite_border,
                          color: Theme.of(context).primaryColorDark,
                        ),
                        onPressed: () {
                          print('В избранное');
                        },
                      ),
                      const SizedBox(width: 9),
                      Text(
                        toFavorites,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ImageGallery extends StatelessWidget {
  ImageGallery({
    Key key,
    this.sight,
    this.index,
  });

  final Sight sight;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 360,
          child: Image.network(
            sight.urlsImages[index] ?? 0,
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
        Positioned(
          top: 36,
          left: 16,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).primaryColor,
            ),
            child: InkWell(
              onTap: () {
                print('back');
              },
              child: Container(
                width: 32,
                height: 32,
                child: Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Theme.of(context).primaryColorDark,
                      size: 15,
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
