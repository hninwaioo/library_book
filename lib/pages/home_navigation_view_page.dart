import 'package:flutter/material.dart';
import 'package:library_app/pages/search_google_book_view_page.dart';

import '../resources/colors.dart';
import '../resources/dimens.dart';
import 'books_view_page.dart';
import 'library_view_page.dart';

class HomeNavigationViewPage extends StatefulWidget {
  const HomeNavigationViewPage({Key? key}) : super(key: key);

  @override
  State<HomeNavigationViewPage> createState() => _HomeNavigationViewPageState();
}

class _HomeNavigationViewPageState extends State<HomeNavigationViewPage> {

  late List<Widget> _pages;
  late Widget _page1;
  late Widget _page2;
  late int _currentIndex;
  late Widget _currentPage;

  get prefixIcon => null;

  @override
  void initState() {
    super.initState();

    _page1 =  BooksViewPage();
    _page2 =  LibraryViewPage();

    _pages = [_page1, _page2,];
    _currentIndex = 0;
    _currentPage = _page1;
  }

  void _changeTab(int index) {
    setState(() {
      _currentIndex = index;
      _currentPage = _pages[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // shadowColor: Colors.black12,
        backgroundColor: PRIMARY_COLOR,
        title:  Card(
          child: Container(
            height: 50,
            child: Row(
              children: [
                Expanded(
                    child:
                    Container(
                      child:  TextField(
                        onTap: (){
                          FocusScope.of(context).unfocus();
                          _navigateToSearchBookPage(context);
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: prefixIcon??Icon(Icons.search_outlined,color: HINT_TEXT_COLOR,),
                          hintText: "Search Play Book",
                          hintStyle: TextStyle(
                              color: PRIMARY_HINT_COLOR
                          ),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                ),

                // Spacer(),
                GestureDetector(
                    onTap: (){
                      // _navigateToHomeNavigationScreen(context);
                      print("movieItemTap");
                    },
                    child: Container(
                        margin: EdgeInsets.only(left: MARGIN_MEDIUM_2),
                        height: 45,width: 45,

                        child: Image.asset("assets/images/user_female.png")
                    )
                )
              ],
            ),
          ),
        ),
      ),

      body: _currentPage,
      bottomNavigationBar:
      BottomNavigationBar(
        backgroundColor: PRIMARY_COLOR,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          _changeTab(index);
          print(index);
        },
        currentIndex: _currentIndex,

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(

            icon: Icon(Icons.library_books_sharp),
            label: 'Library',
          ),
        ],
        selectedItemColor: SIGN_PHONE_NUMBER_BUTTON_COLOR,
        unselectedItemColor: PRIMARY_HINT_COLOR,
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
