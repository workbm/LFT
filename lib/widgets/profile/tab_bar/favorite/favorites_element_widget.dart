// import 'package:flutter/material.dart';
// import 'package:lft_new_project/provider/profile/favorites/favorites_service_profile_provider.dart';
// import 'package:lft_new_project/widgets/global_view/global_view_snippet.dart';
// import 'package:provider/provider.dart';

// class FavoritesElementsWidget extends StatefulWidget {
//   const FavoritesElementsWidget({super.key, required this.mainCategoryName});
//   final String mainCategoryName;

//   @override
//   State<FavoritesElementsWidget> createState() =>
//       _FavoritesElementsWidgetState();
// }

// class _FavoritesElementsWidgetState extends State<FavoritesElementsWidget> {
//   var _isInit = true;
//   final _loading = false;

//   @override
//   void didChangeDependencies() {
//     print('first in favorite element');
//     if (_isInit) {
//       // setState(() {
//       //   _loading = true;
//       // });
//       Future.delayed(Duration.zero).then((value) {
//         context
//             .watch<FavoriteServiceProvider>()
//             .favoriteFct(widget.mainCategoryName)
//             .then((_) {
//           // setState(() {
//           //   _loading = false;
//           // });
//         });
//       });

//       _isInit = false;
//       super.didChangeDependencies();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     var listenData = context.watch<FavoriteServiceProvider>();
//     print('build run FavoriteServiceProvider');
//     return
//         // _loading
//         //     ? const Center(
//         //         child: CircularProgressIndicator(),
//         //       )
//         // :
//         Expanded(
//       child: ListView.builder(
//         itemCount: listenData.list.length,
//         itemBuilder: (context, index) => GlobalViewSnippet(
//           serviceModel: listenData.list[index],
//         ),
//       ),
//     );
//   }
// }
