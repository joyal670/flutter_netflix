@freezed
class Downloads with _$Downloads {
  const factory Downloads({@JsonK required String? posterPath}) = _Downloads;

  factory Downloads.fromJson(Map<String, dynamic> json) =>
      _$DownloadsFromJson(json);
}
