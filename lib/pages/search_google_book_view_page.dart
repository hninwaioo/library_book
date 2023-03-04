import 'package:flutter/material.dart';
import 'package:library_app/blocs/provider_search_google_book_bloc.dart';
import 'package:library_app/resources/colors.dart';
import 'package:library_app/widgets/typical_text.dart';
import 'package:provider/provider.dart';
import '../data/vos/book_vo.dart';
import '../resources/dimens.dart';
import '../widgets/bottom_sheet_book_image_view.dart';
import 'book_detail_view_page.dart';
import 'books_view_page.dart';

class SearchGoogleBookViewPage extends StatefulWidget {
  const SearchGoogleBookViewPage({Key? key}) : super(key: key);

  @override
  State<SearchGoogleBookViewPage> createState() => _SearchGoogleBookViewPageState();
}

class _SearchGoogleBookViewPageState extends State<SearchGoogleBookViewPage> {

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

  bool _seeAction = false;
  String bookName = "";
  final _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProviderSearchGoogleBookBloc(bookName),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          leading: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: PRIMARY_HINT_COLOR,
            ),
          ),
          centerTitle: true,
          title: Selector<ProviderSearchGoogleBookBloc,List<BookVO>>(
            selector: (context, bloc) => bloc.bookList ?? [],
            builder: (context, shelves, child) => TextField(
              controller: _textController,
              onSubmitted: (text) {
                setState(() {
                  _seeAction = true;
                  debugPrint(_textController.text);
                  ProviderSearchGoogleBookBloc bloc =
                      Provider.of<ProviderSearchGoogleBookBloc>(context,
                          listen: false);
                  bloc.searchBook(_textController.text);
                });
              },
              decoration: InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.white70,
                  hintText: "Search Play Books",
                  hintStyle: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                      fontSize: TEXT_REGULAR)),
            ),
          ),
          actions: [
            Visibility(
              visible: _seeAction,
              child: Padding(
                padding: const EdgeInsets.only(right: MARGIN_MEDIUM_2),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      TextEditingController().clear();
                      _seeAction = false;
                      _textController.clear();
                    });
                  },
                  child: Icon(
                    Icons.close,
                    color: PRIMARY_HINT_COLOR,)
                ),
              ),
            )
          ],
        ),
        body: Visibility(
          visible: _seeAction,
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BookTypeGenreSectionView(
                      genreList: genreList,
                      onTapGenres: (genreId) {
                        print("GenreId==>${genreId}");
                        _getEbooksOrAudioBook(genreId);
                      }
                  ),
                  Selector<ProviderSearchGoogleBookBloc,List<BookVO>>(
                    selector: (context, bloc) => bloc.bookList ?? [],
                    builder: (context, books, child) =>  BookResultSectionView(books,
                        chooseEbookORAudioBook??"", (book) => _navigateToBookDetailPage(context,book)),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> _navigateToBookDetailPage(BuildContext context,BookVO book) =>
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => BookDetailViewPage(
        bookVO: book,
      )));
}

class BookResultSectionView extends StatelessWidget {
  final List<BookVO> bookList;
  final String genreType;
  final Function(BookVO) onTapBook;
  BookResultSectionView(this.bookList,this.genreType, this.onTapBook);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: MARGIN_MEDIUM_3),
      child: Column(
        children: [
          TypicalText("Results from Google Play", Colors.black, TEXT_REGULAR_2x,isFontWeight: true,),
          (genreType == "EBOOK")
              ?
          SearchResultBookView(
            bookType: "EBook",
                  onTapBook: (book){
                    onTapBook(book);
                  },
              books: bookList
          )
              :
          SearchResultBookView(
              bookType: "AudioBook",
              onTapBook: (book){
                onTapBook(book);
              },
              books: bookList
          )
        ],
      ),
    );
  }
}

class SearchResultBookView extends StatefulWidget {

  String bookType;
  final Function(BookVO) onTapBook;
  final bool isLibrary;
  final List<BookVO> books;
  SearchResultBookView({required this.bookType, required this.onTapBook, required this.books, this.isLibrary=false});

  @override
  State<SearchResultBookView> createState() => _SearchResultBookViewState();
}

class _SearchResultBookViewState extends State<SearchResultBookView> {
  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2,vertical: MARGIN_MEDIUM_3),
      child: ListView.builder(
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemCount: widget.books.length,
          itemBuilder: (BuildContext context,int index){
            return GestureDetector(
              onTap: () {
                widget.onTapBook(widget.books[index]);
              },
              child: Column(
                children: [
                  BottomSheetBookImageView(
                    mBookImage: widget.books[index].bookImage ?? "",
                    // "https://m.media-amazon.com/images/I/51EkeX9IfCL._SX323_BO1,204,203,200_.jpg",
                    bookTitle: widget.books[index].title ?? "",
                    authorName: "${widget.books[index].author} . ${widget.bookType}",
                  ),
                  SizedBox(height: 30,)
                ],
              ),
            );
          }),
    );
  }
}