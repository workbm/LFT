import 'package:flutter/material.dart';
import 'package:lft_new_project/screens/auth/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common/utils/colors.dart';
import '../../common/widgets/horizontal_gap.dart';

class LogOutWidget extends StatefulWidget {
  const LogOutWidget({super.key});

  @override
  State<LogOutWidget> createState() => _LogOutWidgetState();
}

class _LogOutWidgetState extends State<LogOutWidget> {
  var _loading = false;
  Future<void> _logOut() async {
    setState(() {
      _loading = true;
    });
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
    setState(() {
      _loading = false;
    });
    if (!mounted) {
      return;
    }
    Navigator.pushNamed(context, Login.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7),
      ),
      child: ListTile(
        onTap: _loading ? () {} : _logOut,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(
              Icons.logout,
              color: CommonColors.red,
            ),
            HorizontalGap(width: 20),
            Text(
              'Déconnexion',
            ),
          ],
        ),
      ),
    );
  }
}
