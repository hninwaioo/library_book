import 'package:flutter/material.dart';
import 'package:library_app/data/vos/shelf_vo.dart';
import 'package:library_app/widgets/typical_text.dart';
import '../blocs/provider_library_bloc.dart';
import '../data/vos/book_vo.dart';
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
        body: Stack(
          children: [
            Positioned.fill(
                child:  SingleChildScrollView(
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

                            return SortBooksListView(
                              bookList: bookList ?? [],
                              onSelectedFilterByRecent: (filterType) {
                                setState(() {
                                  filterForView = filterType;
                                  debugPrint("REC=>${filterType}");

                                });
                              },

                              onSelectedFilterByBookTitle: (filterType) {
                                setState(() {
                                  filterForView = filterType;
                                  debugPrint("TITLE=>${filterType}");

                                });
                              },

                              onSelectedFilterByAuthor: (filterType) {
                                setState(() {
                                  filterForView = filterType;
                                  debugPrint("AUTHOR=>${filterType}");

                                });
                              },
                              filterForView: filterForView,

                            );
                          }
                      )
                          :

                      Selector<ProviderLibraryBloc, List<ShelfVO>?>(
                          selector: (context, bloc) => bloc.shelfList,
                          builder: (context, shelfList, child) {
                            var _visibleshelfList = false;
                            if(shelfList?.isNotEmpty ?? false){
                              _visibleshelfList = true;
                            }else {
                              _visibleshelfList = false;
                            }

                            return Container(
                                margin: EdgeInsets.only(right: MARGIN_MEDIUM_2),
                                child:
                                (_visibleshelfList == true)
                                ?
                                Visibility(
                                  visible: _visibleshelfList,
                                  child:
                                  // ShelvesListSectionView(shelfList: shelfList,),
                                  ShelvesListItemView(
                                    onTapArrow: (bookShelf) async {

                                      _navigateToBookShelvesDetailScreen(context);
                                    },
                                    visibleArrow: true,
                                    visibleCheckBox: false,
                                    bookShelveList: shelfList,
                                  )
                                )
                                    :

                                Visibility(
                                    visible: _visibleshelfList,
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Image.asset("assets/images/book_shelf.png"),
                                          TypicalText("No Shelves", Colors.black, TEXT_REGULAR_1X, isFontWeight: true,),
                                          TypicalText("Create shelves to match the way you think", PRIMARY_HINT_COLOR, TEXT_REGULAR,),
                                        ],
                                      ),
                                    )
                                )
                            );
                          }
                      )
                    ],
                  ),
                ),
            ),

            Positioned(
              bottom: 1,
              right: 10,
              left: 10,
              child: Column(
                children: [
                  Visibility(
                    visible: _bookVisible,
                      child: GestureDetector(
                          onTap: (){
                            _navigateToCreateShelfScreen(context);
                          },
                          child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2,vertical: MARGIN_MEDIUM),
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(20.0)
                              ),
                              width: 150,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.edit_sharp,color: Colors.white,),
                                  SizedBox(width: MARGIN_SMALL,),
                                  TypicalText("Create New", Colors.white, 14)
                                ],
                              )
                          )
                      ),
                  ),
                  SizedBox(height: MARGIN_MEDIUM_2,),
                ],
              ),
            ),
          ],
        )
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





