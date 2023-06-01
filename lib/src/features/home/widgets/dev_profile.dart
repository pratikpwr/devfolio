import 'package:flutter/material.dart';
import 'package:portfolio/src/core/extensions/context_extension.dart';

import '../../../../palette.dart';

class DevProfile extends StatelessWidget {
  const DevProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenWidth * 0.3,
      width: context.screenWidth * 0.3,
      decoration: const BoxDecoration(
        color: Palette.lightPrimaryColor,
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(
            'pratik.png',
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
