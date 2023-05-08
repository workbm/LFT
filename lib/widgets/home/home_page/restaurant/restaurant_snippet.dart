import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lft_new_project/provider/home/top_restaurant_provider.dart';
import 'package:provider/provider.dart';

class RestaurantSnippet extends StatefulWidget {
  const RestaurantSnippet({super.key});

  @override
  State<RestaurantSnippet> createState() => _RestaurantSnippetState();
}

class _RestaurantSnippetState extends State<RestaurantSnippet> {
  var _isLoading = false;
  @override
  void initState() {
    setState(() {
      _isLoading = true;
    });
    context.read<TopRestaurantProvider>().getRestaurants().then((_) {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var listenData = context.watch<TopRestaurantProvider>();
    return SizedBox(
      height: 420,
      width: double.infinity,
      child: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: listenData.restaurants.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Container(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: listenData.restaurants
                        .map(
                          (e) => SizedBox(
                            width: 50,
                            height: 50,
                            child: CachedNetworkImage(
                              imageUrl:
                                  'https://image.cnbcfm.com/api/v1/image/107236863-1683379954526-27uIf9mw.jpg?v=1683559680&w=630&h=354&ffmt=webp&vtcrop=y',
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
            ),
    );
  }
}
