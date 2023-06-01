import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/theme/colors.dart';

class SocialData {
  final IconData iconData;
  final String url;
  final String name;
  final Color? color;

  SocialData({
    required this.name,
    required this.iconData,
    required this.url,
    this.color = AppColors.white,
  });

  static List<SocialData> socialData = [
    SocialData(
      name: 'GITHUB',
      iconData: FontAwesomeIcons.github,
      url: 'www.github.com/pratikpwr',
    ),
    SocialData(
      name: 'LINKEDIN',
      iconData: FontAwesomeIcons.linkedin,
      url: 'www.linkedin.com/in/pratikpwr',
    ),
    SocialData(
      name: 'TWITTER',
      iconData: FontAwesomeIcons.twitter,
      url: 'www.twitter.com/pratikpwr',
    ),
    SocialData(
      name: 'INSTAGRAM',
      iconData: FontAwesomeIcons.instagram,
      url: 'www.instagram.com/pratikpwr',
    ),
  ];
}
