import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:library_app/pages/books_type_list_detail_view_page.dart';
import '../blocs/provider_home_bloc.dart';
import '../data/vos/book_vo.dart';
import '../data/vos/main_list_vo.dart';
import '../persistence/add_data/add_book_to_library.dart';
import '../persistence/add_data/selected_book.dart';
import '../resources/colors.dart';
import '../resources/dimens.dart';
import '../resources/strings.dart';
import '../view_items/books_list_view_item.dart';
import '../widgets/book_type_list_view.dart';
import 'package:provider/provider.dart';

import 'book_detail_view_page.dart';

//5c86AggYSPy1M3S0qxcdig1RMa0Sn97r
class BooksViewPage extends StatefulWidget {
  @override
  State<BooksViewPage> createState() => _BooksViewPageState();
}

class _BooksViewPageState extends State<BooksViewPage> {
  get prefixIcon => null;

  List<String> genreList = [
    "Ebooks",
    "Audiobooks",
  ];

  String? chooseEbookORAudioBook = "EBOOK";
  bool _audioVisible = false;

  @override
  void initState() {
    super.initState();
    chooseEbookORAudioBook = "EBOOK";
    _audioVisible = false;

  }

  void _getEbooksOrAudioBook(int index) {

    if(index == 0){
      chooseEbookORAudioBook = "EBOOK";
      _audioVisible = false;

    }else{
      chooseEbookORAudioBook = "AUDIOBOOK";
      _audioVisible = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProviderHomeBloc(),

      child: Scaffold(
          // backgroundColor: PRIMARY_COLOR,
          body: SingleChildScrollView(
               child:Column(
                children: [
                  SizedBox(height: MARGIN_MEDIUM_2,),

                  Selector<ProviderHomeBloc,List<BookVO>?>(
                    selector: (context,bloc) => bloc.mBookListFromDatabase,
                    builder: (context, booksList, child) =>
                        BannerBooksSectionView(
                          bannerList: booksList?.map((e) => e.bookImage).toList()??[],
                        ),
                  ),

                  SizedBox(height: MARGIN_SMALL,),

                  BookTypeGenreSectionView(
                      genreList: genreList,
                      onTapGenres: (genreId) {
                        print("GenreId==>${genreId}");
                          _getEbooksOrAudioBook(genreId);
                        }
                    ),

                  Selector<ProviderHomeBloc,List<MainListVO>?>(
                    selector: (context,bloc) => bloc.mMainList,
                    builder: (context, mainListBooks, child) =>
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: mainListBooks?.length,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return
                                TitleAndBooksListSectionView(
                                mainListVO: mainListBooks?[index],
                                onTapBooksList: (){
                                  _navigateToBooksTypeListDetailScreen(
                                      context,
                                      mainListBooks?[index].listName??"",
                                      mainListBooks?[index].books??[]
                                  );
                                },
                              );
                            }),


                    // ListView.separated(
                    //   shrinkWrap: true,
                    //   itemCount: mainListBooks?.length??0,
                    //   physics: NeverScrollableScrollPhysics(),
                    //   separatorBuilder: (_, __) => const Divider(),
                    //   itemBuilder: (context, int index) {
                    //          return TitleAndBooksListSectionView(
                    //            mainListVO: mainListBooks?[index],
                    //            onTapBooksList: (){
                    //              _navigateToBooksTypeListDetailScreen(
                    //                  context,
                    //                  mainListBooks?[index].listName??"",
                    //                  mainListBooks?[index].books??[]
                    //              );
                    //            },
                    //          );
                    //   },
                    // ),
                    ),
                ],
              ),
          ),
          ),

      );
  }

  Future<dynamic> _navigateToBooksTypeListDetailScreen(BuildContext context,
      String listName,
      List<BookVO> bookList
      ) {
    return Navigator.push(context, MaterialPageRoute(
        builder: (context) => BooksTypeListDetailViewPage(
          listName: listName,
          bookList: bookList,
        )
    )
    );
  }
}


class SearchBooksSectionView extends StatelessWidget {
  const SearchBooksSectionView({
    Key? key,
    required this.prefixIcon,
  }) : super(key: key);

  final  prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
        child:
        Container(
          height: 45,
          width: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.black54
            // gradient: LinearGradient(
            //     begin: Alignment.centerLeft,
            //     end: Alignment.centerRight,
            //     colors: [
            //       Color.fromRGBO(22, 22, 22, 1.0),
            //       Color.fromRGBO(21, 21, 21, 1.0)
            //     ]
            // )
          ),

          child: Row(
            children: [
              TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  // prefixIcon: prefixIcon??Icon(Icons.search_outlined,color: TEXT_PRIMARY_COLOR,),
                  hintText: SEARCH_PLAY_BOOKS,
                  hintStyle: TextStyle(
                      leadingDistribution: TextLeadingDistribution.even,
                      color: HINT_TEXT_COLOR
                  ),
                ),
                textAlign: TextAlign.start,
              ),
            ],
          )
        )
    );
  }
}

class BannerBooksSectionView extends StatefulWidget {

  List<String?> bannerList;
  BannerBooksSectionView({required this.bannerList});

  @override
  State<BannerBooksSectionView> createState() => _BannerBooksSectionViewState();
}

class _BannerBooksSectionViewState extends State<BannerBooksSectionView> {
  var _position = 0.0;

  @override
  Widget build(BuildContext context) {
    return  Container(
      child:
      Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM),

            height: MediaQuery.of(context).size.height/3.5,
            child:

            // PageView(
            //     pageSnapping: true,
            //     dragStartBehavior : DragStartBehavior.start,
            //     clipBehavior : Clip.antiAlias,
            //     onPageChanged: (page){
            //       setState((){
            //         _position = page.toDouble();
            //       });
            //     },
            //     children: widget.bannerList.map((bannerBook) => BannerBookImageView(
            //       // bannerVO: bannerMovies,
            //       mImageUrl: bannerBook,
            //     ))
            //         .toList() ?? []
            // ),

            CarouselSlider(
              options: CarouselOptions(
                height: 450.0,
                enableInfiniteScroll: false,
                viewportFraction: 0.4,
                enlargeCenterPage: true,
                initialPage: 0,
                disableCenter: false,
                aspectRatio: 2.1,
              ),
              items: widget.bannerList.map((item) {
                return Builder(
                  builder: (BuildContext context) {
                    return
                      Column(
                        // width: MediaQuery.of(context).size.width,
                        // margin: EdgeInsets.symmetric(horizontal: 5.0),
                        // decoration: BoxDecoration(
                        //     color: Colors.amber
                        // ),
                        children: [ BannerBookImageView(
                            mImageUrl: item,
                          )
                              // .toList() ?? []
                        ]
                    );
                  },
                );
              }).toList(),
            )
          ),
          SizedBox(height: MARGIN_MEDIUM_2,),
        ],
      ),
    );
  }
}

class BannerBookImageView extends StatelessWidget {

  String? mImageUrl;
  BannerBookImageView({required this.mImageUrl});

  @override
  Widget build(BuildContext context) {
    return
      ClipRRect(

          borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10),bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10)),
          child:  Image.network(
            // "https://d1sag4ddilekf6.azureedge.net/compressed/merchants/9-CY32EB2ETB43WA/hero/1f901883836148bf8a9150277b6e7967_1658064288904088500.jpeg",
            mImageUrl??"",
            height: 180,
            width: 150,
            fit:BoxFit.cover,
          )
      );
  }
}

class BooksTypeGenreSectionView extends StatelessWidget {
  BooksTypeGenreSectionView({
    required this.genreList,
    required this.onTapGenre
  });

  final List<String?> genreList;
  // final Function onTapMovie;
  final Function (int) onTapGenre;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: genreList.length,
      child: TabBar(
        isScrollable: true,
        indicatorColor: PLAY_BUTTON_COLOR,
        unselectedLabelColor: HOME_SCREEN_LIST_TITLE_COLOR,
        onTap: (index){
          this.onTapGenre(index);
        },
        tabs: genreList.map(
                (genre) => Tab(
              child: Text(genre??""),
            )
        ).toList(),
      ),
    );
  }
}

class BookTypeGenreSectionView extends StatelessWidget {
  BookTypeGenreSectionView(
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

class TitleAndBooksListSectionView extends StatelessWidget {

  MainListVO? mainListVO;
  Function onTapBooksList;
  TitleAndBooksListSectionView({required this.mainListVO,required this.onTapBooksList});

  @override
  Widget build(BuildContext context) {
    return
       Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // GestureDetector(
          //   onTap: () {
          //     // _navigateToBooksTypeListDetailScreen(context,mainListBooks![index]);
          //     onTapBooksList();
          //   },
          //   child: Container(
          //       margin: EdgeInsets.symmetric(
          //           horizontal: MARGIN_MEDIUM_LARGE,
          //           vertical: MARGIN_MEDIUM_2),
          //       child: BookTypeListView(
          //         bookTypes: mainListVO?.listName??"",
          //       )
          //   ),
          // ),
          // ListView.builder(
          //     itemCount: 1,
          //     // mainListVO?.books?.length,
          //     physics: NeverScrollableScrollPhysics(),
          //     shrinkWrap: true,
          //     itemBuilder: (BuildContext context, int index) {
          //       return BooksListHorizontalSectionView(
          //         booksList: mainListVO?.books??[],
          //       );
          //     }),

          ListView.separated(
            shrinkWrap: true,
            itemCount: 1,
            physics: NeverScrollableScrollPhysics(),
            separatorBuilder: (_, __) => const Divider(),
            itemBuilder: (context, int index) {
                    return BooksListHorizontalSectionView(
                      booksList: mainListVO?.books??[],
                    );
            },
          ),
        ],
    );
  }
}


class BooksListHorizontalSectionView extends StatelessWidget {

  List<BookVO> booksList;
  BooksListHorizontalSectionView({required this.booksList});

  // var openDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return
        Container(
            margin: EdgeInsets.only(left: MARGIN_MEDIUM_2),
            height: MOVIE_LIST_HEIGHT,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(right: MARGIN_MEDIUM_LARGE),
                itemCount: booksList.length,
                itemBuilder:(BuildContext context, int index){
                  return BooksListViewItem(
                    dataBook: booksList[index],
                    onTapBook: (book){
                      SelectedBook(book);
                      var addBookToLibrary = AddBookToLibrary();
                      addBookToLibrary.addBook(SelectedBook(book));
                      var bloc = Provider.of<ProviderHomeBloc>(context,
                          listen: false);
                      bloc.saveBooksToLibrary(addBookToLibrary.bookListInLibrary);

                      _navigateToBooksDetailScreen(
                        context,
                        booksList[index]

                      // }
                        // booksList[index].listName??"",
                        // booksList[index].title??"",
                        // booksList[index].openedDate??""


                    );
                  },
                );
              }
          )
    );
  }

  // SelectedBook(BookVO bookVO){
  //   bookVO.openedDate = openDate.toString();
  //   bookVO.isAddedLibrary = true;
  //   return bookVO;
  // }

  Future<dynamic> _navigateToBooksDetailScreen(
      BuildContext context,
      // String listName,String bookName, String openedDate
      BookVO? bookVO
      ) =>
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BookDetailViewPage(
                bookVO: bookVO,
                // listName: listName,
                // title: bookName,
                // openedDate: openedDate,
              )
          )
      );
}
