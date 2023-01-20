import 'package:flutter/material.dart';
import 'package:library_app/data/vos/shelf_vo.dart';
import '../widgets/bottom_sheet_for_book_in_library_view.dart';

class CheckForSaveInShelfItemView extends StatefulWidget {

  ShelfVO? shelfVO;
  Function (bool) checkedShelf;
  List<ShelfVO?>? bookShelveList;

  CheckForSaveInShelfItemView({
    required this.shelfVO,
    required this.checkedShelf,
    required this.bookShelveList
  });

  @override
  State<CheckForSaveInShelfItemView> createState() => _CheckForSaveInShelfItemViewState();
}

class _CheckForSaveInShelfItemViewState extends State<CheckForSaveInShelfItemView> {
  @override
  Widget build(BuildContext context) {
    return Container(

      child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BottomSheetBookImageView(
              mBookImage: "https://cdn-icons-png.flaticon.com/512/32/32737.png",
              bookTitle: widget.shelfVO?.shelfName??"HNIN WAI",
              authorName: "${widget.shelfVO?.shelfBooks?.length ?? 0} Ebook",
            ),
            Spacer(),

            Checkbox(
              tristate: true,
              value: widget.shelfVO?.isChecked,
              onChanged: (e) {
                setState(() {
                  widget.checkedShelf(e??false);
                });
              },
            ),
          ],
        ),
    );
  }
}
