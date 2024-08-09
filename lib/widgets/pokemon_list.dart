import 'package:flutter/material.dart';
import 'package:pokedexx_app/model/pokemon_model.dart';
import 'package:pokedexx_app/services/pokemon_api.dart';

class PokemonList extends StatefulWidget {
  const PokemonList({super.key});

  @override
  State<PokemonList> createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
    late Future<List<PokemonModel>> _pokemonListFuture;

    @override
  void initState() {
    super.initState();
    _pokemonListFuture = PokeApi.fetchPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PokemonModel>>(
        future: _pokemonListFuture,
        builder:
            (BuildContext context, AsyncSnapshot<List<PokemonModel>> snapshot) {
          if (snapshot.hasData) {

            List<PokemonModel> pokemons = snapshot.data!;

            return ListView.builder(
              itemCount: pokemons.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(pokemons[index].name!),
                );
              },
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('Error'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      );
  }
}