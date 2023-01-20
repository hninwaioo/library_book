import 'package:flutter/material.dart';
import 'package:library_app/widgets/typical_text.dart';

import '../resources/colors.dart';
import '../resources/dimens.dart';

class BottomSheetForShelvesView extends StatelessWidget {
  const BottomSheetForShelvesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MARGIN_MEDIUM_2,),

          Container(
              margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2,vertical: MARGIN_MEDIUM),
              child: TypicalText("10 Design Books", HINT_TEXT_COLOR, 16, isFontWeight: true,)
          ),

          SizedBox(height: MARGIN_MEDIUM_2,),
          Divider(color: HINT_TEXT_COLOR, height: 0.05,),
          SizedBox(height: MARGIN_MEDIUM_2,),

          Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(Icons.edit_sharp,color: HINT_TEXT_COLOR,),
                    SizedBox(width: MARGIN_MEDIUM,),
                    TypicalText("Rename shelf", Colors.black, 16)
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.delete_forever_outlined,color: HINT_TEXT_COLOR,),
                    SizedBox(width: MARGIN_MEDIUM,),
                    TypicalText("Delete shelf", Colors.black, 16)
                  ],
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
