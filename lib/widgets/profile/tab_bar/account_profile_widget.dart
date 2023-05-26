import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../common/utils/colors.dart';
import '../../../common/widgets/gap.dart';
import '../../../common/widgets/horizontal_gap.dart';
import '../../../models/user_model.dart';

class AccountProfileWidget extends StatefulWidget {
  const AccountProfileWidget({super.key});

  @override
  State<AccountProfileWidget> createState() => _AccountProfileWidgetState();
}

class _AccountProfileWidgetState extends State<AccountProfileWidget> {
  var _isInit = true;
  var _loading = false;
  var _user = UserModel(
    id: 0,
    name: 'name',
    email: 'email',
    birthDate: 'birthDate',
    city: 'city',
    country: 'country',
  );

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _loading = true;
      });
      SharedPreferences.getInstance().then((prefs) {
        _user = UserModel(
            id: prefs.getInt('id') ?? 0,
            name: prefs.getString('name') ?? 'Name',
            email: prefs.getString('email') ?? 'example@email.com',
            birthDate: prefs.getString('birthDate') ?? 'birthDate',
            city: prefs.getString('city') ?? 'city',
            country: prefs.getString('country') ?? 'country');
        print('first');
        setState(() {
          _loading = false;
        });
      });
      print('second');
      _isInit = false;
    }
    super.didChangeDependencies();
  }

  static const _tagList = [
    'Piscine',
    'Soirée',
    'Internet',
    'Music',
    'Karting',
    'Jeux-Vidéo',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: _loading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(height: 10),
                Text(
                  _user.name,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const Gap(height: 10),
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: CommonColors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: CommonColors.sliverSand,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5, vertical: 4),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.wifi_calling,
                            color: CommonColors.bayLeaf,
                            size: 20.w,
                          ),
                          const HorizontalGap(width: 4),
                          SizedBox(
                            width: 100.w,
                            child: AutoSizeText(
                              '07 52 98 63 51',
                              minFontSize: 6,
                              maxLines: 1,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        color: CommonColors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: CommonColors.sliverSand,
                        ),
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 4),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.mail_outline,
                            color: CommonColors.bayLeaf,
                            size: 20.w,
                          ),
                          const HorizontalGap(width: 4),
                          SizedBox(
                            width: 135.w,
                            child: AutoSizeText(
                              _user.email,
                              minFontSize: 6,
                              maxLines: 1,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const Gap(height: 10),
                Text(
                  'Vos préférence :',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const Gap(height: 10),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: ExpansionTile(
                    shape: const Border(),
                    title: Text(
                      'Restaurant',
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                const Gap(height: 10),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: ExpansionTile(
                    shape: const Border(),
                    title: Text(
                      'Activités',
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                const Gap(height: 10),
                Wrap(
                  runSpacing: 5,
                  spacing: 5,
                  children: _tagList
                      .map(
                        (e) => Container(
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(15)),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 7, vertical: 6),
                          // margin: EdgeInsets.only(right: 5.w),
                          child: Text(e),
                        ),
                      )
                      .toList(),
                ),
                const Gap(height: 10),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: ExpansionTile(
                    shape: const Border(),
                    title: Text(
                      'Shopping',
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
