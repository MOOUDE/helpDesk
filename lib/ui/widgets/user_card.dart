import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:helpdesk/net/model/user.dart';
import 'package:helpdesk/ui/widgets/user_image.dart';
import 'package:helpdesk/utils/style.dart';

class UserCard extends StatelessWidget {
  const UserCard({Key? key, required this.user}) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/details',
          arguments: user,
        );
      },
      child: Card(
        elevation: 4,
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1.3,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: UserImage(
                  imgUrl: user.image ?? Style.DEFAULT_USER_IMG,
                  available: user.available ?? false,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  (user.firstName ?? "") +" "+(user.lastName??""),
                  style: Style.headingTextStyle,
                ),
              ),
            ),

            SizedBox(
              height: 8,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  user.phone ?? "",
                  style: Style.defaultBodyTextStyle
                      .copyWith(color: Colors.black.withOpacity(0.6)),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
