import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserImage extends StatelessWidget {
  const UserImage({Key? key,required this.imgUrl,required this.available}) : super(key: key);
  final String imgUrl;
  final bool available;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
            child: CachedNetworkImage(
              fit: BoxFit.fitWidth,
              imageUrl:imgUrl,
              placeholder: (context, url) => SizedBox(
                  width: 20,
                  height: 20,
                  child: Center(child: CircularProgressIndicator())),
              errorWidget: (context, url, error) => Icon(Icons.error),
            )),
        Positioned(
            bottom: 12,
            right: 4,
            child: SizedBox(
                width: 40,
                height: 40,
                child: (available)
                    ? SvgPicture.asset(
                    'assets/icons/icon-available.svg')
                    : SvgPicture.asset(
                    'assets/icons/icon-busy.svg')))
      ],
    );
  }
}
