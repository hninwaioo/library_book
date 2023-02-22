import 'package:flutter/material.dart';
import 'package:library_app/widgets/typical_text.dart';
import 'package:provider/provider.dart';
import '../blocs/provider_shelf_bloc.dart';
import '../data/vos/book_vo.dart';
import '../data/vos/shelf_vo.dart';
import '../resources/dimens.dart';
import '../view_items/shelves_list_item_view.dart';

class BookAddIntoShelfViewPage extends StatefulWidget {
  BookVO book;
  BookAddIntoShelfViewPage({required this.book});

  @override
  State<BookAddIntoShelfViewPage> createState() => _BookAddIntoShelfViewPageState();
}

class _BookAddIntoShelfViewPageState extends State<BookAddIntoShelfViewPage> {

  late ProviderShelfBloc shelfBloc;
  @override
  void initState() {
    shelfBloc = ProviderShelfBloc();
    super.initState();
  }

  @override
  void dispose() {
    shelfBloc.isDispose = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProviderShelfBloc>.value(
      value: shelfBloc,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: TypicalText("Add to Shelves",Colors.black,TEXT_REGULAR_2x,isFontWeight: true,),
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.close,
                size: 30,
                color: Colors.black,
              ),
            )
          ],
        ),

        body: Selector<ProviderShelfBloc, List<ShelfVO>?>(
          selector: (context, bloc) => bloc.shelfList,
          builder: (context, shelflist, child) {
            return
              Selector<ProviderShelfBloc, List<BookVO>?>(
                selector: (context, bloc) => bloc.bookListInShelf,
                builder: (context, booksInShelf, child) {
                  var bloc = Provider.of<ProviderShelfBloc>(context, listen: false);
                  BookVO? selectedBook = booksInShelf?.firstWhere(
                          (element) => element.title == widget.book.title);

                return CheckBoxOrArrowWithBookImageAndNameView(
                  bloc: bloc,
                  onTapArrow: (e) {},
                  visibleArrow: false,
                  visibleCheckBox: true,
                  book: selectedBook,
                  bookShelveList: shelflist,
                );
                  // ShelvesListSectionView(shelfList: shelflist,);
              },
            );
          },
        ),
      ),
    );
  }
}
