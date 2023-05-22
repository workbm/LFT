import 'package:flutter/material.dart';
import 'package:lft_new_project/provider/home/top_activity_provider.dart';
import 'package:provider/provider.dart';

class DetailScreenProvider with ChangeNotifier {
  // ignore: prefer_final_fields
  Future<void> _futureFct = Future(() {});
  Future<void> get futureFct => _futureFct;

  Future<void> myMethod(BuildContext context, String serviceName) async {
    context.read<TopActivityProvider>().getActivities();
  }
}
