import 'package:flutter/material.dart';

class MultiSelectTabBarViewSection extends StatefulWidget {
  List<String?>? tabList;
  Function(String) onTab;
  Function onTapCrossButton;
  // Function(String? tab) onTabBookTypeChooser;

  String? chosenTab;
  bool? crossButtonVisible;
  bool? chosenTabVisible;
  bool? tabListVisible;
  MultiSelectTabBarViewSection({
    required this.tabList,
    required this.onTab,
    required this.onTapCrossButton,
    // required this.onTabBookTypeChooser,
    required this.chosenTab,
    required this.chosenTabVisible,
    required this.crossButtonVisible,
    this.tabListVisible = true,
  });
  @override
  State<MultiSelectTabBarViewSection> createState() =>
      _MultiSelectTabBarViewSectionState();
}

class _MultiSelectTabBarViewSectionState
    extends State<MultiSelectTabBarViewSection> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 34,
      child: ListView(
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.only(right: 26, left: 26),
        scrollDirection: Axis.horizontal,
        children: [
          Visibility(
            visible: widget.crossButtonVisible ?? false,
            child: RemoveChosenTabIconView(onTapCrossButton: () {
              widget.onTapCrossButton();
            }),
          ),
          SizedBox(width: 10),
          Visibility(
              visible: widget.chosenTabVisible ?? false,
              child: ChosenTabWithColorView(text: "${widget.chosenTab}")),
          SizedBox(width: 10),
          Visibility(
            visible: (widget.tabList!.isNotEmpty),
            child: MultiTabsImplementForBookListView(
              tabList: widget.tabList ?? [],
              onTab: (tab) {
                widget.onTab(tab);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ChosenTabWithColorView extends StatelessWidget {
  String text;
  ChosenTabWithColorView({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border.all(width: 1, color: Colors.black12),
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
      ),
      child: Center(
        child: Text(text),
      ),
    );
  }
}

class RemoveChosenTabIconView extends StatelessWidget {
  Function onTapCrossButton;
  RemoveChosenTabIconView({required this.onTapCrossButton});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTapCrossButton();
      },
      child: Container(
        child: Icon(
          Icons.highlight_off_outlined,
          size: 36,
          color: Colors.black45,
        ),
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          //color: Colors.blue,
        ),
        //padding: EdgeInsets.all(3),
      ),
    );
  }
}

class MultiTabsImplementForBookListView extends StatelessWidget {
  MultiTabsImplementForBookListView({
    required this.tabList,
    required this.onTab,
  });
  List<String?>? tabList;
  Function(String) onTab;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      height: 34,
      padding: EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(30),
          ),
          border: Border.all(
            width: 1,
            color: Colors.black12,
          )),
      child: ListView.separated(
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 10, top: 0, right: 10),
        scrollDirection: Axis.horizontal,
        itemCount: tabList?.length ?? 0,
        physics: NeverScrollableScrollPhysics(),
        separatorBuilder: ((context, index) {
          return Text(
            "|",
            style: TextStyle(fontSize: 16),
          );
        }),
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "${tabList?[index]}",
              ),
            ),
            onTap: () {
              onTab(tabList?[index] ?? "");
            },
          );
        },
      ),
    );
  }
}