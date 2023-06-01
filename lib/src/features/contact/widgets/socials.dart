import 'package:flutter/material.dart';
import 'package:portfolio/src/atomic/padding.dart';

import '../../../core/theme/colors.dart';
import '../../../core/utils/utils.dart';
import '../models/social_data.dart';


class Socials extends StatelessWidget {
  Socials({
    Key? key,
    required this.socialData,
    this.size = 18,
    this.color = AppColors.white,
    this.spacing = 40,
    this.runSpacing = 16,
    this.isHorizontal = true,
  })  : assert(socialData.isNotEmpty),
        super(key: key);

  final List<SocialData> socialData;
  final double size;
  final Color color;
  final double spacing;
  final double runSpacing;
  final bool isHorizontal;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: isHorizontal ? Wrap(
        spacing: spacing,
        runSpacing: runSpacing,
        children: _buildSocialIcons(socialData),
      ) : Column(
        children: _buildSocialIcons(socialData),
      ),
    );
  }

  List<Widget> _buildSocialIcons(List<SocialData> socialData) {
    List<Widget> items = [];

    for (int index = 0; index < socialData.length; index++) {
      items.add(
        InkWell(
          onTap: () => Utils.launchWebsite(socialData[index].url),
          child: Icon(
            socialData[index].iconData,
            color: socialData[index].color ?? color,
            size: size,
          ),
        ),
      );

      // if it is vertical, add spaces
      if(!isHorizontal) {
        items.add(padding32);
      }
    }

    return items;
  }
}
