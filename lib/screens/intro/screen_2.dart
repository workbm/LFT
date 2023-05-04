import 'package:flutter/material.dart';
import 'package:lft_new_project/common/utils/colors.dart';
import 'package:lft_new_project/common/widgets/gap.dart';
import 'package:lft_new_project/common/widgets/padding.dart';
import 'package:lft_new_project/screens/intro/screen_1.dart';
import 'package:lft_new_project/screens/intro/screen_3.dart';
import 'package:lft_new_project/widgets/intro/row_widget.dart';
import 'package:lft_new_project/widgets/intro/skipe_widget.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});
  static const routeName = '/screen-2';

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
                    Navigator.pushNamed(context, Screen3.routeName);
                  } else {
                    Navigator.pushNamed(context, Screen1.routeName);
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
                      'Simplifiez\nla planification de vos vacances\navec La Famille Testeuse',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Gap(height: size.height * 0.10),
                    const RowWidget(
                      firstColor: CommonColors.pink,
                      secondColor: CommonColors.grey,
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
