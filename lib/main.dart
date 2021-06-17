import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:helpdesk/app/help_desk.dart';
import 'package:helpdesk/repo/app_repo.dart';
import 'package:helpdesk/repo/app_repo.dart';
import 'package:helpdesk/repo/app_repo_impl.dart';
import 'net/index.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  _setup();
  runApp(HelpDeskApp());
}

void _setup() {
  final getIt = GetIt.instance;
  getIt.registerLazySingleton<ApiExecutor>(() => ApiExecutorImpl());
}
