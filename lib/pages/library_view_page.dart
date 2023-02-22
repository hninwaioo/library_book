import 'package:flutter/material.dart';
import 'package:library_app/data/vos/shelf_vo.dart';
import 'package:library_app/pages/book_add_into_shelf_view_page.dart';
import 'package:library_app/widgets/sorting_books_list_view.dart';
import 'package:library_app/widgets/typical_text.dart';
import '../blocs/provider_library_bloc.dart';
import '../data/vos/book_vo.dart';
import '../persistence/add_data/add_book_to_library.dart';
import '../resources/colors.dart';
import '../resources/dimens.dart';
import '../view_items/shelves_list_item_view.dart';
import '../widgets/sort_books_list_view.dart';
import 'book_shelves_detail_view_page.dart';
import 'create_book_shelf_view_page.dart';
import 'package:provider/provider.dart';

class LibraryViewPage extends StatefulWidget {

  @override
  State<LibraryViewPage> createState() => _LibraryViewPageState();
}

class _LibraryViewPageState extends State<LibraryViewPage> {
  List<String> genreList = [
    "Your books",
    "Your shelves",
  ];

  String? chooseYourBooksORYourShelves = "YOUR_BOOKS";
  bool _bookVisible = false;
  String shelfName="";
  String? filterForView = "REC_OPEN";

  String? chosenTab;
  bool? crossButtonVisible = false;
  bool? chosenTabVisible = false;
  late List<String?>? tabList;
  int? booksOrShelves = 0;
  bool isSelected = false;
  int? groupValueForView = 1;
  int? groupValueForSort = 1;

  @override
  void initState() {
    super.initState();
    chooseYourBooksORYourShelves = "YOUR_BOOKS";
    _bookVisible = false;
  }

  void _getEbooksOrAudioBook(int index) {

    if(index == 0){

      chooseYourBooksORYourShelves = "YOUR_BOOKS";
      _bookVisible = false;

    }else{
      chooseYourBooksORYourShelves = "YOUR_SHELVES";
      _bookVisible = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => ProviderLibraryBloc(shelfName),
        child: Scaffold(
            floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked,
            floatingActionButton: Visibility(
              // visible: (booksOrShelves == 1),
              visible: _bookVisible,
              child:
              // CreateNewShelfButtonView(
              //   onTapCreateNew: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => CreateNewShelfPage()));
              //   },
              // ),
              GestureDetector(
                onTap: (){
                  _navigateToCreateShelfScreen(context);
                },
                child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2,vertical: MARGIN_SMALL),
                    margin: EdgeInsets.only(bottom: 25),
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            offset: Offset(0, 8),
                            blurRadius: 1000,
                            blurStyle: BlurStyle.inner,
                            spreadRadius: 0,
                          )
                        ],
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20.0)
                    ),
                    width: 130,
                    height: 50,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.edit_sharp,color: Colors.white,size: 20,),
                        SizedBox(width: MARGIN_SMALL,),
                        TypicalText("Create New", Colors.white, 12)
                      ],
                    )
                ),
              )
            ),
        body:
        // Stack(
        //   children: [
        //
        //     Positioned.fill(
        //         child:  SingleChildScrollView(
        //           child: Column(
        //             children: [
        //               LibraryTypeGenreSectionView(
        //                   genreList: genreList,
        //                   onTapGenres: (genreId) {
        //                     setState((){
        //                       print("GenreId==>${genreId}");
        //                       print("object=>${_bookVisible}");
        //
        //                       _getEbooksOrAudioBook(genreId);
        //                     });
        //                   }),
        //
        //               SizedBox(height: MARGIN_MEDIUM_2,),
        //
        //               (chooseYourBooksORYourShelves == "YOUR_BOOKS")
        //               ?
        //               // Column(
        //               //   crossAxisAlignment: CrossAxisAlignment.start,
        //               //   children: [
        //               //     SortByRecentBookSectionView(),
        //               //     SizedBox(height: MARGIN_MEDIUM_2,),
        //               //
        //               //     Container(
        //               //       child: ListView(
        //               //         physics: NeverScrollableScrollPhysics(), // <– this will disable scroll.
        //               //         shrinkWrap: true,
        //               //         children: [
        //               //           ChooseVerticalListBookSectionView()
        //               //         ],
        //               //       ),
        //               //     ),
        //               //     SizedBox(height: MARGIN_MEDIUM_2,),
        //               //   ],
        //               // )
        //               Selector<ProviderLibraryBloc, List<BookVO>?>(
        //                   selector: (context, bloc) => bloc.bookListInLibrary,
        //                   builder: (context, bookList, child) {
        //                     if (bookList?.isNotEmpty ?? false) {
        //                       if (filterForView == "REC_OPEN") {
        //                         bookList?.sort((a, b) =>
        //                             b.openedDate
        //                                 .toString()
        //                                 .compareTo(a.openedDate.toString()));
        //                         debugPrint("REC_OPEN");
        //
        //                       }
        //                       else if (filterForView == "TITLE") {
        //                         bookList?.sort((a, b) =>
        //                             a.title
        //                                 .toString()
        //                                 .toLowerCase()
        //                                 .compareTo(
        //                                 b.title.toString().toLowerCase()));
        //                         debugPrint("TITLETITLE");
        //
        //                       }
        //                       else {
        //                         bookList?.sort((a, b) =>
        //                             a.author
        //                                 .toString()
        //                                 .toLowerCase()
        //                                 .compareTo(
        //                                 b.author.toString()
        //                                     .toLowerCase()));
        //                         debugPrint("AUTHORAUTHOR");
        //
        //                       }
        //                     }
        //
        //                     List<BookVO?>? userBooks;
        //
        //                     if (isSelected == false) {
        //                       userBooks = bookList;
        //                     } else {
        //                       userBooks = bookList
        //                           ?.where(
        //                               (element) => element.listName == chosenTab)
        //                           .toList();
        //                     }
        //
        //                     tabList = bookList
        //                         ?.map((book) {
        //                       return book.listName;
        //                     })
        //                         .toList()
        //                         .toSet()
        //                         .toList();
        //
        //                     // return SortingBooksListViewSection(
        //                     //
        //                     //   addToShelf: (book) {
        //                     //     BookVO? clickedBook() {
        //                     //       book?.isAddedShelf = true;
        //                     //       return book;
        //                     //     }
        //                     //
        //                     //     var bookListController = AddBookToLibrary();
        //                     //     bookListController.addBook(clickedBook());
        //                     //     var blocHome =
        //                     //     Provider.of<ProviderLibraryBloc>(context,
        //                     //         listen: false);
        //                     //     blocHome
        //                     //         .saveAllBooks(bookListController.bookListInLibrary);
        //                     //
        //                     //     // Navigator.push(
        //                     //     //     context,
        //                     //     //     MaterialPageRoute(
        //                     //     //         builder: (context) =>
        //                     //     //             AddingIntoShelfPage(book: book)
        //                     //     //     )
        //                     //     // );
        //                     //   },
        //                     //
        //                     //   onTapCrossButton: () {
        //                     //     setState(() {
        //                     //       crossButtonVisible = false;
        //                     //       chosenTabVisible = false;
        //                     //       isSelected = false;
        //                     //     });
        //                     //   },
        //                     //   onTabBookTypeChooser: (tab) {
        //                     //     setState(() {
        //                     //       chosenTab = tab;
        //                     //       chosenTabVisible = true;
        //                     //       crossButtonVisible = true;
        //                     //       isSelected = true;
        //                     //     });
        //                     //   },
        //                     //   tabList: tabList,
        //                     //   crossButtonVisible: crossButtonVisible,
        //                     //   chosenTab: chosenTab,
        //                     //   isSelected: isSelected,
        //                     //   chosenTabVisible: chosenTabVisible,
        //                     //   groupValueForView: groupValueForView,
        //                     //
        //                     //   bookList: bookList ?? [],
        //                     //   // onSelectedFilterByRecent: (filterType) {
        //                     //   //   setState(() {
        //                     //   //     filterForView = filterType;
        //                     //   //     debugPrint("REC=>${filterType}");
        //                     //   //
        //                     //   //   });
        //                     //   // },
        //                     //   //
        //                     //   // onSelectedFilterByBookTitle: (filterType) {
        //                     //   //   setState(() {
        //                     //   //     filterForView = filterType;
        //                     //   //     debugPrint("TITLE=>${filterType}");
        //                     //   //
        //                     //   //   });
        //                     //   // },
        //                     //   //
        //                     //   // onSelectedFilterByAuthor: (filterType) {
        //                     //   //   setState(() {
        //                     //   //     filterForView = filterType;
        //                     //   //     debugPrint("AUTHOR=>${filterType}");
        //                     //   //
        //                     //   //   });
        //                     //   // },
        //                     //
        //                     //   onSelectedFilterByRecent: (e) {
        //                     //     setState(() {
        //                     //       groupValueForSort = e;
        //                     //     });
        //                     //   },
        //                     //   onSelectedFilterByBookTitle: (e) {
        //                     //     setState(() {
        //                     //       groupValueForSort = e;
        //                     //     });
        //                     //   },
        //                     //   onSelectedFilterByAuthor: (e) {
        //                     //     setState(() {
        //                     //       groupValueForSort = e;
        //                     //     });
        //                     //   },
        //                     //
        //                     //   filterForView: filterForView,
        //                     //
        //                     //   onSelectedVerticalListView: (viewType) {
        //                     //
        //                     // }, onSelectedLargeGridView: (viewType) {
        //                     //
        //                     // }, onSelectedSmallGridView: (viewType) {
        //                     //
        //                     // },
        //                     //
        //                     // );
        //
        //                     return SortingBookListView(
        //                       bookList: userBooks,
        //
        //                       addToShelf: (book) {
        //                         BookVO? clickedBook() {
        //                           book?.isAddedShelf = true;
        //                           return book;
        //                         }
        //
        //                         var bookListController = AddBookToLibrary();
        //                         bookListController.addBook(clickedBook());
        //                         var blocHome =
        //                         Provider.of<ProviderLibraryBloc>(context,
        //                             listen: false);
        //                         blocHome
        //                             .saveAllBooks(bookListController.bookListInLibrary);
        //
        //                         debugPrint("ADDSHELF");
        //                         Navigator.push(
        //                             context,
        //                             MaterialPageRoute(
        //                                 builder: (context) =>
        //                                     BookAddIntoShelfViewPage(book: book!)
        //                             )
        //                         );
        //
        //                       },
        //
        //                       onTapChooseViewThree: (e) {
        //                         setState(() {
        //                           groupValueForView = e;
        //                         });
        //                       },
        //                       onTapChooseViewTwo: (e) {
        //                         setState(() {
        //                           groupValueForView = e;
        //                         });
        //                       },
        //                       onTapChooseViewOne: (e) {
        //                         setState(() {
        //                           groupValueForView = e;
        //                         });
        //                       },
        //                       onTapSortingThree: (e) {
        //                         setState(() {
        //                           groupValueForSort = e;
        //                         });
        //                       },
        //
        //                       onTapSortingTwo: (e) {
        //                         setState(() {
        //                           groupValueForSort = e;
        //                         });
        //                       },
        //
        //                       onTapSortingOne: (e) {
        //                         setState(() {
        //                           groupValueForSort = e;
        //                         });
        //                       },
        //
        //                       onTapCrossButton: () {
        //                         setState(() {
        //                           crossButtonVisible = false;
        //                           chosenTabVisible = false;
        //                           isSelected = false;
        //                         });
        //                       },
        //                       onTabBookTypeChooser: (tab) {
        //                         setState(() {
        //                           chosenTab = tab;
        //                           chosenTabVisible = true;
        //                           crossButtonVisible = true;
        //                           isSelected = true;
        //                         });
        //                       },
        //                       tabList: tabList,
        //                       crossButtonVisible: crossButtonVisible,
        //                       chosenTab: chosenTab,
        //                       isSelected: isSelected,
        //                       chosenTabVisible: chosenTabVisible,
        //                       groupValueForView: groupValueForView,
        //                     );
        //
        //                   }
        //               )
        //                   :
        //
        //               // Selector<ProviderLibraryBloc, List<ShelfVO>?>(
        //               //     selector: (context, bloc) => bloc.shelfList,
        //               //     builder: (context, shelfList, child) {
        //               //       var _visibleshelfList = false;
        //               //       if(shelfList?.isNotEmpty ?? false){
        //               //         _visibleshelfList = true;
        //               //       }else {
        //               //         _visibleshelfList = false;
        //               //       }
        //               //
        //               //       return Container(
        //               //           margin: EdgeInsets.only(right: MARGIN_MEDIUM_2),
        //               //           child:
        //               //           (_visibleshelfList == true)
        //               //           ?
        //               //           Visibility(
        //               //             visible: _visibleshelfList,
        //               //             child:
        //               //             // ShelvesListSectionView(shelfList: shelfList,),
        //               //             ShelvesListItemView(
        //               //               onTapArrow: (bookShelf) async {
        //               //
        //               //                 _navigateToBookShelvesDetailScreen(context);
        //               //               },
        //               //               visibleArrow: true,
        //               //               visibleCheckBox: false,
        //               //               bookShelveList: shelfList,
        //               //             )
        //               //           )
        //               //               :
        //               //
        //               //           Visibility(
        //               //               visible: _visibleshelfList,
        //               //               child: Container(
        //               //                 child: Column(
        //               //                   children: [
        //               //                     Image.asset("assets/images/book_shelf.png"),
        //               //                     TypicalText("No Shelves", Colors.black, TEXT_REGULAR_1X, isFontWeight: true,),
        //               //                     TypicalText("Create shelves to match the way you think", PRIMARY_HINT_COLOR, TEXT_REGULAR,),
        //               //                   ],
        //               //                 ),
        //               //               )
        //               //           )
        //               //       );
        //               //     }
        //               // )
        //
        //                    Selector<ProviderLibraryBloc, List<ShelfVO?>?>(
        //                 selector: (context, bloc) => bloc.shelfList,
        //                 builder: (context, shelves, child) {
        //                   return
        //                     CheckBoxOrArrowWithBookImageAndNameView(
        //                       onTapArrow: (bookShelf) async {
        //                         bool? update = await Navigator.push(
        //                             context,
        //                             MaterialPageRoute(
        //                                 builder: (context) => BookShelvesDetailPage(
        //                                   nameToRemoveShelf:
        //                                   bookShelf?.shelfName,
        //                                   shelf: bookShelf,
        //                                 ))
        //                         );
        //                         if (update == true) {
        //                           setState(() {});
        //                         }
        //                       },
        //                       visibleArrow: true,
        //                       visibleCheckBox: false,
        //                       bookShelveList: shelves,
        //                     );
        //                 },
        //               )
        //
        //             ],
        //           ),
        //         ),
        //     ),
        //
        //     // Positioned(
        //     //   bottom: 1,
        //     //   right: 10,
        //     //   left: 10,
        //     //   child: Column(
        //     //     children: [
        //     //       Visibility(
        //     //         visible: _bookVisible,
        //     //           child: GestureDetector(
        //     //               onTap: (){
        //     //                 _navigateToCreateShelfScreen(context);
        //     //               },
        //     //               child: Container(
        //     //                   padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2,vertical: MARGIN_MEDIUM),
        //     //                   decoration: BoxDecoration(
        //     //                       color: Colors.blue,
        //     //                       borderRadius: BorderRadius.circular(20.0)
        //     //                   ),
        //     //                   width: 150,
        //     //                   child: Row(
        //     //                     crossAxisAlignment: CrossAxisAlignment.center,
        //     //                     children: [
        //     //                       Icon(Icons.edit_sharp,color: Colors.white,),
        //     //                       SizedBox(width: MARGIN_SMALL,),
        //     //                       TypicalText("Create New", Colors.white, 14)
        //     //                     ],
        //     //                   )
        //     //               )
        //     //           ),
        //     //       ),
        //     //       SizedBox(height: MARGIN_MEDIUM_2,),
        //     //     ],
        //     //   ),
        //     // ),
        //   ],
        // )
        SingleChildScrollView(
          child: Column(
            children: [
              LibraryTypeGenreSectionView(
                  genreList: genreList,
                  onTapGenres: (genreId) {
                    setState((){
                      print("GenreId==>${genreId}");
                      print("object=>${_bookVisible}");

                      _getEbooksOrAudioBook(genreId);
                    });
                  }),

              SizedBox(height: MARGIN_MEDIUM_2,),

              (chooseYourBooksORYourShelves == "YOUR_BOOKS")
                  ?
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     SortByRecentBookSectionView(),
              //     SizedBox(height: MARGIN_MEDIUM_2,),
              //
              //     Container(
              //       child: ListView(
              //         physics: NeverScrollableScrollPhysics(), // <– this will disable scroll.
              //         shrinkWrap: true,
              //         children: [
              //           ChooseVerticalListBookSectionView()
              //         ],
              //       ),
              //     ),
              //     SizedBox(height: MARGIN_MEDIUM_2,),
              //   ],
              // )
              Selector<ProviderLibraryBloc, List<BookVO>?>(
                  selector: (context, bloc) => bloc.bookListInLibrary,
                  builder: (context, bookList, child) {
                    if (bookList?.isNotEmpty ?? false) {
                      if (filterForView == "REC_OPEN") {
                        bookList?.sort((a, b) =>
                            b.openedDate
                                .toString()
                                .compareTo(a.openedDate.toString()));
                        debugPrint("REC_OPEN");

                      }
                      else if (filterForView == "TITLE") {
                        bookList?.sort((a, b) =>
                            a.title
                                .toString()
                                .toLowerCase()
                                .compareTo(
                                b.title.toString().toLowerCase()));
                        debugPrint("TITLETITLE");

                      }
                      else {
                        bookList?.sort((a, b) =>
                            a.author
                                .toString()
                                .toLowerCase()
                                .compareTo(
                                b.author.toString()
                                    .toLowerCase()));
                        debugPrint("AUTHORAUTHOR");

                      }
                    }

                    List<BookVO?>? userBooks;

                    if (isSelected == false) {
                      userBooks = bookList;
                    } else {
                      userBooks = bookList
                          ?.where(
                              (element) => element.listName == chosenTab)
                          .toList();
                    }

                    tabList = bookList
                        ?.map((book) {
                      return book.listName;
                    })
                        .toList()
                        .toSet()
                        .toList();

                    // return SortingBooksListViewSection(
                    //
                    //   addToShelf: (book) {
                    //     BookVO? clickedBook() {
                    //       book?.isAddedShelf = true;
                    //       return book;
                    //     }
                    //
                    //     var bookListController = AddBookToLibrary();
                    //     bookListController.addBook(clickedBook());
                    //     var blocHome =
                    //     Provider.of<ProviderLibraryBloc>(context,
                    //         listen: false);
                    //     blocHome
                    //         .saveAllBooks(bookListController.bookListInLibrary);
                    //
                    //     // Navigator.push(
                    //     //     context,
                    //     //     MaterialPageRoute(
                    //     //         builder: (context) =>
                    //     //             AddingIntoShelfPage(book: book)
                    //     //     )
                    //     // );
                    //   },
                    //
                    //   onTapCrossButton: () {
                    //     setState(() {
                    //       crossButtonVisible = false;
                    //       chosenTabVisible = false;
                    //       isSelected = false;
                    //     });
                    //   },
                    //   onTabBookTypeChooser: (tab) {
                    //     setState(() {
                    //       chosenTab = tab;
                    //       chosenTabVisible = true;
                    //       crossButtonVisible = true;
                    //       isSelected = true;
                    //     });
                    //   },
                    //   tabList: tabList,
                    //   crossButtonVisible: crossButtonVisible,
                    //   chosenTab: chosenTab,
                    //   isSelected: isSelected,
                    //   chosenTabVisible: chosenTabVisible,
                    //   groupValueForView: groupValueForView,
                    //
                    //   bookList: bookList ?? [],
                    //   // onSelectedFilterByRecent: (filterType) {
                    //   //   setState(() {
                    //   //     filterForView = filterType;
                    //   //     debugPrint("REC=>${filterType}");
                    //   //
                    //   //   });
                    //   // },
                    //   //
                    //   // onSelectedFilterByBookTitle: (filterType) {
                    //   //   setState(() {
                    //   //     filterForView = filterType;
                    //   //     debugPrint("TITLE=>${filterType}");
                    //   //
                    //   //   });
                    //   // },
                    //   //
                    //   // onSelectedFilterByAuthor: (filterType) {
                    //   //   setState(() {
                    //   //     filterForView = filterType;
                    //   //     debugPrint("AUTHOR=>${filterType}");
                    //   //
                    //   //   });
                    //   // },
                    //
                    //   onSelectedFilterByRecent: (e) {
                    //     setState(() {
                    //       groupValueForSort = e;
                    //     });
                    //   },
                    //   onSelectedFilterByBookTitle: (e) {
                    //     setState(() {
                    //       groupValueForSort = e;
                    //     });
                    //   },
                    //   onSelectedFilterByAuthor: (e) {
                    //     setState(() {
                    //       groupValueForSort = e;
                    //     });
                    //   },
                    //
                    //   filterForView: filterForView,
                    //
                    //   onSelectedVerticalListView: (viewType) {
                    //
                    // }, onSelectedLargeGridView: (viewType) {
                    //
                    // }, onSelectedSmallGridView: (viewType) {
                    //
                    // },
                    //
                    // );

                    return SortingBookListView(
                      bookList: userBooks,

                      addToShelf: (book) {
                        BookVO? clickedBook() {
                          book?.isAddedShelf = true;
                          return book;
                        }

                        var bookListController = AddBookToLibrary();
                        bookListController.addBook(clickedBook());
                        var blocHome =
                        Provider.of<ProviderLibraryBloc>(context,
                            listen: false);
                        blocHome
                            .saveAllBooks(bookListController.bookListInLibrary);

                        debugPrint("ADDSHELF");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    BookAddIntoShelfViewPage(book: book!)
                            )
                        );

                      },

                      onTapChooseViewThree: (e) {
                        setState(() {
                          groupValueForView = e;
                        });
                      },
                      onTapChooseViewTwo: (e) {
                        setState(() {
                          groupValueForView = e;
                        });
                      },
                      onTapChooseViewOne: (e) {
                        setState(() {
                          groupValueForView = e;
                        });
                      },
                      onTapSortingThree: (e) {
                        setState(() {
                          groupValueForSort = e;
                        });
                      },

                      onTapSortingTwo: (e) {
                        setState(() {
                          groupValueForSort = e;
                        });
                      },

                      onTapSortingOne: (e) {
                        setState(() {
                          groupValueForSort = e;
                        });
                      },

                      onTapCrossButton: () {
                        setState(() {
                          crossButtonVisible = false;
                          chosenTabVisible = false;
                          isSelected = false;
                        });
                      },
                      onTabBookTypeChooser: (tab) {
                        setState(() {
                          chosenTab = tab;
                          chosenTabVisible = true;
                          crossButtonVisible = true;
                          isSelected = true;
                        });
                      },
                      tabList: tabList,
                      crossButtonVisible: crossButtonVisible,
                      chosenTab: chosenTab,
                      isSelected: isSelected,
                      chosenTabVisible: chosenTabVisible,
                      groupValueForView: groupValueForView,
                    );

                  }
              )
                  :

              // Selector<ProviderLibraryBloc, List<ShelfVO>?>(
              //     selector: (context, bloc) => bloc.shelfList,
              //     builder: (context, shelfList, child) {
              //       var _visibleshelfList = false;
              //       if(shelfList?.isNotEmpty ?? false){
              //         _visibleshelfList = true;
              //       }else {
              //         _visibleshelfList = false;
              //       }
              //
              //       return Container(
              //           margin: EdgeInsets.only(right: MARGIN_MEDIUM_2),
              //           child:
              //           (_visibleshelfList == true)
              //           ?
              //           Visibility(
              //             visible: _visibleshelfList,
              //             child:
              //             // ShelvesListSectionView(shelfList: shelfList,),
              //             ShelvesListItemView(
              //               onTapArrow: (bookShelf) async {
              //
              //                 _navigateToBookShelvesDetailScreen(context);
              //               },
              //               visibleArrow: true,
              //               visibleCheckBox: false,
              //               bookShelveList: shelfList,
              //             )
              //           )
              //               :
              //
              //           Visibility(
              //               visible: _visibleshelfList,
              //               child: Container(
              //                 child: Column(
              //                   children: [
              //                     Image.asset("assets/images/book_shelf.png"),
              //                     TypicalText("No Shelves", Colors.black, TEXT_REGULAR_1X, isFontWeight: true,),
              //                     TypicalText("Create shelves to match the way you think", PRIMARY_HINT_COLOR, TEXT_REGULAR,),
              //                   ],
              //                 ),
              //               )
              //           )
              //       );
              //     }
              // )

              Selector<ProviderLibraryBloc, List<ShelfVO?>?>(
                selector: (context, bloc) => bloc.shelfList,
                builder: (context, shelves, child) {
                  return
                    CheckBoxOrArrowWithBookImageAndNameView(
                      onTapArrow: (bookShelf) async {
                        bool? update = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BookShelvesDetailPage(
                                  nameToRemoveShelf:
                                  bookShelf?.shelfName,
                                  shelf: bookShelf,
                                ))
                        );
                        if (update == true) {
                          setState(() {});
                        }
                      },
                      visibleArrow: true,
                      visibleCheckBox: false,
                      bookShelveList: shelves,
                    );
                },
              )

            ],
          ),
        ),
    ),
      );
  }

  Future<dynamic> _navigateToBookShelvesDetailScreen(BuildContext context) {
    return Navigator.push(context, MaterialPageRoute(
        builder: (context) => BookShelvesDetailViewPage()
    )
    );
  }

  Future<dynamic> _navigateToCreateShelfScreen(BuildContext context) {
    return Navigator.push(context, MaterialPageRoute(
        builder: (context) => CreateBookShelfViewPage()
    )
    );
  }
}

// class ShelvesListSectionView extends StatelessWidget {
//  List<ShelfVO>? shelfList;
//  ShelvesListSectionView({required this.shelfList});
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         physics: ScrollPhysics(),
//         shrinkWrap: true,
//         scrollDirection: Axis.vertical,
//         padding: EdgeInsets.only(
//             left: MARGIN_MEDIUM_2),
//         itemCount: shelfList?.length,
//         itemBuilder: (BuildContext context,
//             int index) {
//           return Column(
//             children: [
//               ShelvesListItemView(
//                 shelfVO: shelfList?[index],
//                 checkedShelf: (f){
//
//                 },
//                 shelfCheck: "SHELF",
//                 visibleCheck: true,
//               ),
//               SizedBox(height: MARGIN_MEDIUM_2,)
//             ],
//           );
//         }
//     );
//   }
// }

class LibraryTypeGenreSectionView extends StatelessWidget {
  LibraryTypeGenreSectionView(
      {
        required this.genreList,
        required this.onTapGenres,
      });
  final List<String> genreList;
  final Function (int) onTapGenres;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(MARGIN_MEDIUM_2, 0, MARGIN_MEDIUM_2, 0),
            height: 50,
            child: TabBar(
              labelColor: PRIMARY_HINT_COLOR,
              unselectedLabelColor: PRIMARY_HINT_COLOR,
              onTap: (index){
                this.onTapGenres(index);
              },
              tabs: genreList.map(
                      (genre) => Tab(
                    child: Text(genre),
                  )
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }
}


// class MultiSelectTabBarViewSection extends StatefulWidget {
//   List<String?>? tabList;
//   Function(String) onTab;
//   Function onTapCrossButton;
//   // Function(String? tab) onTabBookTypeChooser;
//
//   String? chosenTab;
//   bool? crossButtonVisible;
//   bool? chosenTabVisible;
//   bool? tabListVisible;
//   MultiSelectTabBarViewSection({
//     required this.tabList,
//     required this.onTab,
//     required this.onTapCrossButton,
//     // required this.onTabBookTypeChooser,
//     required this.chosenTab,
//     required this.chosenTabVisible,
//     required this.crossButtonVisible,
//     this.tabListVisible = true,
//   });
//   @override
//   State<MultiSelectTabBarViewSection> createState() =>
//       _MultiSelectTabBarViewSectionState();
// }
//
// class _MultiSelectTabBarViewSectionState
//     extends State<MultiSelectTabBarViewSection> {
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 34,
//       child: ListView(
//         physics: AlwaysScrollableScrollPhysics(),
//         padding: EdgeInsets.only(right: 26, left: 26),
//         scrollDirection: Axis.horizontal,
//         children: [
//           Visibility(
//             visible: widget.crossButtonVisible ?? false,
//             child: RemoveChosenTabIconView(onTapCrossButton: () {
//               widget.onTapCrossButton();
//             }),
//           ),
//           SizedBox(width: 10),
//           Visibility(
//               visible: widget.chosenTabVisible ?? false,
//               child: ChosenTabWithColorView(text: "${widget.chosenTab}")),
//           SizedBox(width: 10),
//           Visibility(
//             visible: (widget.tabList!.isNotEmpty),
//             child: MultiTabsImplementForBookListView(
//               tabList: widget.tabList ?? [],
//               onTab: (tab) {
//                 widget.onTab(tab);
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// class ChosenTabWithColorView extends StatelessWidget {
//   String text;
//   ChosenTabWithColorView({required this.text});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 34,
//       padding: EdgeInsets.symmetric(horizontal: 10),
//       decoration: BoxDecoration(
//         color: Colors.blue,
//         border: Border.all(width: 1, color: Colors.black12),
//         borderRadius: BorderRadius.all(
//           Radius.circular(30),
//         ),
//       ),
//       child: Center(
//         child: Text(text),
//       ),
//     );
//   }
// }
//
// class RemoveChosenTabIconView extends StatelessWidget {
//   Function onTapCrossButton;
//   RemoveChosenTabIconView({required this.onTapCrossButton});
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         onTapCrossButton();
//       },
//       child: Container(
//         child: Icon(
//           Icons.highlight_off_outlined,
//           size: 36,
//           color: Colors.black45,
//         ),
//         height: 40,
//         width: 40,
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           //color: Colors.blue,
//         ),
//         //padding: EdgeInsets.all(3),
//       ),
//     );
//   }
// }
//
// class MultiTabsImplementForBookListView extends StatelessWidget {
//   MultiTabsImplementForBookListView({
//     required this.tabList,
//     required this.onTab,
//   });
//   List<String?>? tabList;
//   Function(String) onTab;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(right: 10),
//       height: 34,
//       padding: EdgeInsets.only(top: 8),
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.all(
//             Radius.circular(30),
//           ),
//           border: Border.all(
//             width: 1,
//             color: Colors.black12,
//           )),
//       child: ListView.separated(
//         shrinkWrap: true,
//         padding: EdgeInsets.only(left: 10, top: 0, right: 10),
//         scrollDirection: Axis.horizontal,
//         itemCount: tabList?.length ?? 0,
//         physics: NeverScrollableScrollPhysics(),
//         separatorBuilder: ((context, index) {
//           return Text(
//             "|",
//             style: TextStyle(fontSize: 16),
//           );
//         }),
//         itemBuilder: (context, index) {
//           return GestureDetector(
//             child: Container(
//               margin: EdgeInsets.symmetric(horizontal: 10),
//               child: Text(
//                 "${tabList?[index]}",
//               ),
//             ),
//             onTap: () {
//               onTab(tabList?[index] ?? "");
//             },
//           );
//         },
//       ),
//     );
//   }
// }

