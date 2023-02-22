import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:library_app/data/vos/main_list_vo.dart';
// import 'package:google_ebook_app/blocs/home_portions_bloc.dart';
// import 'package:google_ebook_app/constants/string_constants.dart';
// import 'package:google_ebook_app/controllers/your_book_list_controller.dart';
// import 'package:google_ebook_app/data/vos/book_section_vo.dart';
// import 'package:google_ebook_app/data/vos/book_vo.dart';
// import 'package:google_ebook_app/pages/book_item_detail_page.dart';
// import 'package:google_ebook_app/pages/home_search_page.dart';
// import 'package:google_ebook_app/pages/section_detail_page.dart';
// import 'package:google_ebook_app/reusable_widgets/reusable_widgets.dart';
import 'package:provider/provider.dart';

import '../blocs/provider_home_bloc.dart';
import '../data/vos/book_vo.dart';
import '../persistence/add_data/add_book_to_library.dart';
import '../resources/strings.dart';
import '../widgets/bottom_sheet_for_book_in_library_view.dart';

class HomePageRoot extends StatelessWidget {
  const HomePageRoot({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProviderHomeBloc(),
      child: Container(
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? eBookOrAudioBook = 0;

  // @override
  // void dispose() {
  //   var bloc = Provider.of<ProviderHomeBloc>(context, listen: false);
  //   bloc.isDispose = true;
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProviderHomeBloc(),
      child: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(
              MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height / 10,
            ),
            child: AppBarCustomDesignView(
              imageUrl:
                  "https://images.saymedia-content.com/.image/t_share/MTc0NDI5MTc5NzI1NDg5Nzk4/top-10-greatest-leonardo-dicaprio-movies.jpg",
            ),
          ),

          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 40),
                Selector<ProviderHomeBloc, List<BookVO?>?>(
                    selector: (context, bloc) => bloc.mBookList,
                    builder: (context, yourBookList, widget) {
                      List<BookVO?>? currentBooks = yourBookList
                          ?.where((element) => element?.isAddedLibrary == true)
                          .toList();
                      return (currentBooks != null)
                          ? CurrentlyReadingBookListView(
                              onPressedIcon: (book) {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return BottomSheetForBookInLibraryView(
                                      book: book!, onPressedIcon: (BookVO) {

                                    },
                                      // onTapBookAddToShelf: (dataBook){
                                      //
                                      // },
                                    );
                                  },
                                );
                              },
                              stillReadingBooks: currentBooks,
                            )
                          : Container(
                              child: Text("Add some Books for yourself"),
                            );
                    }),
                SizedBox(height: 40),
                ChoosingTabsView(
                  tabOne: "Ebooks",
                  tabTwo: "Audiobooks",
                  callBackTab: (tab) {
                    setState(() {
                      eBookOrAudioBook = tab;
                    });
                  },
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 0.3,
                  decoration: BoxDecoration(color: Colors.grey),
                ),
                SizedBox(height: 30),
                Selector<ProviderHomeBloc, List<MainListBookSectionVO?>?>(
                  selector: (context, bloc) => bloc.mBookSectionList,
                  builder: (context, bookSections, widget) {
                    return BookSectionsForHomePageView(
                      eBookOrAudioBook: eBookOrAudioBook,
                      bookSectionList: bookSections,
                      onTapBook: (book) async {
                        var clickDate = DateTime.now();
                        BookVO? clickedBook() {
                          book?.openedDate = clickDate.toString();
                          book?.isAddedLibrary = true;
                          return book;
                        }

                        var bookListController = AddBookToLibrary();
                        bookListController.addBook(clickedBook());
                        var bloc = Provider.of<ProviderHomeBloc>(context,
                            listen: false);
                        bloc.saveAllBooks(bookListController.bookListInLibrary);
                        // bool result = await Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => BookDetailPage(bookVO: book),
                        //   ),
                        // );
                        // if (result == true) {
                        //   setState(() {});
                        // }
                      },
                      onTapHeader: (bookSection) {
                        var bloc = Provider.of<ProviderHomeBloc>(context,
                            listen: false);
                        bloc.callBooksByList(bookSection?.listName ?? "");
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => SectionDetailPage(
                        //       bookSection: bookSection,
                        //     ),
                        //   ),
                        // );
                      },
                      onTapSeeMoreIcon: (book) {
                        // showModalBottomSheet(
                        //     context: context,
                        //     builder: (context) => ShowModalSheetForBookDetail(
                        //         visibleDownload: true,
                        //         visibleDeleteFromLibrary: true,
                        //         visibleAddToShelves: true,
                        //         visibleMarkAsRead: true,
                        //         book: book,
                        //         onPressedIcon: (book) {}));
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BookSectionsForHomePageView extends StatelessWidget {
  BookSectionsForHomePageView({
    Key? key,
    required this.eBookOrAudioBook,
    required this.bookSectionList,
    required this.onTapSeeMoreIcon,
    required this.onTapBook,
    required this.onTapHeader,
  }) : super(key: key);

  int? eBookOrAudioBook;
  List<MainListBookSectionVO?>? bookSectionList;
  Function(MainListBookSectionVO?) onTapHeader;
  Function(BookVO? book) onTapBook;
  Function(BookVO? book) onTapSeeMoreIcon;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        key: Key("MainList"),
        itemCount: bookSectionList?.length,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return BooksListAndNamesView(
            key: Key("VerticalListSection ${index}"),
            eBookOrAudioBook: eBookOrAudioBook,
            bookList: bookSectionList?[index]?.books,
            bookSection: bookSectionList?[index],
            onTapHeader: (listName) {
              onTapHeader(listName);
            },
            onTapBook: (book) {
              onTapBook(book);
            },
            onPressedIcon: (book) {
              onTapSeeMoreIcon(book);
            },
          );
        });
  }
}

class BooksListAndNamesView extends StatefulWidget {
  BooksListAndNamesView({
    Key? key,
    required this.eBookOrAudioBook,
    required this.bookList,
    required this.bookSection,
    required this.onTapHeader,
    required this.onTapBook,
    required this.onPressedIcon,
  }) : super(key: key);

  int? eBookOrAudioBook;
  List<BookVO?>? bookList;
  MainListBookSectionVO? bookSection;
  Function(MainListBookSectionVO?) onTapHeader;
  Function(BookVO?) onTapBook;
  Function(BookVO?) onPressedIcon;
  @override
  State<BooksListAndNamesView> createState() => _BooksListAndNamesViewState();
}

class _BooksListAndNamesViewState extends State<BooksListAndNamesView> {
  BookVO? book;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ReusableTextAndArrowView(
            visibleArrow: true,
            bookSection: widget.bookSection,
            onTapArrow: (bookSection) {
              widget.onTapHeader(bookSection);
            },
          ),
        ),
        SizedBox(height: 20),
        Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          height: 330,
          child: ListView.builder(
            key: Key("BookListView"),
            padding: const EdgeInsets.only(left: 10),
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: widget.bookList?.length,
            itemExtent: (widget.eBookOrAudioBook == 0) ? 120 : 220,
            itemBuilder: (context, index) {
              book = widget.bookList?[index];
              return BookItemDetailView(
                onTapSeeMore: (book) {
                  widget.onPressedIcon(book);
                },
                onTapBook: (book) {
                  widget.onTapBook(book);
                },
                book: book,
              );
            },
          ),
        ),
      ],
    );
  }
}

class BookItemDetailView extends StatelessWidget {
  BookVO? book;
  double marginInGridView;
  bool? isThreeGrid;
  Function(BookVO?) onTapBook;
  Function(BookVO?) onTapSeeMore;
  BookItemDetailView({
    this.isThreeGrid = true,
    required this.book,
    required this.onTapBook,
    required this.onTapSeeMore,
    this.marginInGridView = 20,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: marginInGridView),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                child: GestureDetector(
                  onTap: () {
                    onTapBook(book);
                  },
                  child: Image.network(
                    book?.bookImage ?? "",
                    height: (isThreeGrid == false) ? 200 : 150,
                    width: (isThreeGrid == false)? 140: 90,
                    fit: BoxFit.fill,
                  ),
                ),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              Positioned(
                child: HeadPhoneForAudioBook(
                  book: book,
                ),
                left: 10,
                bottom: 20,
              ),
              Positioned(
                child: MoreViewForEachItem(
                  onPressedIcon: (book) {
                    onTapSeeMore(book);
                  },
                  book: book,
                ),
                right: 10,
                top: 10,
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(
            book?.title ?? "",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          SizedBox(height: 8),
          Text(
            book?.author ?? "",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class ReusableTextAndArrowView extends StatefulWidget {
  MainListBookSectionVO? bookSection;
  Function(MainListBookSectionVO?) onTapArrow;
  bool visibleArrow;
  double fontSize;
  FontWeight fontWeight;
  double width;
  String? title;

  ReusableTextAndArrowView({
    this.width = 280,
    this.bookSection,
    required this.onTapArrow,
    this.visibleArrow = false,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w400,
    this.title = "",
  });

  @override
  State<ReusableTextAndArrowView> createState() =>
      _ReusableTextAndArrowViewState();
}

class _ReusableTextAndArrowViewState extends State<ReusableTextAndArrowView> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: widget.width,
          child: Text(
            widget.bookSection?.listName ?? widget.title ?? "",
            style: TextStyle(
              fontWeight: widget.fontWeight,
              fontSize: widget.fontSize,
            ),
          ),
        ),
        Visibility(
          visible: widget.visibleArrow,
          child: GestureDetector(
            onTap: () {
              widget.onTapArrow(widget.bookSection);
            },
            child: Icon(
              Icons.arrow_forward_ios,
              color: Colors.black54,
            ),
          ),
        ),
      ],
    );
  }
}

class CurrentlyReadingBookListView extends StatelessWidget {
  const CurrentlyReadingBookListView({
    Key? key,
    required this.stillReadingBooks,
    required this.onPressedIcon,
  }) : super(key: key);
  final List<BookVO?>? stillReadingBooks;
  final Function(BookVO?) onPressedIcon;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        enableInfiniteScroll: false,
        onPageChanged: (index, reason) {},
        aspectRatio: 16 / 9,
        viewportFraction: 0.6,
        enlargeCenterPage: true,
        enlargeStrategy: CenterPageEnlargeStrategy.scale,
      ),
      items: stillReadingBooks?.map((currentBook) {
        return Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                boxShadow: [
                  BoxShadow(
                    spreadRadius: 1,
                    color: Colors.black54,
                    offset: Offset(0, 5),
                    blurRadius: 20,
                    blurStyle: BlurStyle.normal,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
                child: Image.network(
                  currentBook?.bookImage ?? "",
                  fit: BoxFit.fill,
                  width: 140,
                ),
              ),
            ),
            Positioned(
              child: HeadPhoneForAudioBook(
                book: currentBook,
              ),
              left: 10,
              bottom: 20,
            ),
            Positioned(
              child: MoreViewForEachItem(
                onPressedIcon: (book) {
                  onPressedIcon(book);
                },
                book: currentBook,
              ),
              right: 10,
              top: 10,
            ),
            Positioned(
              child: DownloadButtonView(),
              right: 10,
              bottom: 20,
            ),
          ],
        );
      }).toList(),
    );
  }
}

class HeadPhoneForAudioBook extends StatelessWidget {
  HeadPhoneForAudioBook({
    Key? key,
    required this.book,
  }) : super(key: key);

  final BookVO? book;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: true,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
            color: Color.fromRGBO(62, 64, 66, 50),
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: Icon(
            Icons.headphones,
            color: Colors.white,
            size: 18,
          ),
        ),
      ),
    );
  }
}

class DownloadButtonView extends StatelessWidget {
  const DownloadButtonView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          color: Color.fromRGBO(62, 64, 66, 50),
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        child: Icon(
          Icons.download,
          color: Colors.white,
          size: 18,
        ),
      ),
    );
  }
}

class MoreViewForEachItem extends StatelessWidget {
  BookVO? book;
  Function(BookVO?) onPressedIcon;
  Color color;
  double margin;
  MoreViewForEachItem({
    this.margin = 10,
    this.book,
    required this.onPressedIcon,
    this.color = Colors.white,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressedIcon(book);
      },
      child: Icon(
        Icons.more_horiz,
        color: color,
        size: 26,
      ),
    );
  }
}

class ChoosingTabsView extends StatefulWidget {
  Function(int?) callBackTab;
  String? tabOne;
  String? tabTwo;
  ChoosingTabsView({
    required this.callBackTab,
    this.tabOne,
    this.tabTwo,
  });
  @override
  State<ChoosingTabsView> createState() => _ChoosingTabsViewState();
}

class _ChoosingTabsViewState extends State<ChoosingTabsView> {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      onTap: (tab) {
        setState(() {
          widget.callBackTab(tab);
        });
      },
      labelColor: Colors.blue,
      unselectedLabelColor: Colors.grey,
      indicatorSize: TabBarIndicatorSize.label,
      indicatorColor: Colors.blue,
      tabs: [
        Tab(
          text: widget.tabOne,
        ),
        Tab(
          text: widget.tabTwo,
        ),
      ],
    );
  }
}

class AppBarCustomDesignView extends StatelessWidget {
  String imageUrl;
  AppBarCustomDesignView({required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: EdgeInsets.only(
            bottom: 6,
          ),
          height: MediaQuery.of(context).size.height / 15,
          width: MediaQuery.of(context).size.width / 1.1,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.black12,
              width: 1.0,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 2),
              ),
            ],
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 30,
              ),
              GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => HomeSearchPage(),
                  //   ),
                  // );
                },
                child: Icon(
                  Icons.search,
                  size: 20,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 20,
              ),
              Container(
                margin: EdgeInsets.only(
                  bottom: 5,
                ),
                height: MediaQuery.of(context).size.height / 17,
                width: MediaQuery.of(context).size.width / 2.6,
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: InputBorder.none,
                    hintText: SEARCH_PLAY_BOOKS,
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 4,
              ),
              Container(
                padding: EdgeInsets.all(
                  2,
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.fromBorderSide(
                    BorderSide(color: Colors.red, width: 2.0),
                  ),
                ),
                child: CircleAvatar(
                  radius: 15,
                  backgroundImage: NetworkImage(
                    imageUrl,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
