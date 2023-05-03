import 'package:flutter/material.dart';
import 'package:lft_new_project/common/utils/colors.dart';
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SkipeWidget(),
                Image.asset(
                  'assets/img/object1.png',
                  fit: BoxFit.cover,
                ),
              ],
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
