import 'package:flutter/material.dart';
import 'package:library_app/widgets/typical_text.dart';
import '../resources/dimens.dart';

class BookTypeListView extends StatelessWidget {
  String bookTypes;
  BookTypeListView({required this.bookTypes});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Expanded(
        //   child:
        //   Container(
        //     // width: MediaQuery.of(context).size.width/1,
        //       child: TypicalText(bookTypes,Colors.black,TEXT_REGULAR_2x,isFontWeight: true)
        //   ),

          Container(
            width: MediaQuery.of(context).size.width/1.5,
            child:
            // Expanded(
            //   child:
              Text(
                bookTypes,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: TEXT_REGULAR_1X,
                  fontWeight: FontWeight.bold,
                ),
              ),
            // ),
          ),

        // ),
        // TypicalText(bookTypes,Colors.black,TEXT_REGULAR_2x,isFontWeight: true),
        Spacer(),
        Icon(Icons.arrow_forward_ios_sharp,color: Colors.blue,)

      ],
    );
  }
}
