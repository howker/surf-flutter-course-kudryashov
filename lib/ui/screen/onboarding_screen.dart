import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/colors.dart';
import 'package:places/svg_path_const.dart';
import 'package:places/text_string_const.dart';

///Экран онбординга
class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return OnboardCard(index: index);
              },
            ),
          ),
        ],
      ),
    );
  }
}

///Карточка экрана OnboardingScreen
class OnboardCard extends StatelessWidget {
  final int index;

  OnboardCard({Key key, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Widget> pagesIndicatorList = [
      Container(
        width: 24,
        height: 8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.green,
        ),
      ),
      Container(
        width: 8,
        height: 8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey,
        ),
      ),
      Container(
        width: 8,
        height: 8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey,
        ),
      ),
    ];

    if (index == 1)
      pagesIndicatorList.insert(index, pagesIndicatorList.removeAt(index - 1));
    if (index == 2)
      pagesIndicatorList.insert(index, pagesIndicatorList.removeAt(0));

    return Column(
      children: [
        const SizedBox(height: 42),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                onboardingScreenMiss,
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(color: Colors.green),
              ),
            ),
            const SizedBox(width: 16),
          ],
        ),
        const SizedBox(height: 198),
        SvgPicture.asset(
          OnboardCardItem.listSvgPath[index],
          color: lmBackgroundBlackColor,
        ),
        const SizedBox(height: 47),
        Text(
          OnboardCardItem.listCaption[index],
          style: Theme.of(context).textTheme.subtitle1.copyWith(
                color: lmBackgroundBlackColor,
              ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          OnboardCardItem.listSubCaption[index],
          style: Theme.of(context).textTheme.headline4,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 117),
        SizedBox(
          width: 56,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: pagesIndicatorList,
          ),
        ),
        const SizedBox(height: 32),
        index == 2 ? const StartButton() : const SizedBox.shrink(),
      ],
    );
  }
}

///Хранит пути для svg и текстов для OnboardingScreen
class OnboardCardItem {
  OnboardCardItem(this.index);
  final int index;

  static const List<String> listSvgPath = [
    clickHandSvg,
    bagSvg,
    welcomeSvg,
  ];
  static const List<String> listCaption = [
    onboardingScreenCaptionWelcome,
    onboardingScreenCaptionBag,
    onboardingScreenCaptionClickHand,
  ];
  static const List<String> listSubCaption = [
    onboardingScreenMissSubCaptionWelcome,
    onboardingScreenSubCaptionBag,
    onboardingScreenSubCaptionClickHand,
  ];
}

///Кнопка "на старт" экрана OnboardingScreen
class StartButton extends StatelessWidget {
  const StartButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 8.0,
        left: 16,
        right: 16,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 48),
        ),
        onPressed: () {},
        child: Text(
          onboardingScreenToStartButton,
          style: Theme.of(context).textTheme.bodyText2,
        ),
      ),
    );
  }
}
