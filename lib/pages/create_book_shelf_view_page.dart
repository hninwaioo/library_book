import 'package:flutter/material.dart';
import 'package:library_app/persistence/add_data/create_new_shelf.dart';
import 'package:library_app/resources/dimens.dart';
import 'package:library_app/widgets/typical_text.dart';
import '../blocs/provider_library_bloc.dart';
import '../data/vos/book_vo.dart';
import '../data/vos/shelf_vo.dart';
import '../resources/colors.dart';
import 'package:provider/provider.dart';

class CreateBookShelfViewPage extends StatefulWidget {
  const CreateBookShelfViewPage({Key? key}) : super(key: key);

  @override
  State<CreateBookShelfViewPage> createState() => _CreateBookShelfViewPageState();
}

class _CreateBookShelfViewPageState extends State<CreateBookShelfViewPage> {
  TextEditingController textController = TextEditingController();
  String _createShelfName = "";

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProviderLibraryBloc(_createShelfName),

      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white54,
          elevation: 0,
          leading: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios_new_sharp,color: HINT_TEXT_COLOR,size: 32,)
          ),
          centerTitle: true,

          title: TypicalText("Create shelf",Colors.black,TEXT_REGULAR_2x,isFontWeight: false,)

        ),
        body: Container(
          child: Column(
            children: [

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),

                child: Selector<ProviderLibraryBloc, List<BookVO>?>(
                  selector: (context, bloc) => bloc.bookListInLibrary,
                  builder: (context, books, widget) =>
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
                        child: TextFormField(
                          maxLength: 50,
                          decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Shelf name',
                              labelStyle: TextStyle(
                                  color: HINT_TEXT_COLOR,
                                  fontSize: TEXT_REGULAR_2x,
                                  fontWeight: FontWeight.w700
                              )
                          ),

                          onFieldSubmitted: (value) {
                            setState(() {
                              _createShelfName = value;
                              if (_createShelfName != "") {
                                List<BookVO>? booksInShelf = [];
                                ShelfVO shelf =
                                ShelfVO(booksInShelf, _createShelfName, false);
                                CreateNewShelf createNewShelf = CreateNewShelf();
                                createNewShelf.saveShelf(shelf);
                                var bloc = Provider.of<ProviderLibraryBloc>(context,
                                    listen: false);
                                bloc.saveAllShelves(createNewShelf.shelfList);
                                Navigator.pop(context);
                              }
                            });
                            },
                        ),
                      ),
                ),
              ),
              SizedBox(height: MARGIN_MEDIUM_2,),
              Divider(color: HINT_TEXT_COLOR,height: 0.05,)
            ],
          ),
        ),
      ),
    );
  }
}
