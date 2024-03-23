import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/const.dart';

class SVG extends StatelessWidget {
  const SVG(this.asset,
      {super.key,
      this.icon = false,
      this.fit = BoxFit.cover,
      this.width,
      this.height});

  final String asset;
  final bool icon;
  final BoxFit fit;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      fit: fit,
      icon ? '$icons$asset' : '$images$asset',
      width: width,
      height: height,
    );
  }
}
