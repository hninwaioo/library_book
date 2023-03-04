import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:library_app/pages/home_navigation_view_page.dart';
import 'package:library_app/persistence/hive_constants.dart';
import 'data/vos/book_vo.dart';
import 'data/vos/buy_links_vo.dart';
import 'data/vos/main_list_vo.dart';
import 'data/vos/results_vo.dart';
import 'data/vos/shelf_vo.dart';

// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: HomeNavigationViewPage(),
//     );
//   }
// }


Future<void> main() async {
  await Hive.initFlutter();

  Hive.registerAdapter(BookVOAdapter());
  Hive.registerAdapter(BuyLinksVOAdapter());
  Hive.registerAdapter(MainListVOAdapter());
  Hive.registerAdapter(ResultsVOAdapter());
  Hive.registerAdapter(ShelfVOAdapter());


  await Hive.openBox<MainListBookSectionVO>(BOX_NAME_MAIN_LIST_VO);
  await Hive.openBox<BookVO>(BOX_NAME_BOOK_VO);
  await Hive.openBox<ShelfVO>(BOX_NAME_SHELF_VO);

  // await Hive.openBox<MovieVO>(BOX_NAME_MOVIE_VO);
  // await Hive.openBox<GenresVO>(BOX_NAME_GENRE_VO);

  // RetrofitDataAgentImpl().getNowPlayingMovies(1);
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity
        ),
        home: HomeNavigationViewPage(),
      );
    //   ScopedModel(
    //     model: MovieModelImpl(),
    //     child: MaterialApp(
    //       title: 'Flutter Demo',
    //       debugShowCheckedModeBanner: false,
    //       theme: ThemeData(
    //           primarySwatch: Colors.blue,
    //           visualDensity: VisualDensity.adaptivePlatformDensity
    //       ),
    //       home: HomePage(),
    //     )
    // );
  }
}