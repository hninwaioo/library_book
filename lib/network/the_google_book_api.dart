import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import 'api_constant.dart';
import 'responses/google_book_list_response.dart';

part 'the_google_book_api.g.dart';

@RestApi(baseUrl: BASE_GOOGLE_BOOK_URL_DIO)
abstract class TheGoogleBookApi{
  factory TheGoogleBookApi(Dio dio) = _TheGoogleBookApi;


  @GET(ENDPOINT_GET_LIST_GOOGLE_BOOK)
  Future<GoogleBookListResponse> getBookListFromGoogle(
      @Query("q") String searchBookName,
      );

}