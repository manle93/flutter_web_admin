import 'package:flutter/material.dart';
import 'package:flutter_web_admin/constant/style.dart';
import 'package:flutter_web_admin/routing/routes.dart';
import 'package:get/get.dart';

class MenuController extends GetxController {
  static MenuController instance = Get.find<MenuController>();

  var activeItem = overviewPageDisplayName.obs;
  var hoverItem = ''.obs;

  void changeActiveItemTo(String itemName) {
    activeItem.value = itemName;
  }

  void onHover(String itemName) {
    if (!isActive(itemName)) hoverItem.value = itemName;
  }

  bool isActive(String itemName) {
    return activeItem.value == itemName;
  }

  bool isHovering(String itemName) => hoverItem.value == itemName;

  Widget returnIconFor(String itemName) {
    switch (itemName) {
      case overviewPageDisplayName:
        return _customIcon(Icons.trending_up, itemName);
      case driversPageDisplayName:
        return _customIcon(Icons.drive_eta, itemName);
      case clientsPageDisplayName:
        return _customIcon(Icons.people_alt_outlined, itemName);
      case soundPageDisplayName:
        return _customIcon(Icons.play_arrow, itemName);
      case authenticationPageDisplayName:
        return _customIcon(Icons.exit_to_app, itemName);
      default:
        return _customIcon(Icons.exit_to_app, itemName);
    }
  }

  Widget _customIcon(IconData icon, String itemName) {
    if (isActive(itemName)) return Icon(icon, size: 22, color: dark);

    return Icon(icon, color: isHovering(itemName) ? dark : lightGrey);
  }
}
