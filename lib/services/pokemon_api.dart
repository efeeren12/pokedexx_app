import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:pokedexx_app/model/pokemon_model.dart';

class PokeApi {
  static const String _baseUrl =
      'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';

  static Future<List<PokemonModel>> fetchPokemons() async {
    List<PokemonModel> _pokemons = [];

   var result = await Dio().get(_baseUrl);
   var pokeList = jsonDecode(result.data)['pokemon'];

   if(pokeList is List){
    _pokemons = pokeList.map((e) => PokemonModel.fromJson(e)).toList();
   }

    return _pokemons;
  }
}
