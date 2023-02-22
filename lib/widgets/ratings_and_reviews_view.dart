import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:getwidget/getwidget.dart';
import 'package:library_app/resources/colors.dart';
import 'package:library_app/widgets/typical_text.dart';

import '../resources/dimens.dart';

class RatingsAndReviewsView extends StatelessWidget {
  const RatingsAndReviewsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: EdgeInsets.symmetric(vertical: MARGIN_MEDIUM_2),
      child: Row(
        children: [
          RatingsColumnSectionView(),
          SizedBox(width: MARGIN_MEDIUM,),
          AllRatingBarsView()
        ],
      ),
    );
  }
}

class RatingsColumnSectionView extends StatelessWidget {
  const RatingsColumnSectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          TypicalText("3.9", Colors.black, 36,isFontWeight: true),
          SizedBox(height: MARGIN_SMALL,),
          RatingView(starSize: MARGIN_MEDIUM_LARGE),
          SizedBox(height: MARGIN_SMALL,),
          TypicalText("95 ratings", HINT_TEXT_COLOR, TEXT_REGULAR_1X),
        ],
      ),
    );
  }
}

class RatingView extends StatelessWidget {
  double starSize;
  RatingView({required this.starSize});
  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: 4,
      itemBuilder: (BuildContext context, int index){
        return Icon(
          Icons.star,
          color: Colors.blue,
        );
      },
      itemSize: starSize,
      onRatingUpdate: (rating){
        print(rating);
      },
    );
  }
}
class AllRatingBarsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleBarForEachRatingView(digit: "5", width: 100),
        SizedBox(height: 2),
        SingleBarForEachRatingView(digit: "4", width: 58),
        SizedBox(height: 2),
        SingleBarForEachRatingView(digit: "3", width: 42),
        SizedBox(height: 2),
        SingleBarForEachRatingView(digit: "2", width: 38),
        SizedBox(height: 2),
        SingleBarForEachRatingView(digit: "1", width: 13),
      ],
    );
  }
}

class SingleBarForEachRatingView extends StatelessWidget {
  String digit;
  double? width;
  SingleBarForEachRatingView({required this.width, required this.digit});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          digit,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        SizedBox(width: 12),
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.all(
                  Radius.circular(8),
                ),
              ),
              height: 8,
              width: 180,
            ),
            Positioned(
              left: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                height: 8,
                width: width,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class LinearProgressBarSectionView extends StatelessWidget {

  String progressCount;
  double progressRate;

  LinearProgressBarSectionView({
   required this.progressCount,
   required this.progressRate
  });

  @override
  Widget build(BuildContext context) {
    return
      Row(
          children: [
            TypicalText(progressCount, Colors.blue, 18),
            // LinearProgressIndicator(
            //   value: progressRate,
            //   color: Colors.blue, //<-- SEE HERE
            //   backgroundColor: Colors.grey, //<-- SEE HERE
            // ),

            GFProgressBar(
              percentage: progressRate,
              lineHeight: 10, //2
              width: 120,
              // alignment: MainAxisAlignment.spaceBetween,
              // child: const Text('70%', textAlign: TextAlign.end,
              //   style: TextStyle(fontSize: 14, color: Colors.white),
              // ),
              // leading  : Icon( Icons.sentiment_dissatisfied, color: Colors.red),
              // trailing: Icon( Icons.sentiment_satisfied, color: Colors.green),
              backgroundColor: Colors.black12,
              progressBarColor: Colors.blue,
            )
          ],
        );
  }
}

class LinearProgressBarCountSectionView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LinearProgressBarSectionView(progressCount: "5",progressRate: 0.7,),
        LinearProgressBarSectionView(progressCount: "4",progressRate: 0.6,),
        LinearProgressBarSectionView(progressCount: "3",progressRate: 0.5,),
        LinearProgressBarSectionView(progressCount: "2",progressRate: 0.4,),
        LinearProgressBarSectionView(progressCount: "1",progressRate: 0.3,)
      ],
    );
  }
}



