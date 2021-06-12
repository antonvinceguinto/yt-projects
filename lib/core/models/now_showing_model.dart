// To parse this JSON data, do
//
//     final nowShowingModel = nowShowingModelFromJson(jsonString);

import 'dart:convert';

NowShowingModel nowShowingModelFromJson(String str) =>
    NowShowingModel.fromJson(json.decode(str));

String nowShowingModelToJson(NowShowingModel data) =>
    json.encode(data.toJson());

class NowShowingModel {
  NowShowingModel({
    this.dates,
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  final Dates dates;
  final int page;
  final List<Result> results;
  final int totalPages;
  final int totalResults;

  factory NowShowingModel.fromJson(Map<String, dynamic> json) =>
      NowShowingModel(
        dates: json['dates'] == null ? null : Dates.fromJson(json['dates']),
        page: json['page'] == null ? null : json['page'],
        results: json['results'] == null
            ? null
            : List<Result>.from(json['results'].map((x) => Result.fromJson(x))),
        totalPages: json['total_pages'] == null ? null : json['total_pages'],
        totalResults:
            json['total_results'] == null ? null : json['total_results'],
      );

  Map<String, dynamic> toJson() => {
        'dates': dates == null ? null : dates.toJson(),
        'page': page == null ? null : page,
        'results': results == null
            ? null
            : List<dynamic>.from(results.map((x) => x.toJson())),
        'total_pages': totalPages == null ? null : totalPages,
        'total_results': totalResults == null ? null : totalResults,
      };
}

class Dates {
  Dates({
    this.maximum,
    this.minimum,
  });

  final DateTime maximum;
  final DateTime minimum;

  factory Dates.fromJson(Map<String, dynamic> json) => Dates(
        maximum:
            json['maximum'] == null ? null : DateTime.parse(json['maximum']),
        minimum:
            json['minimum'] == null ? null : DateTime.parse(json['minimum']),
      );

  Map<String, dynamic> toJson() => {
        'maximum': maximum == null
            ? null
            : '${maximum.year.toString().padLeft(4, '0')}-${maximum.month.toString().padLeft(2, '0')}-${maximum.day.toString().padLeft(2, '0')}',
        'minimum': minimum == null
            ? null
            : '${minimum.year.toString().padLeft(4, '0')}-${minimum.month.toString().padLeft(2, '0')}-${minimum.day.toString().padLeft(2, '0')}',
      };
}

class Result {
  Result({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  final bool adult;
  final String backdropPath;
  final List<int> genreIds;
  final int id;
  final OriginalLanguage originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final DateTime releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        adult: json['adult'] == null ? null : json['adult'],
        backdropPath:
            json['backdrop_path'] == null ? null : json['backdrop_path'],
        genreIds: json['genre_ids'] == null
            ? null
            : List<int>.from(json['genre_ids'].map((x) => x)),
        id: json['id'] == null ? null : json['id'],
        originalLanguage: json['original_language'] == null
            ? null
            : originalLanguageValues.map[json['original_language']],
        originalTitle:
            json['original_title'] == null ? null : json['original_title'],
        overview: json['overview'] == null ? null : json['overview'],
        popularity:
            json['popularity'] == null ? null : json['popularity'].toDouble(),
        posterPath: json['poster_path'] == null ? null : json['poster_path'],
        releaseDate: json['release_date'] == null
            ? null
            : DateTime.parse(json['release_date']),
        title: json['title'] == null ? null : json['title'],
        video: json['video'] == null ? null : json['video'],
        voteAverage: json['vote_average'] == null
            ? null
            : json['vote_average'].toDouble(),
        voteCount: json['vote_count'] == null ? null : json['vote_count'],
      );

  Map<String, dynamic> toJson() => {
        'adult': adult == null ? null : adult,
        'backdrop_path': backdropPath == null ? null : backdropPath,
        'genre_ids': genreIds == null
            ? null
            : List<dynamic>.from(genreIds.map((x) => x)),
        'id': id == null ? null : id,
        'original_language': originalLanguage == null
            ? null
            : originalLanguageValues.reverse[originalLanguage],
        'original_title': originalTitle == null ? null : originalTitle,
        'overview': overview == null ? null : overview,
        'popularity': popularity == null ? null : popularity,
        'poster_path': posterPath == null ? null : posterPath,
        'release_date': releaseDate == null
            ? null
            : '${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}',
        'title': title == null ? null : title,
        'video': video == null ? null : video,
        'vote_average': voteAverage == null ? null : voteAverage,
        'vote_count': voteCount == null ? null : voteCount,
      };
}

enum OriginalLanguage { EN, JA, KO }

final originalLanguageValues = EnumValues({
  'en': OriginalLanguage.EN,
  'ja': OriginalLanguage.JA,
  'ko': OriginalLanguage.KO
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
