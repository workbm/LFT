import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:lft_new_project/common/utils/api.dart';
import 'package:lft_new_project/models/event_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AgendaEventProvider with ChangeNotifier {
  List<EventModel> _events = [];
  List<EventModel> get events => _events;
  List<EventModel> _eventsByDate = [];
  List<EventModel> get eventsByDate => _eventsByDate;
  // Fcts
  Future<void> getEventsFct() async {
    _events = [];
    //
    try {
      //token
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      // Declarations
      final url = Uri.parse(Api.url + Api.agenda);
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
      List<EventModel> extractedEvents = [];
      for (var element in responseData) {
        extractedEvents.add(
          EventModel(
            id: element['id'] ?? 0,
            name: element['title'] ?? '',
            description: element['description'] ?? '',
            address: element['address'] ?? '',
            date: DateTime.parse(element['date'] ?? ''),
            startTime: element['startTime'] ?? '',
            endTime: element['endTime'] ?? '',
          ),
        );
      }
      _events = extractedEvents;
      notifyListeners();
    } catch (err) {
      print('err');
      print(err);
      rethrow;
    }
  }

  // Events By Date
  void eventsByDateFct(DateTime date) {
    _eventsByDate = _events.where((element) => element.date == date).toList();
    notifyListeners();
  }
}
