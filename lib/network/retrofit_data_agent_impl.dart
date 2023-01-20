import 'package:library_app/data/vos/results_vo.dart';
import 'package:library_app/network/book_data_agent.dart';
import 'package:library_app/network/the_book_api.dart';
import 'package:dio/dio.dart';
import 'package:library_app/network/the_google_book_api.dart';

import '../data/vos/google_vos/google_book_vo.dart';
import 'api_constant.dart';

class RetrofitDataAgentImpl extends BookDataAgent{

  late TheBookApi mApi;
  late TheGoogleBookApi googleBookApi;

  static final RetrofitDataAgentImpl _singleton = RetrofitDataAgentImpl._internal();

  factory RetrofitDataAgentImpl(){
    return _singleton;
  }

  RetrofitDataAgentImpl._internal(){
    final dio = Dio();
    mApi = TheBookApi(dio);

    final gDio = Dio(
      BaseOptions(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
        headers: {
          HEADER_REQUESTED_WITH: XML_HTTP_REQUEST,
        },
      ),
    );

    googleBookApi = TheGoogleBookApi(gDio);
  }

  @override
  Future<ResultsVO?> getOverviewBooks() {
    return mApi.getOverviewBooks(API_KEY)
        .asStream()
        .map((response) => response.results)
        .first;
  }

  @override
  Future<List<GoogleBookVO>?> getBookListFromGoogle(String searchBookName) {
    return googleBookApi
        .getBookListFromGoogle(searchBookName)
        .asStream()
        .map((response) => response.bookItems)
        .first;
  }
}