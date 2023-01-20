import 'package:flutter/material.dart';
import 'package:library_app/widgets/typical_text.dart';

import '../resources/colors.dart';
import '../resources/dimens.dart';
import '../view_items/who_write_review_book_item_view.dart';
import 'book_detail_view_page.dart';

class BookRatingsAndReviewsViewPage extends StatelessWidget {

  List<int>? starList = [1,2,3,4,5];
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
        title: TypicalText("Ratings and Reviews",
          Colors.black,
          TEXT_REGULAR_1X,
          isCenterText: true,
          isFontWeight: true,),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              RatingsAndReviewSectionView(),

              Container(
                  // margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM),
                  height: 45,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(left: MARGIN_MEDIUM_2),
                      itemCount: 5,
                      // movieList.length,
                      itemBuilder:(BuildContext context, int index){
                        return StarSectionView(starsCount: starList![index]);

                      }
                  )
              ),

              SizedBox(height: MARGIN_MEDIUM_2,),

              Container(
                  margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
                  height: MOVIE_LIST_HEIGHT,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      padding: EdgeInsets.only(left: MARGIN_MEDIUM_2),
                      itemCount: 3,
                      // movieList.length,
                      itemBuilder:(BuildContext context, int index){
                        return WhoWriteReviewBookItemView();
                      }
                  )
              ),

            ],
          ),
        ),
      ),
    );
  }
}

class StarSectionView extends StatelessWidget {

  int starsCount;
  StarSectionView({required this.starsCount});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: MARGIN_SMALL),
      padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2,vertical: MARGIN_MEDIUM),
      decoration: BoxDecoration(
          border: Border.all(color: HINT_TEXT_COLOR),
          borderRadius: BorderRadius.circular(20.0)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TypicalText(starsCount.toString(), HINT_TEXT_COLOR, TEXT_REGULAR_1X),
          SizedBox(width: MARGIN_SMALL,),
          Icon(Icons.star,color: HINT_TEXT_COLOR,size: 20,)
        ],
      ),
    );
  }
}



