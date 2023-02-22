// import 'package:flutter/material.dart';
// import 'package:library_app/widgets/typical_text.dart';
//
// import '../data/vos/book_vo.dart';
// import '../pages/book_add_into_shelf_view_page.dart';
// import '../pages/books_type_list_detail_view_page.dart';
// import '../pages/library_view_page.dart';
// import '../resources/colors.dart';
// import '../resources/dimens.dart';
// import '../view_items/books_list_view_item.dart';
// import 'bottom_sheet_for_book_in_library_view.dart';
// import 'bottom_sheet_for_filter_view.dart';
// import 'bottom_sheet_for_view_as_view.dart';
//
// class SortBooksListView extends StatefulWidget {
//
//   List<String?>? tabList;
//   String? chosenTab;
//   bool? crossButtonVisible = false;
//   bool? chosenTabVisible = false;
//   bool isSelected = false;
//   Function(String? tab) onTabBookTypeChooser;
//   Function onTapCrossButton;
//   int? groupValueForView = 1;
//   Function(BookVO?) addToShelf;
//   List<BookVO>? bookList;
//   String? filterForView = "REC_OPEN";
//   String? viewType = "LIST";
//
//   Function(int?) onSelectedFilterByRecent;
//   Function(int?) onSelectedFilterByBookTitle;
//   Function(int?) onSelectedFilterByAuthor;
//
//   Function(String?) onSelectedVerticalListView;
//   Function(String?) onSelectedLargeGridView;
//   Function(String?) onSelectedSmallGridView;
//
//   SortBooksListView({
//     required this.onTapCrossButton,
//     required this.onTabBookTypeChooser,
//     required this.tabList,
//     required this.crossButtonVisible,
//     required this.chosenTab,
//     required this.isSelected,
//     required this.chosenTabVisible,
//     required this.groupValueForView,
//     required this.addToShelf,
//
//     required this.bookList,
//     required this.filterForView,
//
//     required this.onSelectedFilterByRecent,
//     required this.onSelectedFilterByBookTitle,
//     required this.onSelectedFilterByAuthor,
//
//     required this.onSelectedVerticalListView,
//     required this.onSelectedLargeGridView,
//     required this.onSelectedSmallGridView
//   });
//
//   @override
//   State<SortBooksListView> createState() => _SortBooksListViewState();
// }
//
// class _SortBooksListViewState extends State<SortBooksListView> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//
//             MultiSelectTabBarViewSection(
//               chosenTabVisible: widget.chosenTabVisible,
//               crossButtonVisible: widget.crossButtonVisible,
//               chosenTab: widget.chosenTab,
//               tabList: widget.tabList ?? [],
//               onTab: (tab) {
//                 widget.onTabBookTypeChooser(tab);
//               },
//               onTapCrossButton: () {
//                 widget.onTapCrossButton();
//               },
//             ),
//
//             SortByRecentBookSectionView(
//               /// Selected Filter
//               // onSelectedFilterByRecent: (filterType){
//               //   setState(() {
//               //     widget.filterForView = filterType;
//               //     debugPrint("RecentOpened=>REC");
//               //
//               //   });
//               // },
//               //
//               // onSelectedFilterByBookTitle: (filterType){
//               //   setState(() {
//               //     widget.filterForView = filterType;
//               //     debugPrint("TITLE=>title");
//               //
//               //   });
//               // },
//               //
//               // onSelectedFilterByAuthor: (filterType){
//               //   setState(() {
//               //     widget.filterForView = filterType;
//               //     debugPrint("Author=>Author");
//               //   });
//               // },
//
//               onSelectedFilterByRecent: (e) {
//                 widget.onSelectedFilterByRecent(e);
//               },
//               onSelectedFilterByBookTitle: (e) {
//                 widget.onSelectedFilterByBookTitle(e);
//               },
//               onSelectedFilterByAuthor: (e) {
//                 widget.onSelectedFilterByAuthor(e);
//               },
//
//               /// Selected View
//               onSelectedVerticalListView: (viewType) {
//                 setState((){
//                   widget.viewType = viewType;
//                 });
//               },
//               onSelectedLargeGridView: (viewType) {
//                 setState(() {
//                   widget.viewType = viewType;
//                 });
//               },
//               onSelectedSmallGridView: (viewType) {
//                 setState(() {
//                   widget.viewType = viewType;
//                 });
//               },
//
//             ),
//             SizedBox(height: MARGIN_MEDIUM_2,),
//
//             // (widget.viewType == "LIST")
//             //     ?
//             // Container(
//             //   child: ListView(
//             //     physics: NeverScrollableScrollPhysics(), // <– this will disable scroll.
//             //     shrinkWrap: true,
//             //     children: [
//             //       ChooseVerticalListBookSectionView(bookList: widget.bookList,)
//             //     ],
//             //   ),
//             // )                :
//             // (widget.viewType == "LARGE_GRID")
//             //     ?
//             // ChooseLargeAndSmallListBookView(
//             //   bookList: widget.bookList,
//             //   gridCount: 2,
//             // )
//             //     :
//             // ChooseLargeAndSmallListBookView(
//             //   bookList: widget.bookList,
//             //   gridCount: 3,
//             // ),
//
//             /// 3
//             (widget.groupValueForView == 1)
//                 ?
//             // BooksVerticalListView(
//             //   onTapBook: (book) {},
//             //   onPressIcon: (book) {
//             //     showModalBottomSheet(
//             //         useRootNavigator: true,
//             //         isScrollControlled: false,
//             //         isDismissible: true,
//             //         enableDrag: true,
//             //         context: context,
//             //         clipBehavior: Clip.antiAliasWithSaveLayer,
//             //         builder: (context) => BottomSheetForBookInLibraryView(
//             //             // addToShelf: () {
//             //             //   addToShelf(book);
//             //             // },
//             //             // visibleRemoveDownload: true,
//             //             // visibleAboutThisBook: true,
//             //             // visibleAddToShelves: true,
//             //             // visibleAddToWishlist: true,
//             //             // visibleDeleteFromLibrary: true,
//             //             // book: book,
//             //             // onPressedIcon: (book) {},
//             //           bookVO: book,
//             //           onTapBookAddToShelf: (BookVO ) {
//             //           widget.addToShelf(book);
//             //         },
//             //         ));
//             //   },
//             //   visibleDownloadAndSeeMore: true,
//             //   bookList: widget.bookList,
//             // )
//             Container(
//               child: ListView(
//                 physics: NeverScrollableScrollPhysics(), // <– this will disable scroll.
//                 shrinkWrap: true,
//                 children: [
//                   ChooseVerticalListBookSectionView(bookList: widget.bookList,)
//                 ],
//               ),
//             )
//                 :
//             (widget.groupValueForView == 2)
//                 ?
//             BookListGridView(
//               onTapSeeMore: (book) {
//                 showModalBottomSheet(
//                     useRootNavigator: true,
//                     isScrollControlled: false,
//                     isDismissible: true,
//                     enableDrag: true,
//                     context: context,
//                     builder: (context) => BottomSheetForBookInLibraryView(
//                         // addToShelf: () {
//                         //   addToShelf(book);
//                         // },
//                         // visibleRemoveDownload: true,
//                         // visibleAboutThisBook: true,
//                         // visibleAddToShelves: true,
//                         // visibleAddToWishlist: true,
//                         // visibleDeleteFromLibrary: true,
//                         // onPressedIcon: (book) {},
//                         // book: book
//                       bookVO: book,
//                       onTapBookAddToShelf: (BookVO ) {
//                         widget.addToShelf(book);
//                       },
//                     ));
//               },
//               bookList: widget.bookList,
//               onTapBook: (book) {},
//               isThreeGrid: false,
//             )
//                 :
//             BookListGridView(
//               onTapSeeMore: (book) {
//                 showModalBottomSheet(
//                     useRootNavigator: true,
//                     isScrollControlled: false,
//                     isDismissible: true,
//                     enableDrag: true,
//                     context: context,
//                     builder: (context) => BottomSheetForBookInLibraryView(
//                         // addToShelf: () {
//                         //   addToShelf(book);
//                         // },
//                         // visibleRemoveDownload: true,
//                         // visibleAboutThisBook: true,
//                         // visibleAddToShelves: true,
//                         // visibleAddToWishlist: true,
//                         // visibleDeleteFromLibrary: true,
//                         // onPressedIcon: (book) {},
//                         // book: book
//                       bookVO: book,
//                       onTapBookAddToShelf: (BookVO ) {
//                         widget.addToShelf(book);
//                       },
//                     ));
//               },
//               bookList: widget.bookList,
//               onTapBook: (book) {},
//               isThreeGrid: true,
//             ),
//
//             SizedBox(height: MARGIN_MEDIUM_2,),
//           ],
//
//     );
//   }
// }
//
// class SortByRecentBookSectionView extends StatefulWidget {
//
//   /// Filter Type
//   String? filterType;
//
//   int? selectedByRecent;
//   int? selectedByBookTitle;
//   int? selectedByAuthor;
//   Function(int?) onSelectedFilterByRecent;
//   Function(int?) onSelectedFilterByBookTitle;
//   Function(int?) onSelectedFilterByAuthor;
//
//   /// View Type
//   String? viewType;
//
//   String? selectedList;
//   String? selectedLargeGrid;
//   String? selectedSmallGrid;
//
//   Function(String?) onSelectedVerticalListView;
//   Function(String?) onSelectedLargeGridView;
//   Function(String?) onSelectedSmallGridView;
//
//   SortByRecentBookSectionView({
//     required this.onSelectedFilterByRecent,
//     required this.onSelectedFilterByBookTitle,
//     required this.onSelectedFilterByAuthor,
//
//     required this.onSelectedVerticalListView,
//     required this.onSelectedLargeGridView,
//     required this.onSelectedSmallGridView
//   });
//
//   @override
//   State<SortByRecentBookSectionView> createState() => _SortByRecentBookSectionViewState();
// }
//
// class _SortByRecentBookSectionViewState extends State<SortByRecentBookSectionView> {
//   int? groupValue = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
//       child: Row(
//         children: [
//           // GestureDetector(
//           //   onTap: (){
//           //     showModalBottomSheet(
//           //         context: context,
//           //         builder: (BuildContext context) {
//           //           return Container(
//           //               height: 300,
//           //               child:
//           //               // BottomSheetForFilterView(
//           //               //   selectedByRecent: widget.selectedByRecent,
//           //               //   selectedByBookTitle: widget.selectedByBookTitle,
//           //               //   selectedByAuthor: widget.selectedByAuthor,
//           //               //   filterType: widget.filterType,
//           //               //   onSelectedFilterByRecent: (selectedFilter) {
//           //               //     setState(() {
//           //               //       widget.filterType = selectedFilter;
//           //               //       widget.onSelectedFilterByRecent(widget.filterType);
//           //               //       debugPrint("ONE=>${selectedFilter}");
//           //               //     });
//           //               //   },
//           //               //   onSelectedFilterByBookTitle: (selectedFilter) {
//           //               //     setState(() {
//           //               //       widget.filterType = selectedFilter;
//           //               //       widget.onSelectedFilterByBookTitle(widget.filterType);
//           //               //       debugPrint("TWO=>${selectedFilter}");
//           //               //     });
//           //               //   },
//           //               //   onSelectedFilterByAuthor: (selectedFilter) {
//           //               //     setState(() {
//           //               //       widget.filterType = selectedFilter;
//           //               //       widget.onSelectedFilterByAuthor(widget.filterType);
//           //               //       debugPrint("THREE=>${selectedFilter}");
//           //               //     });
//           //               //   },
//           //               // )
//           //
//           //               BottomSheetForFilterView(
//           //                 valueOne: widget.valueOne,
//           //                 valueTwo: widget.valueTwo,
//           //                 valueThree: widget.valueThree,
//           //                 groupValue: widget.groupValue,
//           //                 textOne: widget.textOne,
//           //                 textTwo: widget.textTwo,
//           //                 textThree: widget.textThree,
//           //                 onTapViewOne: (clickValue) {
//           //                   setState(() {
//           //                     widget.groupValue = clickValue;
//           //                     widget.onTapViewOne(widget.groupValue);
//           //                   });
//           //                 },
//           //                 onTapViewTwo: (clickValue) {
//           //                   setState(() {
//           //                     widget.groupValue = clickValue;
//           //                     widget.onTapViewTwo(widget.groupValue);
//           //                   });
//           //                 },
//           //                 onTapViewThree: (clickValue) {
//           //                   setState(() {
//           //                     widget.groupValue = clickValue;
//           //                     widget.onTapViewThree(widget.groupValue);
//           //                   });
//           //                 },
//           //               ),
//           //
//           //           );
//           //         }
//           //     );
//           //   },
//           //   child: Row(
//           //     children: [
//           //       Icon(Icons.sort_sharp),
//           //       SizedBox(width: MARGIN_SMALL,),
//           //       TypicalText("Sort By: Recent", HINT_TEXT_COLOR, TEXT_REGULAR)
//           //     ],
//           //   ),
//           // ),
//
//           GestureDetector(
//             onTap: () {
//               showModalBottomSheet(
//                 context: context,
//                 builder: (context) => BottomSheetForFilterView(
//                   // textOne: widget.sortTextOne,
//                   // textTwo: widget.sortTextTwo,
//                   // textThree: widget.sortTextThree,
//                   // heading: widget.sortHeading,
//
//                   /// e is already groupValue
//                   onSelectedFilterByRecent: (e) {
//                     setState(() {
//                       widget.onSelectedFilterByRecent(e);
//                       groupValue = e;
//                     });
//                   },
//                   onSelectedFilterByBookTitle: (e) {
//                     setState(() {
//                       widget.onSelectedFilterByBookTitle(e);
//                       groupValue = e;
//                     });
//                   },
//                   onSelectedFilterByAuthor: (e) {
//                     setState(() {
//                       widget.onSelectedFilterByAuthor(e);
//                       groupValue = e;
//                     });
//                   },
//                   valueRecent: 1, valueBookTitle: 2, valueAuthor: 3,
//                 ),
//               );
//             },
//             child: Row(
//               children: [
//                 Icon(
//                   Icons.sort_outlined,
//                   size: 24,
//                 ),
//                 SizedBox(width: 2),
//                 Text(
//                   "Sort by: ",
//                   style: TextStyle(
//                     color: Colors.black54,
//                     fontWeight: FontWeight.w500,
//                     fontSize: 13,
//                   ),
//                 ),
//                 Text(
//                   (groupValue == 1)
//                       ? "Recently opened"
//                       : (groupValue == 2)
//                       ? "Title"
//                       : (groupValue == 3)
//                       ? "Author"
//                       : "",
//                   style: TextStyle(
//                     color: Colors.black54,
//                     fontWeight: FontWeight.w500,
//                     fontSize: 13,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//
//           Spacer(),
//           GestureDetector(
//               onTap: (){
//                 showModalBottomSheet(
//                     context: context,
//                     builder: (BuildContext context) {
//                       return Container(
//                           height: 300,
//                           child: BottomSheetForViewAsView(
//                             selectedList: widget.selectedList,
//                             selectedLargeGrid: widget.selectedLargeGrid,
//                             selectedSmallGrid: widget.selectedSmallGrid,
//                             viewType: widget.viewType,
//                             onSelectedVerticalListView: (clickValue) {
//                               setState(() {
//                                 widget.viewType = clickValue;
//                                 widget.onSelectedVerticalListView(widget.viewType);
//                               });
//                             },
//                             onSelectedLargeGridView: (clickValue) {
//                               setState(() {
//                                 widget.viewType = clickValue;
//                                 widget.onSelectedLargeGridView(widget.viewType);
//                               });
//                             },
//                             onSelectedSmallGridView: (clickValue) {
//                               setState(() {
//                                 widget.viewType = clickValue;
//                                 widget.onSelectedSmallGridView(widget.viewType);
//                               });
//                             },
//                           )
//                       );
//                     }
//                 );
//               },
//               child: Icon(Icons.grid_view)
//           )
//         ],
//       ),
//     );
//   }
// }
//
// class ChooseVerticalListBookSectionView extends StatelessWidget {
//   List<BookVO>? bookList;
//   ChooseVerticalListBookSectionView({required this.bookList});
//
//   @override
//   Widget build(BuildContext context) {
//     return
//       Container(
//           margin: EdgeInsets.only(right: MARGIN_MEDIUM_2),
//           child:
//           ListView.builder(
//               physics: ScrollPhysics(),
//               shrinkWrap: true,
//               scrollDirection: Axis.vertical,
//               padding: EdgeInsets.only(left: MARGIN_MEDIUM_2),
//               itemCount: bookList?.length,
//               // movieList.length,
//               itemBuilder:(BuildContext context, int index){
//                 return Column(
//                   children: [
//                     VerticalListBookView(
//                       bookVO: bookList![index],
//                       onTapBookAddToShelf: (book){
//                         _navigateToAddShelfScreen(context,book);
//                       },
//                     ),
//                     SizedBox(height: MARGIN_MEDIUM_2,)
//                   ],
//                 );
//                 // VerticalListBookView();
//               }
//           )
//       );
//   }
//   // BookAddIntoShelfViewPage
//   Future<dynamic> _navigateToAddShelfScreen(BuildContext context,BookVO bookVO) {
//     return Navigator.push(context, MaterialPageRoute(
//         builder: (context) => BookAddIntoShelfViewPage(
//           book: bookVO
//         )
//     )
//     );
//   }
// }
//
// class VerticalListBookView extends StatelessWidget {
//   BookVO bookVO;
//   Function(BookVO) onTapBookAddToShelf;
//   VerticalListBookView({required this.bookVO, required this.onTapBookAddToShelf});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           BottomSheetBookImageView(
//             mBookImage: bookVO.bookImage??"",
//             // "https://m.media-amazon.com/images/I/51EkeX9IfCL._SX323_BO1,204,203,200_.jpg",
//             bookTitle: bookVO.title??"",
//             authorName: "${bookVO.author??""} . Ebook",
//           ),
//
//           Spacer(),
//
//           Container(
//             margin: EdgeInsets.only(top: MARGIN_MEDIUM_2),
//             child: Row(
//               children: [
//                 Icon(
//                   Icons.file_download_outlined,
//                   color: HINT_TEXT_COLOR,
//                 ),
//                 SizedBox(width: MARGIN_MEDIUM_2,),
//                 GestureDetector(
//                   onTap: (){
//                     showModalBottomSheet(
//                         context: context,
//                         builder: (BuildContext context) {
//                           return Container(
//                               height: 400,
//                               child: BottomSheetForBookInLibraryView(
//                                 bookVO: bookVO,
//                                 onTapBookAddToShelf: onTapBookAddToShelf,
//                               )
//                           );
//                         }
//                     );
//                   },
//                     child: Icon(Icons.keyboard_control_rounded,color: HINT_TEXT_COLOR,size: 30,)
//                 )
//
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class BookListGridView extends StatelessWidget {
//   List<BookVO?>? bookList;
//   Function(BookVO?) onTapBook;
//   Function(BookVO?) onTapSeeMore;
//   bool? isThreeGrid;
//
//   BookListGridView({
//     required this.onTapSeeMore,
//     required this.bookList,
//     required this.onTapBook,
//     this.isThreeGrid = false,
//   });
//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//         padding: const EdgeInsets.only(left: 40),
//         scrollDirection: Axis.vertical,
//         shrinkWrap: true,
//         physics: const NeverScrollableScrollPhysics(),
//         itemCount: bookList?.length,
//         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//           mainAxisExtent: (isThreeGrid == false) ? 300 : 280,
//           crossAxisSpacing: 0,
//           childAspectRatio: 1,
//           crossAxisCount: (isThreeGrid == false) ? 2 : 3,
//         ),
//         itemBuilder: (context, index) {
//           BookVO? book = bookList?[index];
//           return BooksListViewItem(
//             onTapSeeMore: (book) {
//               onTapSeeMore(book);
//             },
//             isThreeGrid: isThreeGrid,
//             onTapBook: (book) {
//               onTapBook(book);
//             },
//             book: book,
//           );
//         });
//   }
// }
//
//
// class ChooseLargeAndSmallListBookView extends StatelessWidget {
//   List<BookVO>? bookList;
//   int gridCount;
//   ChooseLargeAndSmallListBookView({required this.bookList, required this.gridCount});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2,vertical: MARGIN_MEDIUM_2),
//         child: ListView(
//           physics: NeverScrollableScrollPhysics(), // <– this will disable scroll.
//           shrinkWrap: true,
//           children: [
//             BooksListDetailSectionView(
//               bookList: bookList??[],
//             onTapBook: (bookId){
//
//             },gridCount: gridCount,)
//           ],
//         )
//     );
//   }
// }
