import 'package:flutter/material.dart';
import 'package:library_app/resources/colors.dart';
import 'package:library_app/resources/dimens.dart';
import 'package:library_app/widgets/typical_text.dart';
import '../view_items/banner_book_image_item_view.dart';

class BottomSheetBookImageView extends StatelessWidget {

  String mBookImage;
  String bookTitle;
  String authorName;

  BottomSheetBookImageView({
    required this.mBookImage,
    required this.bookTitle,
    required this.authorName
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 135,
            width: 100,
            child: BannerBookImageItemView(
              mImageUrl: mBookImage,
              // mImageUrl: 'https://m.media-amazon.com/images/I/51EkeX9IfCL._SX323_BO1,204,203,200_.jpg',
            ),
          ),
          SizedBox(width: MARGIN_MEDIUM,),
          Container(
            width: 140,
            margin: EdgeInsets.only(top: MARGIN_MEDIUM,left: MARGIN_MEDIUM),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TypicalText(bookTitle, Colors.black, 16,isFontWeight: true,),
                SizedBox(height: MARGIN_SMALL,),
                TypicalText(authorName, HINT_TEXT_COLOR, 14,isFontWeight: true,)
              ],
            ),
          )
        ],
      ),
    );
  }
}



