import 'package:flutter/material.dart';
import 'package:library_app/data/vos/book_vo.dart';
import 'package:library_app/resources/colors.dart';
import 'package:library_app/resources/dimens.dart';
import 'package:library_app/widgets/typical_text.dart';
import '../blocs/provider_book_type_list_bloc.dart';
import '../blocs/provider_home_bloc.dart';
import '../persistence/add_data/add_book_to_library.dart';
import '../persistence/add_data/selected_book.dart';
import 'book_detail_view_page.dart';
import '../view_items/books_list_view_item.dart';
import '../data/vos/main_list_vo.dart';
import 'package:provider/provider.dart';

class BooksTypeListDetailViewPage extends StatefulWidget {

  final String listName;
  final List<BookVO> bookList;

  BooksTypeListDetailViewPage({
    required this.listName,
    required this.bookList
  });

  @override
  State<BooksTypeListDetailViewPage> createState() => _BooksTypeListDetailViewPageState();
}

class _BooksTypeListDetailViewPageState extends State<BooksTypeListDetailViewPage> {
  // @override
  // void dispose() {
  //   ProviderBookTypeListBloc bloc=Provider.of<ProviderBookTypeListBloc>(context,listen: false);
  //   bloc.isDispose=true;
  //   super.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    return
      ChangeNotifierProvider(
      create: (context) => ProviderBookTypeListBloc(widget.listName),

      child:
      Scaffold(
        appBar: AppBar(
          backgroundColor: PRIMARY_COLOR,
          title: TypicalText(widget.listName??"",HINT_TEXT_COLOR,TEXT_REGULAR,isFontWeight: true),
          leading: GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
              child: Icon(
                Icons.arrow_back_ios_sharp,size: 30,color: HINT_TEXT_COLOR,)
          ),
        ),

        body: Selector<ProviderBookTypeListBloc, List<BookVO>?>(
          selector: (context, bloc) => bloc.books,
          builder: (context, bookList, child) => SingleChildScrollView(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: MARGIN_MEDIUM_2,),
                  // ListSectionView(bookList: bookList??[])
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2,vertical: MARGIN_MEDIUM_2),
                      child: ListView(
                        physics: NeverScrollableScrollPhysics(), // <– this will disable scroll.
                        shrinkWrap: true,
                        children: [
                          BooksListDetailSectionView(
                          bookList:widget.bookList,
                            onTapBook: (book){

                            debugPrint("CLICK=>BOOK");
                              SelectedBook(book);
                              var addBookToLibrary = AddBookToLibrary();
                              addBookToLibrary.addBook(SelectedBook(book));
                              var bloc = Provider.of<ProviderBookTypeListBloc>(context,
                                  listen: false);
                              bloc.saveBooksToLibrary(addBookToLibrary.bookListInLibrary);

                              _navigateToBooksDetailScreen(
                                  context,
                                  book
                              );
                            },
                            gridCount: 2,)
                        ],
                      )
                  )
                ],
              ),
           ),
          )
        )
        ),
      );

  }

  Future<dynamic> _navigateToBooksDetailScreen(
      BuildContext context,
      // String bookName, String openedDate
      BookVO? bookVO
      ) =>
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => BookDetailViewPage(
                bookVO: bookVO,
                // listName: widget.listName,
                // title: bookName,
                // openedDate: openedDate,
              )
          )
      );
}

// class ListSectionView extends StatefulWidget {
//   List<BookVO> bookList;
//   ListSectionView({required this.bookList});
//
//   @override
//   State<ListSectionView> createState() => _ListSectionViewState();
// }
//
// class _ListSectionViewState extends State<ListSectionView> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2,vertical: MARGIN_MEDIUM_2),
//         child: ListView(
//           physics: NeverScrollableScrollPhysics(), // <– this will disable scroll.
//           shrinkWrap: true,
//           children: [
//             BooksListDetailSectionView(
//               bookList:widget.bookList??[],
//               onTapBook: (book){
//
//                 debugPrint("CLICK=>BOOK");
//                 SelectedBook(book);
//                 var addBookToLibrary = AddBookToLibrary();
//                 addBookToLibrary.addBook(SelectedBook(book));
//                 var bloc = Provider.of<ProviderHomeBloc>(context,
//                     listen: false);
//                 bloc.saveBooksToLibrary(addBookToLibrary.bookListInLibrary);
//
//                 _navigateToBooksDetailScreen(
//                     context,
//                     book
//                 );
//               },
//               gridCount: 2,)
//           ],
//         )
//     );
//   }
//
//   Future<dynamic> _navigateToBooksDetailScreen(
//       BuildContext context,
//       // String bookName, String openedDate
//       BookVO? bookVO
//       ) =>
//       Navigator.push(
//           context,
//           MaterialPageRoute(
//               builder: (context) => BookDetailViewPage(
//                 bookVO: bookVO,
//                 // listName: widget.listName,
//                 // title: bookName,
//                 // openedDate: openedDate,
//               )
//           )
//       );
// }


class BooksListDetailSectionView extends StatelessWidget {

  // bool audioVisible;
  List<BookVO> bookList;
  Function (BookVO) onTapBook;
  int gridCount;
  BooksListDetailSectionView({
    required this.bookList,
    required this.onTapBook,
    required this.gridCount});
  @override
  Widget build(BuildContext context) {
    return Container(
        child: GridView.builder(

          physics: ScrollPhysics(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.65,
            crossAxisCount: gridCount,
            crossAxisSpacing: 15.0,
            mainAxisSpacing: 15.0,
          ),
          itemCount: bookList.length,
          // movieList.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: BooksListViewItem(
                // book: bookList[index],
                // onTapBook: (bookId){
                //   onTapBook(bookList[index]);
                // },
                onTapSeeMore: (book) {
                  onTapBook(bookList[index]);
                  },
                onTapBook: (book) {
                  onTapBook(bookList[index]);
                  },
                book: bookList[index],
              ),
            );
          },
        )
    );
  }
}
