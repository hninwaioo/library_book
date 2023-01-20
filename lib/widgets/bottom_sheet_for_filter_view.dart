import 'package:flutter/material.dart';
import 'package:library_app/resources/colors.dart';
import 'package:library_app/resources/dimens.dart';
import 'package:library_app/widgets/typical_text.dart';

class BottomSheetForFilterView extends StatefulWidget {

  String? selectedByRecent;
  String? selectedByBookTitle;
  String? selectedByAuthor;
  Function(String?) onSelectedFilterByRecent;
  Function(String?) onSelectedFilterByBookTitle;
  Function(String?) onSelectedFilterByAuthor;

  String? filterType;

  BottomSheetForFilterView({
    required this.onSelectedFilterByRecent,
    required this.onSelectedFilterByBookTitle,
    required this.onSelectedFilterByAuthor,
    required this.filterType,
    required this.selectedByRecent,
    required this.selectedByBookTitle,
    required this.selectedByAuthor,
});

  @override
  State<BottomSheetForFilterView> createState() => _BottomSheetForFilterViewState();
}

class _BottomSheetForFilterViewState extends State<BottomSheetForFilterView> {
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
              child: Column(
                children: [
                  RadioListTile(
                    title: Text("Recently opened"),
                    value: "REC_OPEN",
                    groupValue: widget.filterType,
                    onChanged: (value){
                      widget.onSelectedFilterByRecent("REC_OPEN");
                      setState(() {
                        widget.selectedByRecent = value.toString();
                        debugPrint("Sheet=>RecentOpened");
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Title"),
                    value: "TITLE",
                    groupValue: widget.filterType,
                    onChanged: (value){
                      widget.onSelectedFilterByBookTitle("TITLE");
                      setState(() {
                        widget.selectedByBookTitle = value.toString();
                        debugPrint("Sheet=>TITLE");

                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Author"),
                    value: "AUTHOR",
                    groupValue: widget.filterType,
                    onChanged: (value){
                      widget.onSelectedFilterByAuthor("AUTHOR");
                      setState(() {
                        widget.selectedByAuthor = value.toString();
                        debugPrint("Sheet=>AUTHOR");

                      });
                    },
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
