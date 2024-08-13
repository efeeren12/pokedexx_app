import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedexx_app/constants/constants.dart';
import 'package:pokedexx_app/model/pokemon_model.dart';

class PokeNameType extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeNameType({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0.05.sh),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  pokemon.name ?? 'N/A',
                  style: Constants.getPokemonNameTextStyle(),
                ),
              ),
              Text('#${pokemon.num ?? 'N/A'}',
                  style: Constants.getPokemonNameTextStyle())
            ],
          ),
          SizedBox(height: 0.02.sh),
          Chip(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              backgroundColor: Colors.brown.shade400,
              label: Text(pokemon.type?.join(' , ') ?? '',
                  style: Constants.getTypeChipTextStyle())),
        ],
      ),
    );
  }
}
