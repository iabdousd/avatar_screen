import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppDivider extends StatelessWidget {
  final double opacity;
  final double? height;
  final int angle;
  const AppDivider({
    Key? key,
    this.height,
    this.opacity: .5,
    this.angle: 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? MediaQuery.of(context).size.height * 0.035,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Divider(
            color: Theme.of(context).primaryColor,
          ),
          Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            left: 0,
            child: RotatedBox(
              quarterTurns: angle,
              child: Opacity(
                opacity: opacity,
                child: SvgPicture.asset(
                  'assets/svgs/line_ornament.svg',
                  height: height ?? MediaQuery.of(context).size.width * 0.075,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
