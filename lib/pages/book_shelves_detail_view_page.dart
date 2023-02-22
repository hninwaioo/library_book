import 'package:flutter/material.dart';
import 'package:library_app/blocs/provider_shelf_detail_bloc.dart';
import 'package:library_app/data/vos/book_vo.dart';
import 'package:library_app/data/vos/main_list_vo.dart';
import 'package:library_app/data/vos/shelf_vo.dart';
import 'package:library_app/persistence/add_data/add_book_to_library.dart';
import 'package:library_app/persistence/add_data/create_new_shelf.dart';
import 'package:library_app/widgets/sorting_books_list_view.dart';
import 'package:library_app/widgets/typical_text.dart';
import '../resources/colors.dart';
import '../resources/dimens.dart';
import '../widgets/bottom_sheet_for_shelves_view.dart';
import '../widgets/sort_books_list_view.dart';
import 'package:provider/provider.dart';

class BookShelvesDetailViewPage extends StatelessWidget {
  const BookShelvesDetailViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: PRIMARY_COLOR,
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
            child: Icon(Icons.arrow_back_ios_sharp,color: HINT_TEXT_COLOR,)
        ),

        actions: [
          GestureDetector(
            onTap: (){
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                        height: 300,
                        child: BottomSheetForShelvesView()
                    );
                  }
              );
            },
              child: Icon(Icons.keyboard_control_rounded,color: HINT_TEXT_COLOR,size: 30,)
          ),
          SizedBox(width: MARGIN_MEDIUM_2,)
        ],

        // actions: [
        //
        //   GestureDetector(
        //     onTap: (){
        //       showModalBottomSheet(
        //           context: context,
        //           builder: (BuildContext context) {
        //             return Container(
        //                 height: 300,
        //                 child: BottomSheetForShelvesView()
        //             );
        //           }
        //       );
        //     },
        //       child: Padding(
        //         padding: EdgeInsets.all(20),
        //           child: Icon(Icons.keyboard_control_rounded,color: HINT_TEXT_COLOR,size: 30,))
        //   ),
        //   SizedBox(width: MARGIN_MEDIUM_2,)
        // ],

      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MARGIN_MEDIUM_2,),

            Container(
              margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2,vertical: MARGIN_MEDIUM_2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TypicalText("10 Design Books", Colors.black, TEXT_REGULAR_2x,isFontWeight: true,),
                  SizedBox(height: MARGIN_MEDIUM,),
                  TypicalText("3 books", HINT_TEXT_COLOR, TEXT_REGULAR),
                ],
              ),
            ),

            SizedBox(height: MARGIN_MEDIUM_2,),
            Divider(color: HINT_TEXT_COLOR,height: 0.1,),

            Container(
              width: MediaQuery.of(context).size.width/1.8,
              padding: EdgeInsets.all(MARGIN_MEDIUM_2),
              margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2,vertical: MARGIN_MEDIUM_LARGE),
              decoration: BoxDecoration(
                  border: Border.all(color: HINT_TEXT_COLOR),
                  borderRadius: BorderRadius.circular(25.0)
              ),
              child: IntrinsicHeight(
                
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TypicalText("Not started", HINT_TEXT_COLOR, TEXT_REGULAR),
                    VerticalDivider(
                      color: HINT_TEXT_COLOR,
                      thickness: 1,
                    ),
                    TypicalText("In progress", HINT_TEXT_COLOR, TEXT_REGULAR)
                  ],
                ),
              ),
            ),

            // SortBooksListView()

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SortByRecentBookSectionView(),
                SizedBox(height: MARGIN_MEDIUM_2,),

                Container(
                  child: ListView(
                    physics: NeverScrollableScrollPhysics(), // <– this will disable scroll.
                    shrinkWrap: true,
                    children: [
                      // ChooseVerticalListBookSectionView()
                    ],
                  ),
                ),
                SizedBox(height: MARGIN_MEDIUM_2,),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class BookShelvesDetailPage extends StatefulWidget {
  String? nameToRemoveShelf;
  ShelfVO? shelf;
  BookShelvesDetailPage({required this.shelf, this.nameToRemoveShelf});
  @override
  State<BookShelvesDetailPage> createState() => _BookShelvesDetailPageState();
}

class _BookShelvesDetailPageState extends State<BookShelvesDetailPage> {
  TextEditingController textController = TextEditingController();
  bool visibleTextField = false;
  bool visibleTitleView = true;

  /// this is original
  late List<String?>? tabList;
  String? chosenTab;
  bool? crossButtonVisible = false;
  bool? chosenTabVisible = false;
  bool isSelected = false;
  int? groupValueForView = 1;
  int? groupValueForSort = 1;
  List<BookVO?>? userBooks;

  late ProviderShelfDetailBloc myBloc;

  @override
  void initState() {
    myBloc = ProviderShelfDetailBloc(widget.nameToRemoveShelf??"");
    super.initState();
  }
  @override
  void dispose() {
    myBloc.isDispose = true;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProviderShelfDetailBloc>.value(
      value: myBloc,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: GestureDetector(
            onTap: ()  {
              Navigator.pop(context,true);
              //Navigator.push(context, MaterialPageRoute(builder: (context)=>LibraryPage()));
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black54,
            ),
          ),
          actions: [
            Selector<ProviderShelfDetailBloc, ShelfVO?>(
              selector: (context, bloc) => bloc.shelf,
              builder: (context, shelfFromBloc, child) {
                var bloc = Provider.of<ProviderShelfDetailBloc>(context, listen: false);
                return GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        constraints: BoxConstraints(maxHeight: 200),
                        context: context,
                        builder: (context) {
                          return ChangeNotifierProvider.value(
                            value: bloc,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Text(
                                    widget.shelf?.shelfName ?? "",
                                    style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                                // LineSeparatorView(),
                                SizedBox(height: 10),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 30, bottom: 16),
                                  child: FunctionsOfShowModalOne(
                                    onTap: () {
                                      setState(() {
                                        Navigator.pop(context);
                                        visibleTextField = true;
                                        visibleTitleView = false;
                                      });
                                    },
                                    icon: Icons.drive_file_rename_outline,
                                    text: "Rename shelf",
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 30, bottom: 16),
                                  child: FunctionsOfShowModalOne(
                                    onTap: () {
                                      setState(() {
                                        bloc.deleteShelf(
                                            widget.shelf?.shelfName);
                                        Navigator.pop(context);
                                        Navigator.pop(context);
                                      });
                                    },
                                    icon: Icons.delete_sharp,
                                    text: "Delete shelf",
                                  ),
                                )
                              ],
                            ),
                          );
                        });
                  },
                  child: Container(
                    padding: EdgeInsets.only(right: 4),
                    child: Icon(
                      Icons.more_horiz,
                      color: Colors.black54,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
        body: Selector<ProviderShelfDetailBloc, ShelfVO?>(
          selector: (context, bloc) => bloc.shelf,
          builder: (context, shelfFromBloc, child) {
            if (groupValueForSort == 1) {
              widget.shelf?.shelfBooks?.sort((a, b) =>
                  b.openedDate.toString().compareTo(a.openedDate.toString()));
            } else if (groupValueForSort == 2) {
              widget.shelf?.shelfBooks?.sort((a, b) => a.title
                  .toString()
                  .toLowerCase()
                  .compareTo(b.title.toString().toLowerCase()));
            } else {
              widget.shelf?.shelfBooks?.sort((a, b) => a.author
                  .toString()
                  .toLowerCase()
                  .compareTo(b.author.toString().toLowerCase()));
            }

            if (isSelected == false) {
              userBooks = widget.shelf?.shelfBooks;
            } else {
              userBooks = widget.shelf?.shelfBooks
                  ?.where((element) => element.listName == chosenTab)
                  .toList();
            }

            tabList = widget.shelf?.shelfBooks
                ?.map((book) {
              return book.listName;
            })
                .toList()
                .toSet()
                .toList();

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 26),
                    child: Stack(
                      children: [
                        Visibility(
                          visible: visibleTitleView,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ReusableTextAndArrowView(
                                width: 270,
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                visibleArrow: false,
                                title: widget.shelf?.shelfName,
                                onTapArrow: (title) {},
                              ),
                              SizedBox(height: 4),
                              Text(
                                "${widget.shelf?.shelfBooks?.length.toString()} books",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Visibility(
                            visible: visibleTextField,
                            child: TextField(
                              onSubmitted: (text) {
                                setState(() {
                                  visibleTitleView = true;
                                  visibleTextField = false;
                                });
                                if (textController.text != "") {
                                  var bloc = Provider.of<ProviderShelfDetailBloc>(
                                      context,
                                      listen: false);
                                  CreateNewShelf shelfController =
                                  CreateNewShelf();
                                  widget.shelf?.shelfName = textController.text;
                                  shelfController
                                      .saveShelf(widget.shelf);
                                  bloc.saveAllShelves(
                                      shelfController.shelfList);
                                  bloc.deleteShelf(widget.nameToRemoveShelf);
                                }
                              },
                              controller: textController,
                              decoration: InputDecoration(
                                hintText: "Shelf name",
                                helperStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(height: 6),
                  // LineSeparatorView(),
                  SizedBox(height: 20),
                  SortingBookListView(
                    bookList: userBooks,
                    addToShelf: (book) {},
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
                  ),

                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class YourShelfOverlapBookView extends StatelessWidget {
  String imageUrl;
  YourShelfOverlapBookView({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 90,
      child: ClipRRect(
        child: Image.network(
          imageUrl,
          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(8),
          bottomLeft: Radius.circular(8),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
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