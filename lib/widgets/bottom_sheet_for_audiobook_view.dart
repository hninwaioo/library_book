import 'package:flutter/material.dart';
import 'package:library_app/resources/dimens.dart';
import 'package:library_app/widgets/typical_text.dart';

import '../resources/colors.dart';
import 'bottom_sheet_for_book_in_library_view.dart';

class BottomSheetForAudioBookView extends StatelessWidget {
  String mBookImage;
  String bookTitle;
  String authorName;

  BottomSheetForAudioBookView({
    required this.mBookImage,
    required this.bookTitle,
    required this.authorName
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_LARGE, vertical: MARGIN_MEDIUM_LARGE),

            child: BottomSheetBookImageView(
              mBookImage: mBookImage,
              // "https://m.media-amazon.com/images/I/51EkeX9IfCL._SX323_BO1,204,203,200_.jpg",
              bookTitle: bookTitle,
              authorName: authorName,
            ),
          ),
          Divider(color: Colors.grey,),
          BottomSheetAudiobookItemsView()
        ],
      ),
    );
  }
}

class BottomSheetAudiobookItemsView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_LARGE, vertical: MARGIN_MEDIUM_LARGE),

        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.my_library_add_outlined),
                SizedBox(width: MARGIN_MEDIUM,),
                TypicalText("Free Sample", HINT_TEXT_COLOR, 16)
              ],
            ),

            SizedBox(height: MARGIN_MEDIUM,),
            Row(
              children: [
                Icon(Icons.bookmark_add_sharp),
                SizedBox(width: MARGIN_MEDIUM,),
                TypicalText("Add to wishList", HINT_TEXT_COLOR, 16)
              ],
            ),
            SizedBox(height: MARGIN_MEDIUM,),

            Row(
              children: [
                Icon(Icons.book_outlined),
                SizedBox(width: MARGIN_MEDIUM,),
                TypicalText("About this book", HINT_TEXT_COLOR, 16)
              ],
            ),
          ],
        )
    );
  }
}
