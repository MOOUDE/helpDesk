import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:helpdesk/generated/l10n.dart';
import 'package:helpdesk/net/api_executor.dart';
import 'package:helpdesk/net/model/user.dart';
import 'package:helpdesk/repo/app_repo.dart';
import 'package:helpdesk/repo/app_repo_impl.dart';
import 'package:helpdesk/ui/widgets/appbar.dart';
import 'package:helpdesk/ui/widgets/user_card.dart';
import 'package:helpdesk/utils/style.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;
  bool isSearchMode = false;
  TextEditingController searchController = TextEditingController();
  List<User> users = [];
  List<User> searchUsers = [];

  @override
  void initState() {
    super.initState();
    getUsersData(context);
  }

  ///To use

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        searchController:searchController,
         isSearch: isSearchMode,
          onSearchTextChanged: onSearchTextChanged,
          title: 'Support Desk',
          onPressIcon: () {
            setState(() {
              isSearchMode = !isSearchMode;
              searchController.clear();
            });
          }),
      body: _buildHomeBody(),
    );
  }

  ///  perform searching from the appBar
  void onSearchTextChanged(text){
    List<User> searchUserResults = [];
    if(text == ''){
      setState(() {
        searchUsers = users;
      });
    }

    if(users.length > 0 && users.isNotEmpty){
      searchUserResults =  users.where((user) => user.firstName.toString().contains(text)
          || user.lastName.toString().contains(text)).toList();
      setState(() {
        searchUsers = searchUserResults;
      });
    }
  }

  _buildHomeBody() {
    return Container(
      ///Using SafeArea to avoid cut in devices with notch in landscape mode
      child: SafeArea(
        child: Center(
          child: isLoading
              ? CircularProgressIndicator()
              : isSearchMode && searchUsers.isEmpty?
                Text('No search results',style: Style.headingTextStyle,)
          :GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 400,
                  ),
                  itemCount: isSearchMode ? searchUsers.length :users.length,
                  itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          color: Colors.white,
                          child: UserCard(
                            user: isSearchMode? searchUsers[index]:users[index],
                          ),
                        ),
                      )),
        ),
      ),
    );
  }

  getUsersData(context) async {
    setState(() {
      isLoading = true;
    });

    var model = GetIt.instance<ApiExecutor>();
    List<User> usersList = await model.getUsers(context);
    print('users ' + users.toString());

    setState(() {
      users = usersList;
      isLoading = false;
    });
  }
}
