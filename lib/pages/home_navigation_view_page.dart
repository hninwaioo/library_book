import 'package:flutter/material.dart';
import 'package:library_app/pages/search_google_book_view_page.dart';

import '../resources/colors.dart';
import '../resources/dimens.dart';
import '../resources/strings.dart';
import 'books_view_page.dart';
import 'home_page.dart';
import 'library_view_page.dart';

class HomeNavigationViewPage extends StatefulWidget {
  const HomeNavigationViewPage({Key? key}) : super(key: key);

  @override
  State<HomeNavigationViewPage> createState() => _HomeNavigationViewPageState();
}

class _HomeNavigationViewPageState extends State<HomeNavigationViewPage> {

  // late List<Widget> _pages;
  // late Widget _page1;
  // late Widget _page2;
  // late int _currentIndex;
  // late Widget _currentPage;
  //
  // get prefixIcon => null;
  //
  // @override
  // void initState() {
  //   super.initState();
  //
  //   _page1 =  HomePageRoot();
  //   _page2 =  LibraryViewPage();
  //
  //   _pages = [_page1, _page2,];
  //   _currentIndex = 0;
  //   _currentPage = _page1;
  // }
  //
  // void _changeTab(int index) {
  //   setState(() {
  //     _currentIndex = index;
  //     _currentPage = _pages[index];
  //   });
  // }
  //
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     // appBar: AppBar(
  //     //   // shadowColor: Colors.black12,
  //     //   backgroundColor: PRIMARY_COLOR,
  //     //   title:  Card(
  //     //     child: Container(
  //     //       height: 50,
  //     //       child: Row(
  //     //         children: [
  //     //           Expanded(
  //     //               child:
  //     //               Container(
  //     //                 child:  TextField(
  //     //                   onTap: (){
  //     //                     FocusScope.of(context).unfocus();
  //     //                     _navigateToSearchBookPage(context);
  //     //                   },
  //     //                   decoration: InputDecoration(
  //     //                     border: InputBorder.none,
  //     //                     prefixIcon: prefixIcon??Icon(Icons.search_outlined,color: HINT_TEXT_COLOR,),
  //     //                     hintText: "Search Play Book",
  //     //                     hintStyle: TextStyle(
  //     //                         color: PRIMARY_HINT_COLOR
  //     //                     ),
  //     //                   ),
  //     //                   textAlign: TextAlign.center,
  //     //                 ),
  //     //               )
  //     //           ),
  //     //
  //     //           // Spacer(),
  //     //           GestureDetector(
  //     //               onTap: (){
  //     //                 // _navigateToHomeNavigationScreen(context);
  //     //                 print("movieItemTap");
  //     //               },
  //     //               child: Container(
  //     //                   margin: EdgeInsets.only(left: MARGIN_MEDIUM_2),
  //     //                   height: 45,width: 45,
  //     //
  //     //                   child: Image.asset("assets/images/user_female.png")
  //     //               )
  //     //           )
  //     //         ],
  //     //       ),
  //     //     ),
  //     //   ),
  //     // ),
  //     appBar: PreferredSize(
  //       preferredSize: Size(
  //         MediaQuery.of(context).size.width,
  //         MediaQuery.of(context).size.height / 10,
  //       ),
  //       child: AppBarCustomDesignView(
  //         imageUrl:
  //           "https://wallpapercave.com/wp/wp4810267.jpg"
  //       ),
  //     ),
  //     body: _currentPage,
  //     bottomNavigationBar:
  //     BottomNavigationBar(
  //       backgroundColor: PRIMARY_COLOR,
  //       type: BottomNavigationBarType.fixed,
  //       onTap: (index) {
  //         _changeTab(index);
  //         print(index);
  //       },
  //       currentIndex: _currentIndex,
  //
  //       items: const <BottomNavigationBarItem>[
  //         BottomNavigationBarItem(
  //           icon: Icon(Icons.home_outlined),
  //           label: 'Home',
  //         ),
  //         BottomNavigationBarItem(
  //
  //           icon: Icon(Icons.library_books_sharp),
  //           label: 'Library',
  //         ),
  //       ],
  //       selectedItemColor: SIGN_PHONE_NUMBER_BUTTON_COLOR,
  //       unselectedItemColor: PRIMARY_HINT_COLOR,
  //     ),
  //   );
  // }

  int currentIndex = 0;

  late List<Widget> screens = [BooksViewPage(), LibraryViewPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size(
              MediaQuery.of(context).size.width,
              MediaQuery.of(context).size.height / 10,
            ),
            child: AppBarCustomDesignView(
              imageUrl:
                "https://wallpapercave.com/wp/wp4810267.jpg"
            ),
          ),
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        currentIndex: currentIndex,
        onTap: (i) {
          setState(() {
            currentIndex = i;
          });
        },
        unselectedLabelStyle: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
        selectedLabelStyle: TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(
              Icons.library_books_outlined,
            ),
            label: "Library",
          ),
        ],
      ),
    );
  }
}

class AppBarCustomDesignView extends StatelessWidget {
  String imageUrl;
  AppBarCustomDesignView({required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          margin: EdgeInsets.only(
            bottom: 6,
          ),
          height: MediaQuery.of(context).size.height / 15,
          width: MediaQuery.of(context).size.width / 1.1,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.black12,
              width: 1.0,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 2),
              ),
            ],
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 30,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchGoogleBookViewPage(),
                    ),
                  );
                },
                child: Row(
                  children: [
                     Icon(
                        Icons.search,
                        size: 20,
                      ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 20,
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        bottom: 5,
                      ),
                      height: MediaQuery.of(context).size.height / 17,
                      width: MediaQuery.of(context).size.width / 2.6,
                      child: TextField(
                        enabled: false,

                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: SEARCH_PLAY_BOOKS,
                            enabled: false
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                width: MediaQuery.of(context).size.width / 4,
              ),

              Container(
                padding: EdgeInsets.all(
                  2,
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.fromBorderSide(
                    BorderSide(color: Colors.red, width: 2.0),
                  ),
                ),
                child: CircleAvatar(
                  radius: 15,
                  backgroundImage:
                  // Image.asset("assets/images/user_female.png")
                  NetworkImage(
                    imageUrl,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> _navigateToSearchBookPage(BuildContext context,) {
    return Navigator.push(context, MaterialPageRoute(
        builder: (context) => SearchGoogleBookViewPage()
    )
    );
  }
}
