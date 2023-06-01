import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/src/atomic/padding.dart';
import 'package:portfolio/src/core/extensions/context_extension.dart';

import '../../../atomic/animated_bubble_button.dart';
import '../../../atomic/animated_line_through_text.dart';
import '../../../atomic/animated_positioned_widget.dart';
import '../../../atomic/animated_text_slide_box_transition.dart';
import '../../../core/theme/colors.dart';
import '../../../core/utils/utils.dart';
import '../../contact/models/social_data.dart';

class DevIntroduction extends StatefulWidget {
  const DevIntroduction({
    Key? key,
    required this.controller,
    required this.width,
  }) : super(key: key);

  final AnimationController controller;
  final double width;

  @override
  _DevIntroductionState createState() => _DevIntroductionState();
}

class _DevIntroductionState extends State<DevIntroduction> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = context.textTheme;
    EdgeInsetsGeometry margin = const EdgeInsets.only(left: 16);
    final CurvedAnimation curvedAnimation = CurvedAnimation(
      parent: widget.controller,
      curve: const Interval(0.6, 1.0, curve: Curves.fastOutSlowIn),
    );
    double headerFontSize = context.responsiveSize(28, 48, md: 36, sm: 32);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: margin,
          child: AnimatedTextSlideBoxTransition(
            controller: widget.controller,
            text: 'Hello',
            width: widget.width,
            maxLines: 3,
            textStyle: textTheme.displayMedium?.copyWith(
              color: AppColors.black,
              fontSize: headerFontSize,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        padding12,
        Container(
          margin: margin,
          child: AnimatedTextSlideBoxTransition(
            controller: widget.controller,
            text: 'I\'m Pratik Pawar',
            width: widget.width,
            maxLines: 3,
            textStyle: textTheme.displayMedium?.copyWith(
              color: AppColors.black,
              fontSize: headerFontSize,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        padding32,
        // Container(
        //   margin: margin,
        //   child: AnimatedPositionedText(
        //     controller: curvedAnimation,
        //     width: widget.width,
        //     maxLines: 3,
        //     factor: 2,
        //     text: 'Flutter Developer / Mobile Developer/ Flutter Entusiast',
        //     textStyle: textTheme.bodyLarge?.copyWith(
        //       fontSize: context.responsiveSize(16, 18),
        //       height: 2,fontWeight: FontWeight.w500,
        //     ),
        //   ),
        // ),
        Container(
          margin: margin,
          child: DefaultTextStyle(
            style: context.textTheme.titleLarge!.copyWith(
              fontSize: context.responsiveSize(16, 18),
              height: 2,
              fontWeight: FontWeight.w500,
            ),
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText('Mobile Application Developer',
                    speed: Duration(milliseconds: 150)),
                TypewriterAnimatedText('Flutter Entusiast',
                    speed: Duration(milliseconds: 150)),
                TypewriterAnimatedText('Flutter Developer',
                    speed: Duration(milliseconds: 150)),
              ],
            ),
          ),
        ),
        padding32,
        AnimatedPositionedWidget(
          controller: curvedAnimation,
          width: 200,
          height: 60,
          child: AnimatedBubbleButton(
            color: AppColors.grey100,
            imageColor: AppColors.black,
            startOffset: const Offset(0, 0),
            targetOffset: const Offset(0.1, 0),
            targetWidth: 200,
            startBorderRadius: const BorderRadius.all(
              Radius.circular(100.0),
            ),
            title: 'MY WORKS',
            titleStyle: textTheme.bodyLarge?.copyWith(
              color: AppColors.black,
              fontWeight: FontWeight.w700,
              fontSize: context.responsiveSize(14, 16, sm: 15),
            ),
            onTap: () {
              // Navigator.pushNamed(context, WorksPage.worksPageRoute);
            },
          ),
        ),
        padding36,
        Container(
          margin: margin,
          child: Wrap(
            spacing: 20,
            runSpacing: 20,
            children: _buildSocials(
              context: context,
              data: SocialData.socialData,
            ),
          ),
        )
      ],
    );
  }

  List<Widget> _buildSocials({
    required BuildContext context,
    required List<SocialData> data,
  }) {
    TextTheme textTheme = Theme.of(context).textTheme;
    TextStyle? style = textTheme.bodyText1?.copyWith(color: AppColors.grey750);
    TextStyle? slashStyle = textTheme.bodyText1?.copyWith(
      color: AppColors.grey750,
      fontWeight: FontWeight.w400,
      fontSize: 18,
    );
    List<Widget> items = [];

    for (int index = 0; index < data.length; index++) {
      items.add(
        AnimatedLineThroughText(
          text: data[index].name,
          isUnderlinedByDefault: true,
          controller: widget.controller,
          hasSlideBoxAnimation: true,
          hasOffsetAnimation: true,
          isUnderlinedOnHover: false,
          onTap: () {
            Utils.launchWebsite(data[index].url);
          },
          textStyle: style,
        ),
      );

      if (index < data.length - 1) {
        items.add(
          Text('/', style: slashStyle),
        );
      }
    }

    return items;
  }
}
