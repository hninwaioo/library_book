import 'package:flutter/material.dart';
import 'package:getwidget/components/progress_bar/gf_progress_bar.dart';
import 'package:library_app/pages/book_ratings_and_reviews_view_page.dart';
import 'package:library_app/resources/colors.dart';
import '../blocs/provider_book_details_bloc.dart';
import '../data/vos/book_vo.dart';
import '../resources/dimens.dart';
import '../view_items/banner_book_image_item_view.dart';
import '../view_items/who_write_review_book_item_view.dart';
import '../widgets/book_type_list_view.dart';
import '../widgets/ratings_and_reviews_view.dart';
import '../widgets/typical_text.dart';
import 'book_about_view_page.dart';
import 'package:provider/provider.dart';

class BookDetailViewPage extends StatefulWidget {

  // final String listName;
  // final String title;
  // final String openedDate;
   BookVO? bookVO;
  // const BookDetailViewPage({Key? key, required this.listName, required this.title, required this.openedDate}) : super(key: key);
   BookDetailViewPage({required this.bookVO});
  @override
  State<BookDetailViewPage> createState() => _BookDetailViewPageState();
}

class _BookDetailViewPageState extends State<BookDetailViewPage> {
  // @override
  // void dispose() {
  //   ProviderBookDetailsBloc bloc=Provider.of<ProviderBookDetailsBloc>(context,listen: false);
  //   bloc.isDispose=true;
  //   super.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    // return ChangeNotifierProvider(
    //   create: (context)=>
    //       ProviderBookDetailsBloc(widget.listName,widget.title,
    //           widget.openedDate
    //       ),

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
            Icon(Icons.ios_share,color: HINT_TEXT_COLOR,),
            SizedBox(width: MARGIN_MEDIUM_2,)
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              BookDetailImageItemSectionView(
                mBookImage: widget.bookVO?.bookImage??"",
                bookTitle: widget.bookVO?.title??"",
                authorName: widget.bookVO?.author??"",
                bookTypePage:
                "Ebook . 187 pages",
              ),

              Divider(color: HINT_TEXT_COLOR,height: 0.1,),

              FreeSampleAddToWishListSectionView(),

              AboutBookSectionView(
                bookTitle: widget.bookVO?.title,
                aboutBook: widget.bookVO?.description??"",
              ),

              RatingsAndReviewSectionView(),

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
              PublishedSectionView()
            ],
          ),
          // Selector<ProviderBookDetailsBloc,BookVO?>(
          //   selector: (context ,bloc )=>bloc.book,
          //   builder: (context, bookData, child)=>
          //    Column(
          //       children: [
          //         BookDetailImageItemSectionView(
          //           mBookImage: bookData?.bookImage??"",
          //           bookTitle: bookData?.title??"",
          //           authorName: bookData?.author??"",
          //           bookTypePage:
          //           "Ebook . 187 pages",
          //         ),
          //
          //         Divider(color: HINT_TEXT_COLOR,height: 0.1,),
          //
          //         // SizedBox(height: MARGIN_MEDIUM_2,),
          //
          //         FreeSampleAddToWishListSectionView(),
          //
          //         AboutBookSectionView(
          //           bookTitle: bookData?.title,
          //           aboutBook: bookData?.description??"",
          //         ),
          //
          //         RatingsAndReviewSectionView(),
          //
          //         Container(
          //             margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2),
          //             height: MOVIE_LIST_HEIGHT,
          //             child: ListView.builder(
          //                 scrollDirection: Axis.vertical,
          //                 padding: EdgeInsets.only(left: MARGIN_MEDIUM_2),
          //                 itemCount: 3,
          //           // movieList.length,
          //                 itemBuilder:(BuildContext context, int index){
          //                   return WhoWriteReviewBookItemView();
          //                 }
          //           )
          //         ),
          //         PublishedSectionView()
          //       ],
          //   ),
          // ),
        ),

    );
  }
}

class BookDetailImageItemSectionView extends StatelessWidget {

  String mBookImage;
  String bookTitle;
  String authorName;
  String bookTypePage;

  BookDetailImageItemSectionView({
    required this.mBookImage,
    required this.bookTitle,
    required this.authorName,
    required this.bookTypePage
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2,vertical: MARGIN_MEDIUM_2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(right: MARGIN_MEDIUM_2),
            height: SHOWTIME_SECTION_HEIGHT,
            child: BannerBookImageItemView(
              mImageUrl: mBookImage,
              // mImageUrl: 'https://m.media-amazon.com/images/I/51EkeX9IfCL._SX323_BO1,204,203,200_.jpg',
            ),
          ),

          Container(

            width: MediaQuery.of(context).size.width/2.2,
            margin: EdgeInsets.only(top: MARGIN_MEDIUM_2,right: MARGIN_MEDIUM_2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  bookTitle,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    fontSize: TEXT_REGULAR_1X
                  ),
                ),
                SizedBox(height: MARGIN_MEDIUM,),
                TypicalText(authorName, HINT_TEXT_COLOR, 14,isFontWeight: true,),
                SizedBox(height: MARGIN_MEDIUM,),
                TypicalText(bookTypePage, HINT_TEXT_COLOR, 14,isFontWeight: true,)
              ],
            ),
          )
        ],
      ),
    );
  }
}

class FreeSampleAddToWishListSectionView extends StatelessWidget {
  const FreeSampleAddToWishListSectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2,vertical: MARGIN_MEDIUM_2),

      child: Column(
        children: [
          Row(
            children: [

              Container(
                // margin: const EdgeInsets.all(15.0),
                padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2,vertical: MARGIN_MEDIUM),
                decoration: BoxDecoration(
                    border: Border.all(color: HINT_TEXT_COLOR),
                    borderRadius: BorderRadius.circular(5.0)
                ),
                child: TypicalText('Free Sample',Colors.blue,TEXT_REGULAR),
              ),

              SizedBox(width: MARGIN_XLARGE,),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_LARGE,vertical: MARGIN_MEDIUM),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(5.0)
                ),
                child: Row(
                  children: [
                    Icon(Icons.bookmark_add_outlined,color: Colors.white),
                    TypicalText("Add to wishlist", PRIMARY_COLOR, 16)
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: MARGIN_MEDIUM,),
          Row(
            children: [
              Icon(Icons.info_outline,color: HINT_TEXT_COLOR,),

              SizedBox(width: MARGIN_MEDIUM,),
              Expanded(
                child:
                  Text(
                    "Books that you buy on the Google Play website can be read in this app.",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: HINT_TEXT_COLOR,
                    fontSize: TEXT_REGULAR_SMALL,

                  ),
                ),

              )

            ],
          )
        ],
      ),
    );
  }
}

class AboutBookSectionView extends StatelessWidget {
  String? bookTitle;
  String? aboutBook;
  AboutBookSectionView({required this.bookTitle, required this.aboutBook});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2,vertical: MARGIN_MEDIUM_2),
      child: Column(
        children: [
          GestureDetector(
            onTap: (){
              _navigateToBooksAboutScreen(context,bookTitle??"",aboutBook??"");
            },
            child: Container(
              // margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2,vertical: MARGIN_MEDIUM_2),
                child: BookTypeListView(
                  bookTypes: bookTitle??"",
                )
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: MARGIN_MEDIUM_2),
            child:
            TypicalText(
                aboutBook??"",
                HINT_TEXT_COLOR,16),
          ),
        ],
      ),
    );
  }

  Future<dynamic> _navigateToBooksAboutScreen(BuildContext context,String bookTitle, String bookDescription) {
    return Navigator.push(context, MaterialPageRoute(
        builder: (context) => BookAboutViewPage(
          bookTitle: bookTitle,
          bookDescription: bookDescription,)
    )
    );
  }
}

class RatingsAndReviewSectionView extends StatelessWidget {
  const RatingsAndReviewSectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2,vertical: MARGIN_MEDIUM_2),
      child: Column(
        children: [
          GestureDetector(
            onTap: (){
              _navigateToBooksRatingsAndReviewsScreen(context);
            },
            child: Container(
                child: BookTypeListView(
                  bookTypes: 'Ratings And reviews',
                )
            ),
          ),
          RatingsAndReviewsView()
        ],
      ),
    );
  }

  Future<dynamic> _navigateToBooksRatingsAndReviewsScreen(BuildContext context) {
    return Navigator.push(context, MaterialPageRoute(
        builder: (context) => BookRatingsAndReviewsViewPage()
    )
    );
  }
}

class PublishedSectionView extends StatelessWidget {
  const PublishedSectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2,vertical: MARGIN_MEDIUM_2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TypicalText("Published", Colors.black, TEXT_REGULAR_1X,isFontWeight: true,),
          SizedBox(height: MARGIN_MEDIUM_2,),
          TypicalText("December 1, 2007 . Open Road + Grove/Atlantic", HINT_TEXT_COLOR, TEXT_REGULAR)
        ],
      ),
    );
  }
}

