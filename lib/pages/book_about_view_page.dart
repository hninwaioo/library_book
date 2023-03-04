import 'package:flutter/material.dart';
import 'package:library_app/widgets/typical_text.dart';
import '../resources/colors.dart';
import '../resources/dimens.dart';

class BookAboutViewPage extends StatelessWidget {
  String bookTitle;
  String bookDescription;
  BookAboutViewPage({required this.bookTitle,required this.bookDescription});

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
        title: TypicalText(
          bookTitle,
          Colors.black,
          TEXT_REGULAR_1X,
          isCenterText: true,
          isFontWeight: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2,vertical: MARGIN_MEDIUM_2),
          child: TypicalText(
              bookDescription,
              HINT_TEXT_COLOR,TEXT_REGULAR_1X),
        ),
      ),
    );
  }
}
