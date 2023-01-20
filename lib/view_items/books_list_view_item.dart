import 'package:flutter/material.dart';
import 'package:library_app/resources/colors.dart';
import 'package:library_app/widgets/typical_text.dart';

import '../data/vos/book_vo.dart';
import '../resources/dimens.dart';
import '../widgets/bottom_sheet_for_book_in_library_view.dart';
import 'banner_book_image_item_view.dart';

class BooksListViewItem extends StatelessWidget {

  BookVO dataBook;
  final Function(BookVO bookVO) onTapBook;
  BooksListViewItem({required this.dataBook, required this.onTapBook});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTapBook(dataBook);
      },
      child: Container(
        width: 210,
        margin: EdgeInsets.only(left: MARGIN_MEDIUM_2),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Positioned(
                    child: Container(
                        height: 190,
                        width: 150,
                        child: BannerBookImageItemView(
                          mImageUrl: dataBook.bookImage,
                          // 'https://m.media-amazon.com/images/I/51EkeX9IfCL._SX323_BO1,204,203,200_.jpg',
                        )
                    ),
                ),
                Positioned(
                  top: 0.0,
                    right: 0.0,
                    child: GestureDetector(
                      onTap: (){
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                  child: BottomSheetForBookInLibraryView(
                                    bookVO: dataBook,
                                    onTapBookAddToShelf: (dataBook){

                                    },
                                  )
                              );
                            }
                        );
                      },
                        child: Icon(Icons.keyboard_control_rounded,color: Colors.white,size: 40,)
                    ),
                ),

                // Positioned(
                //     // alignment: Alignment.bottomLeft,
                //     bottom: 0.0,
                //     left: 0.0,
                //     child: Visibility(
                //       // visible: audioBook,
                //       child: Container(
                //         margin: EdgeInsets.all(MARGIN_MEDIUM),
                //         padding: EdgeInsets.fromLTRB(MARGIN_CARD_MEDIUM_2, MARGIN_MEDIUM, MARGIN_CARD_MEDIUM_2, MARGIN_MEDIUM),
                //         decoration: BoxDecoration(
                //             color: Colors.black54,
                //             borderRadius: BorderRadius.circular(10.0)
                //         ),
                //         child: Icon(Icons.headphones_sharp,color: Colors.white),
                //       ),
                //     )
                // )
              ],
            ),
            SizedBox(height: MARGIN_SMALL,),
            TypicalText(dataBook.title??"", HINT_TEXT_COLOR, 16),
            SizedBox(height: MARGIN_SMALL,),
            TypicalText(dataBook.author??"", HINT_TEXT_COLOR, TEXT_REGULAR),
          ],
        ),
      ),
    );
  }
}