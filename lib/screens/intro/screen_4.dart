import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lft_new_project/screens/auth/login.dart';
import 'package:lft_new_project/screens/intro/screen_3.dart';

import '../../common/utils/colors.dart';
import '../../common/widgets/gap.dart';
import '../../common/widgets/padding.dart';
import '../../gen/assets.gen.dart';
import '../../widgets/intro/row_widget.dart';
import '../../widgets/intro/skipe_widget.dart';

class Screen4 extends StatelessWidget {
  const Screen4({super.key});
  static const routeName = '/screen-4';

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
                    Navigator.pushNamed(context, Login.routeName);
                  } else {
                    Navigator.pushNamed(context, Screen3.routeName);
                  }
                },
                child: Column(
                  children: [
                    const SkipeWidget(),
                    Gap(height: size.height * 0.15),
                    Image.asset(
                      Assets.img.image3.path,
                      height: 250.h,
                      // 'assets/img/object1.png',
                      fit: BoxFit.cover,
                    ),
                    const Gap(height: 30),
                    SizedBox(
                      height: 60.h,
                      child: Image.asset(
                        Assets.img.layer3.path,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Gap(height: 30),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 16,
                              color: CommonColors.blueCloudBurst,
                            ),
                        children: const [
                          TextSpan(text: 'Des '),
                          TextSpan(
                            text: 'plans ',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          TextSpan(text: 'exclusifs avec\n'),
                          TextSpan(text: 'nos réductions incomparables'),
                        ],
                      ),
                    ),
                    const Gap(height: 50),
                    const RowWidget(
                      firstColor: CommonColors.pink,
                      secondColor: CommonColors.yellow,
                      thirdColor: CommonColors.darkGreen,
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
