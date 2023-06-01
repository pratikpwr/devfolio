import 'package:flutter/material.dart';
import 'package:layout/layout.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../layout/adaptive.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  TextTheme get textTheme => Theme.of(this).textTheme;

  double get screenHeight => mediaQuery.size.height;

  double get screenWidth => mediaQuery.size.width;
}

const desktopPortraitBreakpoint = 700.0;
const desktopLandscapeBreakpoint = 1000.0;
const ipadProBreakpoint = 1000.0;

extension DisplayTypeFromContext on BuildContext {
  DisplayType get displayType {
    final orientation = mediaQuery.orientation;
    final width = mediaQuery.size.width;

    if ((orientation == Orientation.landscape &&
            width > desktopLandscapeBreakpoint) ||
        (orientation == Orientation.portrait &&
            width > desktopPortraitBreakpoint)) {
      return DisplayType.desktop;
    } else {
      return DisplayType.mobile;
    }
  }

  bool get isDisplayDesktop => displayType == DisplayType.desktop;

  bool get isDisplayMobile =>
      mediaQuery.size.width <= const RefinedBreakpoints().tabletSmall;

  bool get isDisplayMobileOrTablet =>
      mediaQuery.size.width <= const RefinedBreakpoints().tabletNormal;

  bool get isDisplaySmallDesktop =>
      isDisplayDesktop && mediaQuery.size.width < desktopLandscapeBreakpoint;

  bool get isDisplaySmallDesktopOrIpadPro =>
      isDisplaySmallDesktop ||
      (mediaQuery.size.width > ipadProBreakpoint &&
          mediaQuery.size.width < 1170);

  double assignHeight(
    double fraction, {
    double additions = 0,
    double subs = 0,
  }) {
    return (screenHeight - subs + additions) * fraction;
  }

  double assignWidth(
    double fraction, {
    double additions = 0,
    double subs = 0,
  }) {
    return (screenWidth - subs + additions) * fraction;
  }

  double responsiveSize(
    double xs,
    double lg, {
    double? sm,
    double? md,
    double? xl,
  }) {
    return  layout.value<double>(
      xs: xs,
      sm: sm ?? (md ?? xs),
      //assign md to sm if it is not null, if null assign xs
      md: md ?? lg,
      lg: lg,
      xl: xl ?? lg,
    );
  }
}
