import 'result.dart';

class SearchModel {
  int? page;
  List<SearchResultData>? results = [];
  int? totalPages;
  int? totalResults;

  SearchModel({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  factory SearchModel.fromJson(Map<String, dynamic> json) => SearchModel(
        page: json['page'] as int?,
        results: (json['results'] as List<dynamic>?)
            ?.map((e) => SearchResultData.fromJson(e as Map<String, dynamic>))
            .toList(),
        totalPages: json['total_pages'] as int?,
        totalResults: json['total_results'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'page': page,
        'results': results?.map((e) => e.toJson()).toList(),
        'total_pages': totalPages,
        'total_results': totalResults,
      };
}
