import 'package:flutter/material.dart';
import 'package:lft_new_project/common/utils/sizes.dart';
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
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: CommonSizes.paddingWith),
              child: ListView.builder(
                itemCount: listenData.activities.length,
                itemBuilder: (context, index) => ActivitySnippet(index: index),
              ),
            ),
    );
  }
}
