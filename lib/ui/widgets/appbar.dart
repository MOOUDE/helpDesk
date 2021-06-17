import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:helpdesk/utils/colors.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Function? onPressIcon;
  final Function? onSearchTextChanged;
  final bool? isSearch;
  final TextEditingController searchController;

  HomeAppBar(
      {this.title,
      this.onPressIcon,
      this.isSearch,
      this.onSearchTextChanged,
      required this.searchController});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 4.0,
      centerTitle: false,
      title: AnimatedCrossFade(
        duration: Duration(milliseconds: 1000),
        firstChild: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Card(
              elevation: 4,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.75,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: TextField(
                  controller: searchController,
                  textInputAction: TextInputAction.search,
                  onChanged: (text) {onSearchTextChanged!(text);},
                  decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.only(left: 8.0, bottom: 4),
                      border: InputBorder.none,
                      hintText: 'Search'),
                ),
              ),
            ),
            IconButton(
                onPressed: () {
                  onPressIcon!();
                },
                icon: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 25,
                )),
          ],
        ),
        secondChild: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title ?? "",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            IconButton(
                onPressed: () {
                  onPressIcon!();
                },
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 25,
                )),
          ],
        ),
        crossFadeState: isSearch ?? false
            ? CrossFadeState.showFirst
            : CrossFadeState.showSecond,
      ),
      backgroundColor: AppColors.lightPrimaryColor,
      automaticallyImplyLeading: false,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(65);
}

class DetailsAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 4.0,
      centerTitle: false,
      backgroundColor: AppColors.lightPrimaryColor,
      leadingWidth: 100,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Row(
          children: [
            SizedBox(
              width: 16,
            ),
            Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.white,
            ),
            SizedBox(
              width: 4,
            ),
            Text(
              'Back',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      automaticallyImplyLeading: false,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(65);
}
