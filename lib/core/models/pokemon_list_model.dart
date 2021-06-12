// To parse this JSON data, do
//
//     final pokemonListModel = pokemonListModelFromJson(jsonString);

import 'dart:convert';

PokemonListModel pokemonListModelFromJson(String str) =>
    PokemonListModel.fromJson(json.decode(str));

String pokemonListModelToJson(PokemonListModel data) =>
    json.encode(data.toJson());

class PokemonListModel {
  PokemonListModel({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  final int count;
  final String next;
  final dynamic previous;
  final List<Result> results;

  factory PokemonListModel.fromJson(Map<String, dynamic> json) =>
      PokemonListModel(
        count: json['count'] == null ? null : json['count'],
        next: json['next'] == null ? null : json['next'],
        previous: json['previous'],
        results: json['results'] == null
            ? null
            : List<Result>.from(json['results'].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'count': count == null ? null : count,
        'next': next == null ? null : next,
        'previous': previous,
        'results': results == null
            ? null
            : List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    this.name,
    this.url,
  });

  final String name;
  final String url;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        name: json['name'] == null ? null : json['name'],
        url: json['url'] == null ? null : json['url'],
      );

  Map<String, dynamic> toJson() => {
        'name': name == null ? null : name,
        'url': url == null ? null : url,
      };
}
