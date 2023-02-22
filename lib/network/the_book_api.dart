import 'package:dio/dio.dart';
import 'package:library_app/network/api_constant.dart';
import 'package:library_app/network/responses/get_overview_response.dart';
import 'package:retrofit/http.dart';

import 'responses/get_books_by_list_response.dart';

part 'the_book_api.g.dart';

@RestApi(baseUrl: BASE_URL_DIO)
abstract class TheBookApi {
  factory TheBookApi(Dio dio) = _TheBookApi;

  // @GET(ENDPOINT_GET_LIST_OVERVIEW)
  // Future<GetOverviewResponse> getOverviewBooks(
  //     @Query(PARAM_API_KEY) String apiKey,
  //     );

  @GET(ENDPOINT_GET_LIST_OVERVIEW)
  Future<GetOverviewResponse> getOverviewList(
      @Query(PARAM_API_KEY) String apiKey,
      @Query(PARAM_PUBLISHED_DATE) String publishedDate,
      );

  @GET(ENDPOINT_GET_BOOKS_BY_LISTNAME)
  Future<GetBooksByListNameResponse> getBooksByListName(
      @Query(PARAM_API_KEY) String apiKey,
      @Query(PARAM_LIST_NAME) String list,
      );
}