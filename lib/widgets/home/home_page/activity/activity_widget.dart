import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lft_new_project/provider/home/top_activity_provider.dart';
import 'package:lft_new_project/widgets/home/home_page/activity/activity_snippet.dart';
import 'package:provider/provider.dart';

class ActivityWidget extends StatefulWidget {
  const ActivityWidget({super.key});

  @override
  State<ActivityWidget> createState() => _ActivityWidgetState();
}

class _ActivityWidgetState extends State<ActivityWidget> {
  var _isLoading = false;
  @override
  void initState() {
    setState(() {
      _isLoading = true;
    });
    context.read<TopActivityProvider>().getActivities().then((_) {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var listenData = context.watch<TopActivityProvider>();
    return Container(
      // decoration: const BoxDecoration(color: Colors.orange),
      height: 230.h,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 5),
      child: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              shrinkWrap: true,
              itemCount: listenData.activities.length,
              itemBuilder: (context, index) => ActivitySnippet(index: index),
            ),
    );
  }
}
