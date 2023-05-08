import 'package:flutter/material.dart';

import '../../../common/widgets/padding.dart';

class MenuWidget extends StatelessWidget {
  const MenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return PaddingWidget(
      horizontal: size.width * 0.04,
      vertical: 10,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: Image.asset('assets/img/menu.png'),
          ),
        ],
      ),
    );
  }
}
