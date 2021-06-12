import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yt_framework/core/models/pokemon_details_model.dart';
import 'package:yt_framework/core/utils/adaptive.dart';
import 'package:yt_framework/pokemon_controller.dart';

class PokemonDetailsPage extends StatefulWidget {
  const PokemonDetailsPage({Key key, @required this.pokemonName})
      : super(key: key);

  final String pokemonName;

  @override
  _PokemonDetailsPageState createState() => _PokemonDetailsPageState();
}

class _PokemonDetailsPageState extends State<PokemonDetailsPage> {
  PokemonController pokemonController;
  Future<PokemonDetailsModel> pokemonDetailsFuture;

  void _setup() {
    pokemonController = Get.put(PokemonController());

    pokemonDetailsFuture = () {
      return pokemonController.fetchPokemonDetails(widget.pokemonName);
    }();
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
        title: Text('${widget.pokemonName}'.toUpperCase()),
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: pokemonDetailsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: AdaptiveActivityIndicator(),
              );
            }

            final PokemonDetailsModel pokemonDetails = snapshot.data;

            return Padding(
              padding: const EdgeInsets.all(16),
              child: Center(
                child: Column(
                  children: [
                    Image.network('${pokemonDetails.sprites.frontDefault}'),
                    Text('${pokemonDetails.name}'.toUpperCase()),
                    Wrap(
                      children: pokemonDetails.abilities
                          .map(
                            (e) => Container(
                              padding: const EdgeInsets.all(8),
                              margin: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: Colors.grey.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                '${e.ability.name}'.toUpperCase(),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
