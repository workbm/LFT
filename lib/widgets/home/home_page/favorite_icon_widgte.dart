import 'package:flutter/material.dart';
import 'package:lft_new_project/common/utils/colors.dart';
import 'package:lft_new_project/common/utils/utils.dart';
import 'package:lft_new_project/provider/profile/favorites/add_service_to_favory_provider.dart';
import 'package:provider/provider.dart';

class FavoriteIconHomeWidget extends StatefulWidget {
  const FavoriteIconHomeWidget(
      {super.key,
      required this.serviceModel,
      required this.elementID,
      required this.isFavorite});
  final String serviceModel;
  final int elementID;
  final bool isFavorite;
  @override
  State<FavoriteIconHomeWidget> createState() => _FavoriteIconHomeWidgetState();
}

class _FavoriteIconHomeWidgetState extends State<FavoriteIconHomeWidget> {
  var _loading = false;
  late bool _isFavorite;
  @override
  void initState() {
    _isFavorite = widget.isFavorite;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _addToFavorite();
      },
      child: _loading
          ? const SizedBox(
              height: 15,
              width: 15,
              child: Center(
                child: CircularProgressIndicator(
                  strokeWidth: 1,
                ),
              ),
            )
          : _isFavorite
              ? const Icon(
                  Icons.bookmark,
                  color: CommonColors.redMediumLight,
                )
              : const Icon(
                  Icons.bookmark_outline,
                ),
    );
  }

  Future<void> _addToFavorite() async {
    setState(() {
      _loading = true;
    });
    try {
      await context
          .read<AddServiceElementToFavoryProvider>()
          .addElementFct(widget.elementID, widget.serviceModel);
      setState(() {
        _loading = false;
        _isFavorite = !_isFavorite;
      });
    } catch (error) {
      showSnackBar(context: context, content: 'Une erreur se produit');
      setState(() {
        _loading = false;
      });
    }
  }
}
