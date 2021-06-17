import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:helpdesk/net/model/user.dart';
import 'package:helpdesk/ui/widgets/appbar.dart';
import 'package:helpdesk/ui/widgets/user_image.dart';
import 'package:helpdesk/utils/style.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DetailsAppBar(),
      body: _buildBody(),
    );
  }

  _buildBody() {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            ///user image
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: AspectRatio(
                aspectRatio: 1.2,
                child: UserImage(
                  available: user.available ?? false,
                  imgUrl: user.image ?? Style.DEFAULT_USER_IMG,
                ),
              ),
            ),

            ///user name
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  (user.firstName ?? "") + " " + (user.lastName ?? ""),
                  style: Style.headingTextStyle
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),

            ///user phone
            infoText(("Phone: ") + (user.phone ?? "")),
            SizedBox(
              height: 8,
            ),

            ///user email
            infoText(("Email: ") + (user.email ?? "")),

            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
  infoText(text){
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
         text,
          style: Style.defaultBodyTextStyle.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.black.withOpacity(0.6)),
        ),
      ),
    );
  }
}
