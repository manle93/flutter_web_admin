import 'package:flutter/material.dart';
import 'package:flutter_web_admin/pages/clients/clients.dart';
import 'package:flutter_web_admin/pages/drivers/drivers.dart';
import 'package:flutter_web_admin/pages/overview/overview.dart';
import 'package:flutter_web_admin/pages/sound/sound_page.dart';
import 'package:flutter_web_admin/routing/routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case overviewPageRoute:
      return _getPageRoute(OverviewPage());
    case driversPageRoute:
      return _getPageRoute(DriversPage());
    case clientsPageRoute:
      return _getPageRoute(ClientsPage());
    case soundPageRoute:
      return _getPageRoute(SoundsPage());
    default:
      return _getPageRoute(OverviewPage());
  }
}

PageRoute _getPageRoute(Widget child) {
  return MaterialPageRoute(builder: (context) => child);
}
