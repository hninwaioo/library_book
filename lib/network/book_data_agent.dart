import 'package:library_app/data/vos/main_list_vo.dart';
import 'package:library_app/data/vos/results_vo.dart';

import '../data/vos/google_vos/google_book_vo.dart';


abstract class BookDataAgent {
  Future<ResultsVO?> getOverviewBooks();
  Future<List<GoogleBookVO>?> getBookListFromGoogle(String searchBookName);

}