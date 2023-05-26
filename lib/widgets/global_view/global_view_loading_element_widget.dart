import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lft_new_project/provider/detail_screen_provider/detail_screen_provider.dart';
import 'package:provider/provider.dart';

import '../../common/utils/constants.dart';
import '../../models/service_model.dart';
import '../../provider/home/top_activity_provider.dart';
import '../../provider/home/top_restaurant_provider.dart';
import 'global_view_snippet.dart';

class GlobalViewLoadingElementWidget extends StatefulWidget {
  const GlobalViewLoadingElementWidget({super.key});

  @override
  State<GlobalViewLoadingElementWidget> createState() =>
      _GlobalViewLoadingElementWidgetState();
}

class _GlobalViewLoadingElementWidgetState
    extends State<GlobalViewLoadingElementWidget> {
  var _isInit = true;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      // context.read<TopActivityProvider>().getActivities()
      context.read<DetailScreenProvider>().futureFct.then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    List<ServiceModel> listenData;
    context
            .read<DetailScreenProvider>()
            .serviceName
            .contains(ConstantsClass.laFamilleGourmandeName)
        ? listenData = context.watch<TopRestaurantProvider>().restaurants
        : listenData = context.watch<TopActivityProvider>().activities;

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
                itemCount: listenData.length,
                itemBuilder: (context, index) {
                  return GlobalViewSnippet(
                    serviceModel: listenData[index],
                  );
                },
              ));
  }
}
