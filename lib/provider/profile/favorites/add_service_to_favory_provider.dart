import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:lft_new_project/common/utils/api.dart';
import 'package:lft_new_project/common/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddServiceElementToFavoryProvider with ChangeNotifier {
  Future<void> addElementFct(int id, String serviceModel) async {
    // ServiceModel Choice
    var serviceUrl = '';

    if (serviceModel.contains(ConstantsClass.laFamilleGourmandeName)) {
      serviceUrl = Api.addRestaurantToFavoris;
    }
    if (serviceModel.contains(ConstantsClass.laFamilleSamuseName)) {
      serviceUrl = Api.addActivityToFavoris;
    }
    if (serviceModel.contains(ConstantsClass.laFamilleVisiteName)) {
      serviceUrl = Api.addPublicPlaceToFavoris;
    }
    if (serviceModel.contains(ConstantsClass.laFamilleShopName)) {
      serviceUrl = Api.addShoppingToFavoris;
    }
    // Token
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    // Declarations
    final url = Uri.parse('${Api.url}$serviceUrl$id');
    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'X-Requested-With': "XMLHttpRequest",
          'Authorization': 'Bearer $token',
        },
      );
      var responseData = json.decode(response.body);
      print('responseData');
      print(responseData);
      notifyListeners();
    } catch (err) {
      print('err');
      print(err);
      rethrow;
    }
  }
}
