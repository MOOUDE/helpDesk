import 'package:helpdesk/net/api_executor.dart';
import 'package:helpdesk/net/model/user.dart';

import 'app_repo.dart';

class AppRepoImpl extends AppRepo {
  const AppRepoImpl(this.apiExecutor);

  final ApiExecutor apiExecutor;

  @override
  Future<List<User>> getUsers(context) {
    return apiExecutor.getUsers(context);
  }
}
