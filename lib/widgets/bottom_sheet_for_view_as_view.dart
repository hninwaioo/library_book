import 'package:flutter/material.dart';
import 'package:library_app/resources/colors.dart';
import 'package:library_app/resources/dimens.dart';
import 'package:library_app/widgets/typical_text.dart';

class BottomSheetForViewAsView extends StatefulWidget {

  String? selectedList;
  String? selectedLargeGrid;
  String? selectedSmallGrid;
  Function(String?) onSelectedVerticalListView;
  Function(String?) onSelectedLargeGridView;
  Function(String?) onSelectedSmallGridView;

  String? viewType;

  BottomSheetForViewAsView({

    required this.onSelectedVerticalListView,
    required this.onSelectedLargeGridView,
    required this.onSelectedSmallGridView,
    required this.viewType,
    required this.selectedList,
    required this.selectedLargeGrid,
    required this.selectedSmallGrid,
  });
  @override
  State<BottomSheetForViewAsView> createState() => _BottomSheetForViewAsViewState();
}

class _BottomSheetForViewAsViewState extends State<BottomSheetForViewAsView> {
  ViewListCharacter? _character = ViewListCharacter.List;
  // String? gender; //no radio button will be selected
  String listType = "LIST"; //if you want to set default value
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MARGIN_MEDIUM_2,),

          Container(
              margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2,vertical: MARGIN_MEDIUM),
              child: TypicalText("View as", HINT_TEXT_COLOR, 16, isFontWeight: true,)
          ),

          SizedBox(height: MARGIN_MEDIUM_2,),
          Divider(color: HINT_TEXT_COLOR, height: 0.05,),
          SizedBox(height: MARGIN_MEDIUM_2,),

          Container(
            child: Column(
              children: [
                RadioListTile(
                  title: Text("List"),
                  value: "LIST",
                  groupValue: widget.viewType,
                  onChanged: (value){
                    widget.onSelectedVerticalListView("LIST");
                    setState(() {
                      listType = value.toString();
                      widget.selectedList = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  title: Text("Large Grid"),
                  value: "LARGE_GRID",
                  groupValue: widget.viewType,
                  onChanged: (value){
                    widget.onSelectedLargeGridView("LARGE_GRID");
                    setState(() {
                      listType = value.toString();
                      widget.selectedLargeGrid = value.toString();

                    });
                  },
                ),
                RadioListTile(
                  title: Text("Small Grid"),
                  value: "SMALL_GRID",
                  groupValue: widget.viewType,
                  onChanged: (value){
                    widget.onSelectedSmallGridView("SMALL_GRID");
                    setState(() {
                      listType = value.toString();
                      widget.selectedSmallGrid = value.toString();

                    });
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: MARGIN_MEDIUM_2,),
        ],
      ),
    );
  }
}

enum ViewListCharacter { List, LargeGrid, SmallGrid}
