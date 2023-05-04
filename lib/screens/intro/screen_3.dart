import 'package:flutter/material.dart';

import '../../common/utils/colors.dart';
import '../../common/widgets/gap.dart';
import '../../common/widgets/padding.dart';
import '../../widgets/intro/row_widget.dart';
import '../../widgets/intro/skipe_widget.dart';
import 'screen_2.dart';
import 'screen_4.dart';

class Screen3 extends StatelessWidget {
  const Screen3({super.key});
  static const routeName = '/screen-3';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: size.height,
          width: size.width,
          color: CommonColors.white,
          child: PaddingWidget(
            horizontal: 15,
            vertical: 5,
            child: SingleChildScrollView(
              child: GestureDetector(
                onHorizontalDragEnd: (details) {
                  if (details.primaryVelocity == 0) return;
                  if (details.primaryVelocity!.compareTo(0) == -1) {
                    Navigator.pushNamed(context, Screen4.routeName);
                  } else {
                    Navigator.pushNamed(context, Screen2.routeName);
                  }
                },
                child: Column(
                  children: [
                    const SkipeWidget(),
                    Gap(height: size.height * 0.15),
                    Image.asset(
                      'assets/img/object1.png',
                      fit: BoxFit.cover,
                    ),
                    Gap(height: size.height * 0.15),
                    const Text(
                      'Screen 3 Simplifiez\nla planification de vos vacances\navec La Famille Testeuse',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Gap(height: size.height * 0.10),
                    const RowWidget(
                      firstColor: CommonColors.pink,
                      secondColor: CommonColors.yellow,
                      thirdColor: CommonColors.grey,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
    // SizedBox(
    //   child: Image.asset(
    //     'assets/img/Scroll-1.png',
    //     fit: BoxFit.cover,
    //   ),
    // );
  }
}
