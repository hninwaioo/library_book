import 'package:flutter/material.dart';
import 'package:library_app/resources/colors.dart';
import 'package:library_app/resources/dimens.dart';

import '../widgets/ratings_and_reviews_view.dart';
import '../widgets/typical_text.dart';

class WhoWriteReviewBookItemView extends StatelessWidget {
  const WhoWriteReviewBookItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Image.network("src"),
          Image.asset('assets/images/user_female.png'),
          SizedBox(width: MARGIN_MEDIUM,),
          WriterNameSectionView(),
        ],
      ),
        SizedBox(height: MARGIN_MEDIUM,),
      ]
    );
  }
}

class WriterNameSectionView extends StatelessWidget {
  const WriterNameSectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TypicalText("SemGoz",Colors.black,16,isFontWeight: true,),
          SizedBox(height: MARGIN_SMALL,),

          Row(
            children: [
              RatingView(starSize: MARGIN_MEDIUM_2,),
              SizedBox(width: MARGIN_SMALL,),
              TypicalText("14/5/2022",HINT_TEXT_COLOR,TEXT_REGULAR),
            ],
          ),
          SizedBox(height: MARGIN_SMALL,),

          TypicalText(
              "Hard to buy the book for class, really convenient. This book is excellent book.",
              HINT_TEXT_COLOR,16),
        ],
      ),
    );
  }
}

