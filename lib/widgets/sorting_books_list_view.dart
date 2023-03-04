import 'package:flutter/material.dart';
import 'package:library_app/widgets/multi_select_tab_bar_view_section.dart';
import '../data/vos/book_vo.dart';
import '../resources/colors.dart';
import '../resources/dimens.dart';
import 'bottom_sheet_book_image_view.dart';

class SortingBookListView extends StatelessWidget {

  List<BookVO?>? bookList;
  List<String?>? tabList;
  String? chosenTab;
  bool? crossButtonVisible = false;
  bool? chosenTabVisible = false;
  bool isSelected = false;
  int? groupValueForView = 1;
  Function(String? tab) onTabBookTypeChooser;
  Function onTapCrossButton;

  Function(int?) onTapSortingOne;
  Function(int?) onTapSortingTwo;
  Function(int?) onTapSortingThree;
  Function(int?) onTapChooseViewOne;
  Function(int?) onTapChooseViewTwo;
  Function(int?) onTapChooseViewThree;

  Function(BookVO?) addToShelf;

  SortingBookListView({
    required this.bookList,
    required this.addToShelf,
    required this.onTapChooseViewThree,
    required this.onTapChooseViewTwo,
    required this.onTapChooseViewOne,
    required this.onTapSortingThree,
    required this.onTapSortingTwo,
    required this.onTapSortingOne,
    required this.onTapCrossButton,
    required this.onTabBookTypeChooser,
    required this.tabList,
    required this.crossButtonVisible,
    required this.chosenTab,
    required this.isSelected,
    required this.chosenTabVisible,
    required this.groupValueForView,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// MultiSelect Tab Bar
        MultiSelectTabBarViewSection(
          chosenTabVisible: chosenTabVisible,
          crossButtonVisible: crossButtonVisible,
          chosenTab: chosenTab,
          tabList: tabList ?? [],
          onTab: (tab) {
            onTabBookTypeChooser(tab);
          },
          onTapCrossButton: () {
            onTapCrossButton();
          },
        ),
        SizedBox(height: 24),

        /// Sorting and Views Type
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: TwoSortingAndViewsTypeInLibrarySectionView(
            onTapSortOne: (e) {
              onTapSortingOne(e);
            },
            onTapSortTwo: (e) {
              onTapSortingTwo(e);
            },
            onTapSortThree: (e) {
              onTapSortingThree(e);
            },
            onTapViewOne: (e) {
              onTapChooseViewOne(e);
            },
            onTapViewTwo: (e) {
              onTapChooseViewTwo(e);
            },
            onTapViewThree: (e) {
              onTapChooseViewThree(e);
            },
          ),
        ),

        SizedBox(height: 20),

        /// Value For View
        (groupValueForView == 1)
            ?
        BooksVerticalListView(
          onTapBook: (book) {},
          onPressIcon: (book) {
            showModalBottomSheet(
                useRootNavigator: true,
                isScrollControlled: false,
                isDismissible: true,
                enableDrag: true,
                context: context,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                builder: (context) => ShowModalSheetForBookDetail(
                    addToShelf: () {
                      addToShelf(book);
                    },
                    visibleRemoveDownload: true,
                    visibleAboutThisBook: true,
                    visibleAddToShelves: true,
                    visibleAddToWishlist: true,
                    visibleDeleteFromLibrary: true,
                    book: book,
                    onPressedIcon: (book) {}));
          },
          visibleDownloadAndSeeMore: true,
          bookList: bookList,
        )
            :
        (groupValueForView == 2)
            ?
        BookListGridView(
          onTapSeeMore: (book) {
            showModalBottomSheet(
                useRootNavigator: true,
                isScrollControlled: false,
                isDismissible: true,
                enableDrag: true,
                context: context,
                builder: (context) => ShowModalSheetForBookDetail(
                    addToShelf: () {
                      addToShelf(book);
                    },
                    visibleRemoveDownload: true,
                    visibleAboutThisBook: true,
                    visibleAddToShelves: true,
                    visibleAddToWishlist: true,
                    visibleDeleteFromLibrary: true,
                    onPressedIcon: (book) {},
                    book: book));
          },
          bookList: bookList,
          onTapBook: (book) {},
          isThreeGrid: false,
        )
            :
        BookListGridView(
          onTapSeeMore: (book) {
            showModalBottomSheet(
                useRootNavigator: true,
                isScrollControlled: false,
                isDismissible: true,
                enableDrag: true,
                context: context,
                builder: (context) => ShowModalSheetForBookDetail(
                    addToShelf: () {
                      addToShelf(book);
                    },
                    visibleRemoveDownload: true,
                    visibleAboutThisBook: true,
                    visibleAddToShelves: true,
                    visibleAddToWishlist: true,
                    visibleDeleteFromLibrary: true,
                    onPressedIcon: (book) {},
                    book: book));
          },
          bookList: bookList,
          onTapBook: (book) {},
          isThreeGrid: true,
        ),
      ],
    );
  }
}

class TwoSortingAndViewsTypeInLibrarySectionView extends StatefulWidget {
  Function(int?) onTapViewOne;
  Function(int?) onTapViewTwo;
  Function(int?) onTapViewThree;
  Function(int?) onTapSortOne;
  Function(int?) onTapSortTwo;
  Function(int?) onTapSortThree;

  String viewTextOne;
  String viewTextTwo;
  String viewTextThree;
  String sortTextOne;
  String sortTextTwo;
  String sortTextThree;
  String viewHeading;
  String sortHeading;

  TwoSortingAndViewsTypeInLibrarySectionView({
    required this.onTapViewThree,
    required this.onTapViewTwo,
    required this.onTapViewOne,

    required this.onTapSortOne,
    required this.onTapSortThree,
    required this.onTapSortTwo,
    this.sortHeading = "Sort by",
    this.sortTextOne = "Recently opened",
    this.sortTextThree = "Author",
    this.sortTextTwo = "Title",

    this.viewHeading = "View as",
    this.viewTextOne = "List",
    this.viewTextThree = "Small grid",
    this.viewTextTwo = "Large grid",
  });

  @override
  State<TwoSortingAndViewsTypeInLibrarySectionView> createState() =>
      _TwoSortingAndViewsTypeInLibrarySectionViewState();
}

class _TwoSortingAndViewsTypeInLibrarySectionViewState
    extends State<TwoSortingAndViewsTypeInLibrarySectionView> {
  String? selectedSorting = "";

  int? groupValue = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => SortingBookListViewShowModal(
                textOne: widget.sortTextOne,
                textTwo: widget.sortTextTwo,
                textThree: widget.sortTextThree,
                heading: widget.sortHeading,

                /// e is already groupValue
                onTapViewOne: (e) {
                  setState(() {
                    widget.onTapSortOne(e);
                    groupValue = e;
                  });
                },
                onTapViewTwo: (e) {
                  setState(() {
                    widget.onTapSortTwo(e);
                    groupValue = e;
                  });
                },
                onTapViewThree: (e) {
                  setState(() {
                    widget.onTapSortThree(e);
                    groupValue = e;
                  });
                },
              ),
            );
          },
          child: Row(
            children: [
              Icon(
                Icons.sort_outlined,
                size: 24,
              ),
              SizedBox(width: 2),
              Text(
                "${widget.sortHeading}: ",
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                ),
              ),
              Text(
                (groupValue == 1)
                    ? widget.sortTextOne
                    : (groupValue == 2)
                    ? widget.sortTextTwo
                    : (groupValue == 3)
                    ? widget.sortTextThree
                    : "",
                style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
        Spacer(),
        GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => SortingBookListViewShowModal(
                textOne: widget.viewTextOne,
                textTwo: widget.viewTextTwo,
                textThree: widget.viewTextThree,
                heading: widget.viewHeading,

                /// e is already groupValue
                onTapViewThree: (e) {
                  widget.onTapViewOne(e);
                },
                onTapViewTwo: (e) {
                  widget.onTapViewTwo(e);
                },
                onTapViewOne: (e) {
                  widget.onTapViewThree(e);
                },
              ),
            );
          },
          child: Icon(
            Icons.window,
            size: 20,
          ),
        )
      ],
    );
  }
}

class SortingBookListViewShowModal extends StatefulWidget {
  String heading;
  String textOne;
  String textTwo;
  String textThree;

  int? groupValue = 0;
  int? valueOne = 1;
  int? valueTwo = 2;
  int? valueThree = 3;

  Function(int?) onTapViewOne;
  Function(int?) onTapViewTwo;
  Function(int?) onTapViewThree;

  SortingBookListViewShowModal({
    required this.textOne,
    required this.textTwo,
    required this.textThree,
    required this.heading,
    required this.onTapViewThree,
    required this.onTapViewTwo,
    required this.onTapViewOne,
  });

  @override
  State<SortingBookListViewShowModal> createState() =>
      _SortingBookListViewShowModalState();
}

class _SortingBookListViewShowModalState
    extends State<SortingBookListViewShowModal> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text(
            widget.heading,
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
          margin: EdgeInsets.only(
            left: 30,
            top: 20,
          ),
        ),
        SizedBox(height: 20),

        // LineSeparatorView(),

        SizedBox(height: 30),

        SortingBookListByView(
          valueOne: widget.valueOne,
          valueTwo: widget.valueTwo,
          valueThree: widget.valueThree,
          groupValue: widget.groupValue,
          textOne: widget.textOne,
          textTwo: widget.textTwo,
          textThree: widget.textThree,
          onTapViewOne: (clickValue) {
            setState(() {
              widget.groupValue = clickValue;
              widget.onTapViewOne(widget.groupValue);
            });
          },
          onTapViewTwo: (clickValue) {
            setState(() {
              widget.groupValue = clickValue;
              widget.onTapViewTwo(widget.groupValue);
            });
          },
          onTapViewThree: (clickValue) {
            setState(() {
              widget.groupValue = clickValue;
              widget.onTapViewThree(widget.groupValue);
            });
          },
        ),
      ],
    );
  }
}

class SortingBookListByView extends StatefulWidget {
  String textOne;
  String textTwo;
  String textThree;
  int? valueOne;
  int? valueTwo;
  int? valueThree;
  Function(int?) onTapViewOne;
  Function(int?) onTapViewTwo;
  Function(int?) onTapViewThree;

  int? groupValue;

  SortingBookListByView({
    required this.textOne,
    required this.textTwo,
    required this.textThree,
    required this.onTapViewOne,
    required this.onTapViewTwo,
    required this.onTapViewThree,
    this.groupValue = 0,
    required this.valueThree,
    required this.valueTwo,
    required this.valueOne,
  });
  @override
  State<SortingBookListByView> createState() => _SortingBookListByViewState();
}

class _SortingBookListByViewState extends State<SortingBookListByView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Radio<int?>(
                value: widget.valueOne,
                groupValue: widget.groupValue,
                onChanged: (clickValue) {
                  widget.onTapViewOne(clickValue);
                }),
            Text(
              widget.textOne,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            )
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Radio<int?>(
                value: widget.valueTwo,
                groupValue: widget.groupValue,
                onChanged: (clickValue) {
                  widget.onTapViewTwo(clickValue);
                }),
            Text(
              widget.textTwo,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            )
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Radio<int?>(
                value: widget.valueThree,
                groupValue: widget.groupValue,
                onChanged: (clickValue) {
                  widget.onTapViewThree(clickValue);
                }),
            Text(
              widget.textThree,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            )
          ],
        ),
      ],
    );
  }
}


class BookListGridView extends StatelessWidget {
  List<BookVO?>? bookList;
  Function(BookVO?) onTapBook;
  Function(BookVO?) onTapSeeMore;
  bool? isThreeGrid;

  BookListGridView({
    required this.onTapSeeMore,
    required this.bookList,
    required this.onTapBook,
    this.isThreeGrid = false,
  });
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: const EdgeInsets.only(left: 40),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: bookList?.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: (isThreeGrid == false) ? 300 : 280,
          crossAxisSpacing: 0,
          childAspectRatio: 1,
          crossAxisCount: (isThreeGrid == false) ? 2 : 3,
        ),
        itemBuilder: (context, index) {
          BookVO? book = bookList?[index];
          return BookItemDetailView(
            onTapSeeMore: (book) {
              onTapSeeMore(book);
            },
            isThreeGrid: isThreeGrid,
            onTapBook: (book) {
              onTapBook(book);
            },
            book: book,
          );
        });
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
                top: 10.0,
                right: 10.0,
                child: GestureDetector(
                    onTap: (){
                      onTapSeeMore(book);
                    },
                    child: Icon(Icons.keyboard_control_rounded,color: Colors.white,size: 40,)
                ),
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

class BooksVerticalListView extends StatefulWidget {
  BooksVerticalListView({
    Key? key,
    this.bookList,
    required this.visibleDownloadAndSeeMore,
    required this.onPressIcon,
    required this.onTapBook,
  }) : super(key: key);

  BookVO? bookVO;
  bool visibleDownloadAndSeeMore;
  final List<BookVO?>? bookList;
  Function(BookVO?) onPressIcon;
  Function(BookVO?) onTapBook;
  @override
  State<BooksVerticalListView> createState() => _BooksVerticalListViewState();
}

class _BooksVerticalListViewState extends State<BooksVerticalListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        shrinkWrap: true,
        itemCount: widget.bookList?.length,
        scrollDirection: Axis.vertical,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              widget.onTapBook(widget.bookList?[index]);
            },

            child: Column(
              children:[
                VerticalListBookViewSection(
                  bookVO: widget.bookList?[index],
                  onTapSeeMore: (book){
                    widget.bookVO = widget.bookList?[index];
                    widget.onPressIcon(widget.bookVO);
                    },
                ),
                SizedBox(height: 16,)
              ]
            ),
          );
        });
  }
}

class VerticalListBookViewSection extends StatelessWidget {
  BookVO? bookVO;
  Function(BookVO) onTapSeeMore;
  VerticalListBookViewSection({required this.bookVO, required this.onTapSeeMore});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BottomSheetBookImageView(
            mBookImage: bookVO?.bookImage??"",
              // "https://m.media-amazon.com/images/I/51EkeX9IfCL._SX323_BO1,204,203,200_.jpg",
            bookTitle: bookVO?.title??"",
            authorName: "${bookVO?.author??""} . Ebook",
          ),
          Spacer(),

          Container(
            margin: EdgeInsets.only(top: MARGIN_MEDIUM_2),
            child: Row(
              children: [
                Icon(
                  Icons.file_download_outlined,
                  color: HINT_TEXT_COLOR,
                ),
                SizedBox(width: MARGIN_MEDIUM_2,),
                GestureDetector(
                    onTap: (){
                      onTapSeeMore(bookVO!);
                    },
                    child: Icon(Icons.keyboard_control_rounded,color: HINT_TEXT_COLOR,size: 30,)
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ShowModalSheetForBookDetail extends StatefulWidget {
  bool visibleRemoveDownload;
  bool visibleDownload;
  bool visibleDeleteFromLibrary;
  bool visibleAddToShelves;
  bool visibleMarkAsRead;
  bool visibleFreeSample;
  bool visibleAddToWishlist;
  bool visibleAboutThisBook;

  BookVO? book;
  Function(BookVO?) onPressedIcon;
  Function()? addToShelf;
  ShowModalSheetForBookDetail({
    this.addToShelf,
    required this.book,
    required this.onPressedIcon,
    this.visibleAboutThisBook = false,
    this.visibleAddToShelves = false,
    this.visibleAddToWishlist = false,
    this.visibleDeleteFromLibrary = false,
    this.visibleDownload = false,
    this.visibleFreeSample = false,
    this.visibleMarkAsRead = false,
    this.visibleRemoveDownload = false,
  });
  @override
  State<ShowModalSheetForBookDetail> createState() =>
      _ShowModalSheetForBookDetailState();
}

class _ShowModalSheetForBookDetailState
    extends State<ShowModalSheetForBookDetail> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30, top: 20),
          child: BookImageAndNameBottomSheetHeader(book: widget.book),
        ),
        SizedBox(height: 10),
        // LineSeparatorView(),
        SizedBox(height: 10),
        Visibility(
          visible: widget.visibleRemoveDownload,
          child: Padding(
            padding: const EdgeInsets.only(left: 30, bottom: 16),
            child: FunctionsOfShowModalOne(
              onTap: () {},
              icon: Icons.remove_circle_outline,
              text: "Remove downloaded",
            ),
          ),
        ),
        Visibility(
          visible: widget.visibleDownload,
          child: Padding(
            padding: const EdgeInsets.only(left: 30, bottom: 16),
            child: FunctionsOfShowModalOne(
              onTap: () {},
              icon: Icons.file_download_outlined,
              text: "Download",
            ),
          ),
        ),
        Visibility(
          visible: widget.visibleDeleteFromLibrary,
          child: Padding(
            padding: const EdgeInsets.only(left: 30, bottom: 16),
            child: FunctionsOfShowModalOne(
              onTap: () {},
              icon: Icons.delete_sharp,
              text: "Delete from your library",
            ),
          ),
        ),
        Visibility(
          visible: widget.visibleAddToShelves,
          child: Padding(
            padding: const EdgeInsets.only(left: 30, bottom: 16),
            child: FunctionsOfShowModalOne(
              onTap: () {
                widget.addToShelf!();
              },
              icon: Icons.add,
              text: "Add to shelves...",
            ),
          ),
        ),
        Visibility(
          visible: widget.visibleMarkAsRead,
          child: Padding(
            padding: const EdgeInsets.only(left: 30, bottom: 16),
            child: FunctionsOfShowModalOne(
              onTap: () {},
              icon: Icons.file_download_done_outlined,
              text: "Mark as read",
            ),
          ),
        ),
        // SizedBox(height: 10),
        Visibility(
          visible: widget.visibleFreeSample,
          child: Padding(
            padding: const EdgeInsets.only(left: 30, bottom: 16),
            child: FunctionsOfShowModalOne(
              onTap: () {},
              icon: Icons.add_comment,
              text: "Free sample",
            ),
          ),
        ),
        Visibility(
          visible: widget.visibleAddToWishlist,
          child: Padding(
            padding: const EdgeInsets.only(left: 30, bottom: 16),
            child: FunctionsOfShowModalOne(
              onTap: () {},
              icon: Icons.bookmark_add_sharp,
              text: "Add to wishlist",
            ),
          ),
        ),
        Visibility(
          visible: widget.visibleAboutThisBook,
          child: Padding(
            padding: const EdgeInsets.only(left: 30, bottom: 16),
            child: FunctionsOfShowModalOne(
              onTap: () {},
              icon: Icons.book_rounded,
              text: "About this book",
            ),
          ),
        ),
        SizedBox(height: 6),
      ],
    );
  }
}

class FunctionsOfShowModalOne extends StatelessWidget {
  Function onTap;
  String text;
  IconData icon;
  FunctionsOfShowModalOne({
    required this.icon,
    required this.text,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            onTap();
          },
          child: Icon(
            icon,
            color: Colors.black54,
            size: 22,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 10,
        ),
        GestureDetector(
          onTap: () {
            onTap();
          },
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: Colors.black,
            ),
          ),
        )
      ],
    );
  }
}
class BookImageAndNameBottomSheetHeader extends StatelessWidget {
  BookVO? book;
  BookImageAndNameBottomSheetHeader({this.book});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              child: Image.network(
                book?.bookImage ?? "",
                height: 140,
                width: 90,
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    book?.title ?? "",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 70,
                  ),
                  Text(
                    book?.author ?? "",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class BookAuthorImageForBottomSheet extends StatefulWidget {
  BookVO? book;
  double? imageHeight;
  double? imageWidth;
  double? titleFont;
  double? subTitleFont;
  double? sizeBoxHeight;
  bool visibleDownLoadAndSeeMore;
  Function(BookVO?) onPressedIcon;
  BookAuthorImageForBottomSheet({
    required this.book,
    this.imageHeight = 140,
    this.imageWidth = 90,
    this.titleFont = 16,
    this.subTitleFont = 14,
    this.sizeBoxHeight = 0,
    required this.visibleDownLoadAndSeeMore,
    required this.onPressedIcon,
  });

  @override
  State<BookAuthorImageForBottomSheet> createState() =>
      _BookAuthorImageForBottomSheetState();
}

class _BookAuthorImageForBottomSheetState
    extends State<BookAuthorImageForBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              child: Image.network(
                widget.book?.bookImage ?? "",
                height: widget.imageHeight,
                width: widget.imageWidth,
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.book?.title ?? "",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: widget.titleFont,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 70,
                  ),
                  Text(
                    widget.book?.author ?? "",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: widget.subTitleFont,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),

          ],
        ),
        SizedBox(height: widget.sizeBoxHeight)
      ],
    );
  }
}