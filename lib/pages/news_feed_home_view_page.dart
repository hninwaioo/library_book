import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../resources/colors.dart';
import '../resources/dimens.dart';
import '../view_items/news_feed_item_view.dart';
import '../widgets/typical_text.dart';
// import 'package:social_media_app/blocs/news_feed_bloc.dart';
// import 'package:social_media_app/data/vos/news_feed_vo.dart';
// import 'package:social_media_app/resources/colors.dart';
// import 'package:social_media_app/resources/dimens.dart';
// import 'package:social_media_app/widgets/typical_text.dart';

// import '../viewitems/news_feed_item_view.dart';

class NewsFeedHomeViewPage extends StatelessWidget {
  const NewsFeedHomeViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      // ChangeNotifierProvider(
      // create: (context) => NewsFeedBloc(),
      // child:
      Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          
          elevation: 0,
          leading: Container(
            margin: EdgeInsets.only(left: MARGIN_MEDIUM),
            child: Center(

                child: TypicalText("Social",Colors.black,TEXT_REGULAR_1X,isFontWeight: true)
                // Text(
                //   "Social",
                //   style: TextStyle(
                //       decoration: TextDecoration.none,
                //       color: Colors.black,
                //       fontSize: TEXT_REGULAR_1X,
                //     fontWeight: FontWeight.bold
                //
                //   ),
                //   // Colors.black, TEXT_REGULAR_1X,isFontWeight: true,
                // )
            ),
          ),
          actions:[
            Container(
              margin: EdgeInsets.only(right: MARGIN_MEDIUM_2),
                child: Icon(Icons.search,color: PRIMARY_HINT_COLOR,)),
          ]
        ),

        body: SingleChildScrollView(
          child: Column(
            children: [
              // Selector<NewsFeedBloc,List<NewsFeedVO>?>(
              //   selector: (context,bloc) => bloc.newsFeed,
              //   builder: (context, newsFeedList, child) =>
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount:3,
                        // newsFeedList?.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {

                          return NewsFeedItemView(
                            // newsFeedVO: newsFeedList?[index],
                          );
                        }),
              // ),

            ],
          ),
        ),
      );

    // );
  }
}
