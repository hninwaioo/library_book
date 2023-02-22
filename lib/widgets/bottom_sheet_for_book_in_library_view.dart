import 'package:flutter/material.dart';
import 'package:library_app/resources/colors.dart';
import 'package:library_app/resources/dimens.dart';
import 'package:library_app/widgets/typical_text.dart';
import '../data/vos/book_vo.dart';
import '../view_items/banner_book_image_item_view.dart';

class BottomSheetForBookInLibraryView extends StatelessWidget {
  // BookVO? bookVO;
  // Function(BookVO) onTapBookAddToShelf;
  // BottomSheetForBookInLibraryView({required this.bookVO, required this.onTapBookAddToShelf});

  bool visibleRemoveDownload;
  bool visibleDownload;
  bool visibleDeleteFromLibrary;
  bool visibleAddToShelves;
  bool visibleMarkAsRead;
  bool visibleFreeSample;
  bool visibleAddToWishlist;
  bool visibleAboutThisBook;

  BookVO? book;
  Function(BookVO?) onPressedIcon;
  Function()? addToShelf;

  BottomSheetForBookInLibraryView({
    this.addToShelf,
    required this.book,
    required this.onPressedIcon,
    this.visibleAboutThisBook = false,
    this.visibleAddToShelves = false,
    this.visibleAddToWishlist = false,
    this.visibleDeleteFromLibrary = false,
    this.visibleDownload = false,
    this.visibleFreeSample = false,
    this.visibleMarkAsRead = false,
    this.visibleRemoveDownload = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2,vertical: MARGIN_MEDIUM_2),
      child: Column(
        children: [
          BottomSheetBookImageView(
            mBookImage: book?.bookImage??"",
            // "https://m.media-amazon.com/images/I/51EkeX9IfCL._SX323_BO1,204,203,200_.jpg",
            bookTitle: book?.title??"",
            authorName: book?.author??"",
          ),

          BottomSheetEbookItemsView(
            bookVO: book,
            onTapBookAddToShelf: addToShelf!()
          )
        ],
      )
    );
  }
}

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

class BottomSheetEbookItemsView extends StatelessWidget {
  BookVO? bookVO;
  Function(BookVO) onTapBookAddToShelf;
  BottomSheetEbookItemsView({required this.bookVO, required this.onTapBookAddToShelf});

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Column(
        children: [
          SizedBox(height: MARGIN_MEDIUM_2,),
          Divider(color: HINT_TEXT_COLOR,height: 0.1,),
          SizedBox(height: MARGIN_MEDIUM_2,),
          Row(
            children: [
              Icon(Icons.file_download_outlined,color: HINT_TEXT_COLOR,),
              SizedBox(width: MARGIN_MEDIUM,),
              TypicalText("Download", Colors.black, 16)
            ],
          ),

          SizedBox(height: MARGIN_MEDIUM_2,),

          Row(
            children: [
              Icon(Icons.delete_forever_outlined,color: HINT_TEXT_COLOR,),
              SizedBox(width: MARGIN_MEDIUM,),
              TypicalText("Delete from your library", Colors.black, 16)
            ],
          ),
          SizedBox(height: MARGIN_MEDIUM_2,),

          GestureDetector(
            onTap: (){
              onTapBookAddToShelf(bookVO!);
            },
            child: Row(
              children: [
                Icon(Icons.add_sharp,color: HINT_TEXT_COLOR,),
                SizedBox(width: MARGIN_MEDIUM,),
                TypicalText("Add to shelves", Colors.black, 16)
              ],
            ),
          ),
          SizedBox(height: MARGIN_MEDIUM_2,),

          Row(
            children: [
              Icon(Icons.check,color: HINT_TEXT_COLOR,),
              SizedBox(width: MARGIN_MEDIUM,),
              TypicalText("Mark as Read", Colors.black, 16)
            ],
          ),
        ],
      )
    );
  }
}


