import 'package:helpdesk/net/model/user.dart';

abstract class AppRepo {
  const AppRepo();

  Future<List<User>> getUsers(context);

}
