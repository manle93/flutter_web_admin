import 'package:flutter/cupertino.dart';
import 'package:flutter_web_admin/constant/controller.dart';
import 'package:flutter_web_admin/routing/router.dart';
import 'package:flutter_web_admin/routing/routes.dart';

Navigator localNavigator() => Navigator(
      key: navigationController.navigatorKey,
      onGenerateRoute: generateRoute,
      initialRoute: overviewPageRoute,
    );
