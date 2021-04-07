import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/colors.dart';
import 'package:places/svg_path_const.dart';
import 'package:places/text_string_const.dart';

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

class OnboardCard extends StatelessWidget {
  final int index;

  const OnboardCard({Key key, this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print(index);
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
          OnboardCardItem.listsubCaption[index],
          style: Theme.of(context).textTheme.headline4,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 117),
        //
        index == 2 ? StartButton() : const SizedBox.shrink(),
      ],
    );
  }
}

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
  static const List<String> listsubCaption = [
    onboardingScreenMissSubCaptionWelcome,
    onboardingScreenSubCaptionBag,
    onboardingScreenSubCaptionClickHand,
  ];
}

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
