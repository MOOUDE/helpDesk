import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:helpdesk/app/routes.dart';
import 'package:helpdesk/generated/l10n.dart';
import 'package:helpdesk/net/api_executor.dart';
import 'package:helpdesk/repo/index.dart';
import 'package:helpdesk/utils/style.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart'; // important

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

class HelpDeskApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<AppRepo>(
              create: (context) => AppRepoImpl(GetIt.instance<ApiExecutor>())),
        ],
        child: GetMaterialApp(
          title: 'Help Desk',
          navigatorKey: rootNavigatorKey,
          onGenerateRoute: Routes.generateRoute,
          initialRoute: '/',
          theme: Style.light,
          debugShowCheckedModeBanner: false,
          builder: (context,child) => MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: child!),
          localizationsDelegates: [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            S.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
        ));
  }
}
