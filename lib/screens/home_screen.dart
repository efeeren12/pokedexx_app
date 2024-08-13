import 'package:flutter/material.dart';
import 'package:pokedexx_app/widgets/app_title.dart';
import 'package:pokedexx_app/widgets/pokemon_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          AppTitle(),
          Expanded(child: PokemonList()),
        ],
      ),
    );
  }
}
