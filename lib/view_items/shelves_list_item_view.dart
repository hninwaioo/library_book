import 'package:flutter/material.dart';
import 'package:library_app/data/vos/shelf_vo.dart';
import 'package:library_app/resources/strings.dart';
import '../blocs/provider_shelf_bloc.dart';
import '../data/vos/book_vo.dart';
import '../pages/book_shelves_detail_view_page.dart';
import '../persistence/add_data/create_new_shelf.dart';
import '../resources/colors.dart';
import '../widgets/bottom_sheet_for_book_in_library_view.dart';

// class ShelvesListItemView extends StatefulWidget {
//
//   String shelfCheck;
//   bool visibleCheck;
//   ShelfVO? shelfVO;
//   Function (bool) checkedShelf;
//
//   ShelvesListItemView({
//     required this.shelfCheck,
//     required this.visibleCheck,
//     required this.shelfVO,
//     required this.checkedShelf
//   });
//
//   @override
//   State<ShelvesListItemView> createState() => _ShelvesListItemViewState();
// }
//
// class _ShelvesListItemViewState extends State<ShelvesListItemView> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//
//       child: GestureDetector(
//         onTap: (){
//           _navigateToBookShelvesDetailScreen(context);
//         },
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             BottomSheetBookImageView(
//               mBookImage: "https://cdn-icons-png.flaticon.com/512/32/32737.png",
//               bookTitle: widget.shelfVO?.shelfName??"HNIN WAI",
//               authorName: "${widget.shelfVO?.shelfBooks?.length ?? 0} Ebook",
//             ),
//             Spacer(),
//
//             Stack(
//               children: [
//
//                 (widget.shelfCheck == "SHELF")
//                     ?
//                 Visibility(
//                   visible: widget.visibleCheck,
//                     child: Positioned(
//                       child: Icon(
//                         Icons.arrow_forward_ios_outlined,
//                         color: HINT_TEXT_COLOR,
//                       ),
//                     )
//                 )
//                 :
//                 Visibility(
//                   visible: widget.visibleCheck,
//                   child: Positioned(
//                       child:  Checkbox(
//                         tristate: true,
//                         value: widget.shelfVO?.isChecked,
//                         onChanged: (e) {
//                           setState(() {
//                             widget.checkedShelf(e??false);
//                           });
//                         },
//                       ),
//                   ),
//                 )
//               ],
//             )
//
//           ],
//         ),
//       ),
//     );
//   }
//
//   Future<dynamic> _navigateToBookShelvesDetailScreen(BuildContext context) {
//     return Navigator.push(context, MaterialPageRoute(
//         builder: (context) => BookShelvesDetailViewPage()
//     )
//     );
//   }
// }

class ShelvesListItemView extends StatefulWidget {
  List<ShelfVO>? bookShelveList;
  ProviderShelfBloc? bloc;
  BookVO? book;
  Function(ShelfVO?) onTapArrow;
  bool visibleArrow;
  bool visibleCheckBox;
  ShelvesListItemView({
    required this.bookShelveList,
    required this.onTapArrow,
    this.visibleArrow = false,
    this.visibleCheckBox = false,
    this.book,
    this.bloc,
  });
  @override
  State<ShelvesListItemView> createState() =>
      _ShelvesListItemViewState();
}

class _ShelvesListItemViewState
    extends State<ShelvesListItemView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.bookShelveList?.length,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          List<ShelfVO>? shelves = widget.bookShelveList;
          ShelfVO? shelf = shelves?[index];

          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: 140,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    BottomSheetBookImageView(
                      mBookImage: "https://png.pngtre"
                          ""
                          "e.com/png-clipart/20200225/original/pngtree-three-books-standing-vertically-isometric-icon-png-image_5250622.jpg",
                      bookTitle: shelf?.shelfName??"HNIN WAI",
                      authorName: "${shelf?.shelfBooks?.length ?? 0} Ebook",
                    ),
                    Spacer(),
                    Container(
                      margin: EdgeInsets.only(right: 2),
                      child: Stack(children: [
                        Visibility(
                          visible: widget.visibleCheckBox,
                          child: Checkbox(
                            tristate: true,
                            value: shelf?.isChecked,
                            onChanged: (e) {
                              setState(() {
                                shelf?.isChecked = e ?? false;
                                if (shelf?.isChecked == true) {
                                  ShelfVO? shelfIndex() {
                                    shelf?.shelfBooks?.add(widget.book!);
                                    return shelf;
                                  }

                                  CreateNewShelf createNewShelf = CreateNewShelf();
                                  createNewShelf
                                      .saveShelf(shelfIndex()!);
                                  widget.bloc?.saveAllShelves(
                                      createNewShelf.shelfList);
                                }
                              });
                            },
                          ),
                        ),
                        Visibility(
                          visible: widget.visibleArrow,
                          child: GestureDetector(
                            onTap: () {
                              widget.onTapArrow(shelves?[index]);
                            },
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
                // LineSeparatorView(),
              ],
            ),
          );
        });
  }

  Future<dynamic> _navigateToBookShelvesDetailScreen(BuildContext context) {
    return Navigator.push(context, MaterialPageRoute(
        builder: (context) => BookShelvesDetailViewPage()
    )
    );
  }
}

class CheckBoxOrArrowWithBookImageAndNameView extends StatefulWidget {
  List<ShelfVO?>? bookShelveList;
  ProviderShelfBloc? bloc;
  BookVO? book;
  Function(ShelfVO?) onTapArrow;
  bool visibleArrow;
  bool visibleCheckBox;
  CheckBoxOrArrowWithBookImageAndNameView({
    required this.bookShelveList,
    required this.onTapArrow,
    this.visibleArrow = false,
    this.visibleCheckBox = false,
    this.book,
    this.bloc,
  });
  @override
  State<CheckBoxOrArrowWithBookImageAndNameView> createState() =>
      _CheckBoxOrArrowWithBookImageAndNameViewState();
}

class _CheckBoxOrArrowWithBookImageAndNameViewState
    extends State<CheckBoxOrArrowWithBookImageAndNameView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.bookShelveList?.length,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          List<ShelfVO?>? shelves = widget.bookShelveList;
          ShelfVO? shelf = shelves?[index];

          int bookLength = shelf?.shelfBooks?.length ?? 1;
          int i = bookLength - 1;
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height: 120,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        YourShelfOverlapBookView(
                          ///           1         0
                          imageUrl: (bookLength > 1)
                              ? "${shelf?.shelfBooks?[i - 1]?.bookImage}"
                              : PLACE_HOLDER_ONE,
                        ),

                        /// upper layer image
                        Positioned(
                          right: 10,
                          child: YourShelfOverlapBookView(
                            imageUrl: (bookLength > 0)
                                ? "${shelf?.shelfBooks?[i]?.bookImage}"
                                : PLACE_HOLDER_TWO,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          shelf?.shelfName ?? "",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "${shelf?.shelfBooks?.length} books",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
                      margin: EdgeInsets.only(right: 2),
                      child: Stack(children: [
                        Visibility(
                          visible: widget.visibleCheckBox,
                          child: Checkbox(
                            tristate: true,
                            value: shelf?.isChecked,
                            onChanged: (e) {
                              setState(() {
                                shelf?.isChecked = e ?? false;
                                if (shelf?.isChecked == true) {
                                  ShelfVO? shelfIndex() {
                                    shelf?.shelfBooks?.add(widget.book!);
                                    return shelf;
                                  }

                                  var shelfController = CreateNewShelf();
                                  shelfController.saveShelf(shelfIndex()!);
                                  // shelfController
                                  //     .catchAndSaveShelf(shelfIndex());
                                  widget.bloc?.saveAllShelves(
                                      shelfController.shelfList);
                                }
                              });
                            },
                          ),
                        ),
                        Visibility(
                          visible: widget.visibleArrow,
                          child: GestureDetector(
                            onTap: () {
                              widget.onTapArrow(shelves?[index]);
                            },
                            child: Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
                // LineSeparatorView(),
              ],
            ),
          );
        });
  }
}

class YourShelfOverlapBookView extends StatelessWidget {
  String imageUrl;
  YourShelfOverlapBookView({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 90,
      child: ClipRRect(
        child: Image.network(
          imageUrl,
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(8),
          bottomLeft: Radius.circular(8),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
    );
  }
}
