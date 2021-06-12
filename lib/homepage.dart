import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:yt_framework/core/models/pokemon_list_model.dart';
import 'package:yt_framework/pokemon_controller.dart';
import 'package:yt_framework/pokemon_details.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PokemonController pokemonController;
  Future<PokemonListModel> pokemonListFuture;

  final PagingController<int, Result> _pagingController =
      PagingController(firstPageKey: 0);

  void _setup() {
    pokemonController = Get.put(PokemonController());

    _pagingController.addPageRequestListener((pageKey) {
      pokemonController.fetchPokemonList(_pagingController, pageKey);
    });
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _setup();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokedex'),
      ),
      body: SafeArea(
        child: PagedListView<int, Result>(
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate<Result>(
              itemBuilder: (context, item, index) {
            final Result pokemon = item;
            return ListTile(
              onTap: () {
                Get.to(
                  PokemonDetailsPage(pokemonName: pokemon.name),
                );
              },
              title: Text('${pokemon.name}'.toUpperCase()),
            );
          }),
        ),
      ),
    );
  }
}
