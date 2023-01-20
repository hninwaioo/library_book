import 'package:flutter/material.dart';
import 'package:library_app/widgets/typical_text.dart';
import '../resources/colors.dart';
import '../resources/dimens.dart';
import '../widgets/bottom_sheet_for_shelves_view.dart';
import '../widgets/sort_books_list_view.dart';

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
              child: Icon(Icons.keyboard_control_rounded,color: HINT_TEXT_COLOR,)
          ),
          SizedBox(width: MARGIN_MEDIUM_2,)
        ],
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


