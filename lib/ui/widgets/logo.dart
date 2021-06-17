import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:helpdesk/utils/style.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({this.radius = 50});

  /// Logo radius.
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: radius * 2,
      width: radius * 2,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 2),
              blurRadius: 4.0,
              color: Color.fromARGB(50, 99, 115, 129),
              spreadRadius: 1.0,
            ),
          ]),
      child: SvgPicture.asset(Style.LOGO_PATH),
    );
  }
}
