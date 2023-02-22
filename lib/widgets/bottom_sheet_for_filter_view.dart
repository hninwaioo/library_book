import 'package:flutter/material.dart';
import 'package:library_app/resources/colors.dart';
import 'package:library_app/resources/dimens.dart';
import 'package:library_app/widgets/typical_text.dart';

class BottomSheetForFilterView extends StatelessWidget {

//   String? selectedByRecent;
//   String? selectedByBookTitle;
//   String? selectedByAuthor;
//   Function(String?) onSelectedFilterByRecent;
//   Function(String?) onSelectedFilterByBookTitle;
//   Function(String?) onSelectedFilterByAuthor;
//
//   String? filterType;
//
//   BottomSheetForFilterView({
//     required this.onSelectedFilterByRecent,
//     required this.onSelectedFilterByBookTitle,
//     required this.onSelectedFilterByAuthor,
//     required this.filterType,
//     required this.selectedByRecent,
//     required this.selectedByBookTitle,
//     required this.selectedByAuthor,
// });

  // String textByRecent;
  // String textByBookTitle;
  // String textByAuthor;

  int? valueRecent;
  int? valueBookTitle;
  int? valueAuthor;

  Function(int?) onSelectedFilterByRecent;
  Function(int?) onSelectedFilterByBookTitle;
  Function(int?) onSelectedFilterByAuthor;

  int? groupValue;

  BottomSheetForFilterView({
    // required this.textByRecent,
    // required this.textByBookTitle,
    // required this.textByAuthor,
    required this.onSelectedFilterByRecent,
    required this.onSelectedFilterByBookTitle,
    required this.onSelectedFilterByAuthor,
    this.groupValue = 0,
    required this.valueRecent,
    required this.valueBookTitle,
    required this.valueAuthor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MARGIN_MEDIUM_2,),

            Container(
                margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2,vertical: MARGIN_MEDIUM),
                child: TypicalText("Sort by", HINT_TEXT_COLOR, 16, isFontWeight: true,)
            ),

            SizedBox(height: MARGIN_MEDIUM_2,),
            Divider(color: HINT_TEXT_COLOR, height: 0.05,),
            SizedBox(height: MARGIN_MEDIUM_2,),

            Container(

              // child: Column(
              //   children: [
              //     RadioListTile(
              //       title: Text("Recently opened"),
              //       value: "REC_OPEN",
              //       groupValue: widget.filterType,
              //       onChanged: (value){
              //         widget.onSelectedFilterByRecent("REC_OPEN");
              //         setState(() {
              //           widget.selectedByRecent = value.toString();
              //           debugPrint("Sheet=>RecentOpened");
              //         });
              //       },
              //     ),
              //     RadioListTile(
              //       title: Text("Title"),
              //       value: "TITLE",
              //       groupValue: widget.filterType,
              //       onChanged: (value){
              //         widget.onSelectedFilterByBookTitle("TITLE");
              //         setState(() {
              //           widget.selectedByBookTitle = value.toString();
              //           debugPrint("Sheet=>TITLE");
              //
              //         });
              //       },
              //     ),
              //     RadioListTile(
              //       title: Text("Author"),
              //       value: "AUTHOR",
              //       groupValue: widget.filterType,
              //       onChanged: (value){
              //         widget.onSelectedFilterByAuthor("AUTHOR");
              //         setState(() {
              //           widget.selectedByAuthor = value.toString();
              //           debugPrint("Sheet=>AUTHOR");
              //
              //         });
              //       },
              //     ),
              //   ],
              // ),

              child: Column(
                children:<Widget> [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Radio<int?>(
                          value: valueRecent,
                          groupValue: groupValue,
                          onChanged: (selectedValue) {
                            onSelectedFilterByRecent(selectedValue);
                          }
                          // onChanged: (index) => onSelectedFilterByRecent(index)
                          ),
                      Text(
                        "Recently opened",
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
                          value: valueBookTitle,
                          groupValue: groupValue,
                          onChanged: (selectedValue) {
                            onSelectedFilterByBookTitle(selectedValue);
                          }),

                      Text(
                        "Title",
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
                          value: valueAuthor,
                          groupValue: groupValue,
                          onChanged: (selectedValue) {
                            onSelectedFilterByAuthor(selectedValue);
                          }),
                      Text(
                        "Author",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: MARGIN_MEDIUM_2,),
          ],
        )
    );
  }
}
