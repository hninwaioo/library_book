import 'package:flutter/material.dart';
import '../resources/dimens.dart';

class BookImageItemView extends StatelessWidget {
  final String movies_image;
  BookImageItemView(this.movies_image);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.only(topLeft:Radius.circular(8.0) ,topRight: Radius.circular(8.0)),
        child:
        Image.network(
          movies_image,
          height: BEST_ACTOR_HEIGHT,
          fit:BoxFit.fill,
          width: MOVIE_LIST_ITEM_WIDTH,

        )
    );
  }
}