import 'package:flutter/material.dart';
import 'package:library_app/pages/search_google_book_view_page.dart';
import '../resources/strings.dart';
import 'books_view_page.dart';
import 'library_view_page.dart';

class HomeNavigationViewPage extends StatefulWidget {
  const HomeNavigationViewPage({Key? key}) : super(key: key);

  @override
  State<HomeNavigationViewPage> createState() => _HomeNavigationViewPageState();
}

class _HomeNavigationViewPageState extends State<HomeNavigationViewPage> {

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
            child: AppBarSearchBookSectionView(
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

class AppBarSearchBookSectionView extends StatelessWidget {
  String imageUrl;
  AppBarSearchBookSectionView({required this.imageUrl});
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
                    gradient:
                    LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [Colors.red,Colors.blue,Colors.yellow,Colors.green]
                    ),
                ),
                child: Container(
                  height: 35,
                  width: 35,
                  child: CircleAvatar(
                    radius: 15,
                    backgroundImage:
                    NetworkImage(
                      imageUrl,
                    ),
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
