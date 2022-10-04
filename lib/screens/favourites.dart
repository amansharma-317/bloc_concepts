import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:foodapp/wishlist_bloc/wishlist_bloc.dart';

class Favourites extends StatelessWidget {
  final List<String> favoriteItems;
  const Favourites({Key? key, required this.favoriteItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: ListView.separated(
              itemBuilder: (BuildContext context, int index) => ListTile(
                title: Text(favoriteItems[index]),
              ),
              separatorBuilder: (BuildContext context, int index) => Divider(),
              itemCount: favoriteItems.length,
          ),
        ),
      ),
    );
  }
}
