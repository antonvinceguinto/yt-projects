import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:yt_framework/core/models/pokemon_details_model.dart';
import 'package:yt_framework/core/models/pokemon_list_model.dart';
import 'package:yt_framework/core/services/api.dart';
import 'package:yt_framework/core/utils/adaptive.dart';
import 'package:http/http.dart' as http;

class PokemonController extends GetxController {
  Future fetchPokemonList(
    PagingController<int, Result> pagingController,
    int pageKey,
  ) async {
    print('pagekey: $pageKey');
    try {
      PokemonListModel newItems = await fetchPokemons(pageKey);

      final isLastPage = newItems.results.length >= newItems.count;
      if (isLastPage) {
        pagingController.appendLastPage(newItems.results);
      } else {
        final nextPageKey = pageKey + newItems.results.length;
        pagingController.appendPage(newItems.results, nextPageKey);
      }
    } catch (error) {
      print(error);
      pagingController.error = error;
    }
  }

  Future<PokemonListModel> fetchPokemons(int pageKey) async {
    try {
      final res = await Api.get('pokemon/?offset=$pageKey&limit=20');

      return compute(pokemonListModelFromJson, res.body);
    } catch (e) {
      return showAlertDialog(
        'Error',
        'Something went wrong',
      );
    }
  }

  Future<PokemonDetailsModel> fetchPokemonDetails(String pokemonName) async {
    try {
      final res = await Api.get('pokemon/$pokemonName');

      return compute(pokemonDetailsModelFromJson, res.body);
    } catch (e) {
      return showAlertDialog(
        'Error',
        'Something went wrong',
      );
    }
  }
}
