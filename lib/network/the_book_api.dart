import 'package:dio/dio.dart';
import 'package:library_app/network/api_constant.dart';
import 'package:library_app/network/responses/get_overview_response.dart';
import 'package:retrofit/http.dart';

part 'the_book_api.g.dart';

@RestApi(baseUrl: BASE_URL_DIO)
abstract class TheBookApi {
  factory TheBookApi(Dio dio) = _TheBookApi;

  @GET(ENDPOINT_GET_LIST_OVERVIEW)
  Future<GetOverviewResponse> getOverviewBooks(
      @Query(PARAM_API_KEY) String apiKey,
      );
}