import 'package:flutter/material.dart';

class BannerBookImageItemView extends StatelessWidget {

  String? mImageUrl;
  BannerBookImageItemView({required this.mImageUrl});

  @override
  Widget build(BuildContext context) {
    return
      ClipRRect(
          borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10),bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
          child:  Image.network(
            // "https://d1sag4ddilekf6.azureedge.net/compressed/merchants/9-CY32EB2ETB43WA/hero/1f901883836148bf8a9150277b6e7967_1658064288904088500.jpeg",
            mImageUrl??"",
            fit:BoxFit.cover,
          )
      );
  }
}
