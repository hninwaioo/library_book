import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../data/vos/results_vo.dart';

part 'get_overview_response.g.dart';

@JsonSerializable()

class GetOverviewResponse {

  @JsonKey(name: "status")
  String? status;

  // "copyright": "Copyright (c) 2022 The New York Times Company.  All Rights Reserved.",
  @JsonKey(name: "copyright")
  String? copyright;

  // "num_results": 90,
  @JsonKey(name: "num_results")
  int? num_results;

  //results
  @JsonKey(name: "results")
  ResultsVO? results;

  GetOverviewResponse(
      this.status, this.copyright, this.num_results, this.results);

  factory GetOverviewResponse.fromJson(Map<String,dynamic> json) => _$GetOverviewResponseFromJson(json);
  Map<String,dynamic> toJson() => _$GetOverviewResponseToJson(this);

  @override
  String toString() {
    return 'GetOverviewResponse{status: $status, copyright: $copyright, num_results: $num_results, results: $results}';
  }
}