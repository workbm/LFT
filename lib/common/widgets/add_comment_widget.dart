import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lft_new_project/common/widgets/horizontal_gap.dart';

import '../utils/colors.dart';

class AddCommentWidget extends StatelessWidget {
  const AddCommentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54.h,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
          ),
          ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0),
              ),
              child: Center(
                child: Row(
                  children: [
                    const HorizontalGap(width: 10),
                    Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                CommonColors.darkOrange,
                                CommonColors.yellow2,
                              ])),
                      child: Container(
                        margin: const EdgeInsets.all(1.5),
                        decoration: const BoxDecoration(
                          color: CommonColors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Container(
                          height: 35.h,
                          width: 35.w,
                          margin: const EdgeInsets.all(2.5),
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.transparent, width: 5),
                            shape: BoxShape.circle,
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: CachedNetworkImageProvider(
                                'https://cdn.wallpapersafari.com/22/91/bU2uNi.jpg',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const HorizontalGap(width: 10),
                    Expanded(
                      child: Container(
                        height: 37.h,
                        decoration: BoxDecoration(
                            border: Border.all(color: CommonColors.grey),
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          children: const [
                            HorizontalGap(width: 10),
                            Text(
                              'Ajouter un commentaire',
                              style: TextStyle(color: CommonColors.darkGrey),
                            ),
                            Spacer(),
                            Icon(
                              Icons.send,
                              color: CommonColors.blue,
                            ),
                            HorizontalGap(width: 10),
                          ],
                        ),
                      ),
                    ),
                    const HorizontalGap(width: 10),
                  ],
                ),
              )
              // BottomNavigationBar(
              //   selectedFontSize: 0, unselectedFontSize: 0,
              //   iconSize: 30.w,
              //   items: <BottomNavigationBarItem>[
              //     BottomNavigationBarItem(
              //       icon: GestureDetector(
              //         onTap: () {
              //           Navigator.pushNamed(context, HomePage.routeName);
              //         },
              //         child: const Icon(
              //           Icons.home,
              //           color: CommonColors.yellow,
              //         ),
              //       ),
              //       label: '',
              //     ),
              //     const BottomNavigationBarItem(
              //       icon: Icon(
              //         Icons.favorite_border,
              //         color: CommonColors.pink,
              //       ),
              //       label: '',
              //     ),
              //     BottomNavigationBarItem(
              //       icon: GestureDetector(
              //         onTap: () {
              //           Navigator.pushNamed(context, ProfileScreen.routeName);
              //         },
              //         child: Icon(
              //           Icons.person_outlined,
              //           color: CommonColors.darkGreen,
              //         ),
              //       ),
              //       label: '',
              //     ),
              //     BottomNavigationBarItem(
              //       icon: Image.asset(
              //         Assets.img.agenda.path,
              //         color: CommonColors.black,
              //       ),
              //       label: '',
              //     ),
              //   ],
              //   // currentIndex: _selectedIndex,
              //   selectedItemColor: Colors.amber[800],
              //   // onTap: _onItemTapped,
              // ),

              ),
        ],
      ),
    );
  }
}
