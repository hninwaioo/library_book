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
              visible: _bookVisible,
              child: GestureDetector(
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

              Selector<ProviderLibraryBloc, List<ShelfVO?>?>(
                selector: (context, bloc) => bloc.shelfList,
                builder: (context, shelves, child) {
                  return
                    ShelvesListItemView(
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


  Future<dynamic> _navigateToCreateShelfScreen(BuildContext context) {
    return Navigator.push(context, MaterialPageRoute(
        builder: (context) => CreateBookShelfViewPage()
    )
    );
  }
}

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


