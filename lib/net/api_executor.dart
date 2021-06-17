import 'package:helpdesk/net/model/user.dart';

abstract class ApiExecutor {
  Future<List<User>> getUsers(context);
}
