import 'package:flutter/material.dart';
import 'package:portfolio/src/core/extensions/context_extension.dart';
import 'package:portfolio/src/features/home/widgets/dev_introduction.dart';
import 'package:portfolio/src/features/home/widgets/dev_profile.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../../atomic/animated_slide_transtion.dart';
import '../../../core/constants/animations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController controller;
  late AnimationController scrollDownButtonController;
  late Animation<Offset> animation;
  late Animation<Offset> scrollDownBtnAnimation;

  late AnimationController _slideTextController;

  @override
  void initState() {
    scrollDownButtonController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _slideTextController = AnimationController(
      vsync: this,
      duration: Animations.slideAnimationDurationLong,
    );
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1500),
    )..repeat();
    animation = Tween<Offset>(
      begin: Offset(0, 0.05),
      end: Offset(0, -0.05),
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ),
    );
    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });

    controller.forward();
    _slideTextController.forward();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    scrollDownButtonController.dispose();
    _slideTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = context.screenWidth;
    final double screenHeight = context.screenHeight;
    final EdgeInsets textMargin = EdgeInsets.only(
      left: context.responsiveSize(
        20,
        screenWidth * 0.15,
        sm: screenWidth * 0.15,
      ),
      top: context.responsiveSize(
        60,
        screenHeight * 0.35,
        sm: screenHeight * 0.35,
      ),
      bottom: context.responsiveSize(20, 40),
    );
    final EdgeInsets padding = EdgeInsets.symmetric(
      horizontal: screenWidth * 0.1,
      vertical: screenHeight * 0.1,
    );
    final EdgeInsets imageMargin = EdgeInsets.only(
      right: context.responsiveSize(
        20,
        screenWidth * 0.05,
        sm: screenWidth * 0.05,
      ),
      top: context.responsiveSize(
        30,
        screenHeight * 0.25,
        sm: screenHeight * 0.25,
      ),
      bottom: context.responsiveSize(20, 40),
    );

    return SingleChildScrollView(
      child: Column(
        children: [
          ResponsiveBuilder(builder: (context, sizingInformation) {
            double screenWidth = sizingInformation.screenSize.width;
            if (screenWidth < const RefinedBreakpoints().tabletNormal) {
              return Column(
                children: [
                  Container(
                    padding: padding,
                    child: AnimatedSlideTranstion(
                      controller: _slideTextController,
                      position: animation,
                      child: const DevProfile(),
                    ),
                  ),
                  Container(
                    width: screenWidth,
                    padding: padding.copyWith(top: 0),
                    child: DevIntroduction(
                      controller: controller,
                      width: screenWidth,
                    ),
                  ),
                ],
              );
            } else {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: textMargin,
                    width: screenWidth * 0.40,
                    child: DevIntroduction(
                      controller: _slideTextController,
                      width: screenWidth * 0.40,
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.05),
                  Container(
                    margin: imageMargin,
                    child: const DevProfile(),
                  ),
                ],
              );
            }
          }),
        ],
      ),
    );
  }
}
