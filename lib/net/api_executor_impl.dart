import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'api_executor.dart';
import 'mock_json.dart';
import 'model/user.dart';

class ApiExecutorImpl extends ApiExecutor {
  @override
  Future<List<User>> getUsers(context) async {
    // read data from JSON file
    String data = await DefaultAssetBundle.of(context)
        .loadString(JSON_FILE_PATH);

    return userFromJson(data);
  }
}
