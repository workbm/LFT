import 'package:flutter/material.dart';
import 'package:lft_new_project/provider/home/top_activity_provider.dart';
import 'package:lft_new_project/provider/home/top_restaurant_provider.dart';
import 'package:provider/provider.dart';

import 'package:lft_new_project/common/utils/constants.dart';

class DetailScreenProvider with ChangeNotifier {
  // ignore: prefer_final_fields
  Future<void> _futureFct = Future(() {});
  Future<void> get futureFct => _futureFct;

  String _serviceName = '';
  String get serviceName => _serviceName;

  void serviceChoice(BuildContext context, String serviceNameArg) {
    if (serviceNameArg.contains(ConstantsClass.laFamilleGourmandeName)) {
      _futureFct = context.read<TopRestaurantProvider>().getRestaurants();
    }
    if (serviceNameArg.contains(ConstantsClass.laFamilleSamuseName)) {
      _futureFct = context.read<TopActivityProvider>().getActivities();
    }
    if (serviceNameArg.contains(ConstantsClass.laFamilleVisiteName)) {
      _futureFct = context.read<TopActivityProvider>().getActivities();
    }
    if (serviceNameArg.contains(ConstantsClass.laFamilleShopName)) {
      _futureFct = context.read<TopActivityProvider>().getActivities();
    }
    if (serviceNameArg.contains(ConstantsClass.infosPratiquesName)) {
      _futureFct = context.read<TopActivityProvider>().getActivities();
    }
    _serviceName = serviceNameArg;
    if (serviceNameArg.isEmpty) {
      _serviceName = ConstantsClass.laFamilleGourmandeName;
      _futureFct = context.read<TopActivityProvider>().getActivities();
    }
    notifyListeners();
  }
}
