import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedexx_app/constants/constants.dart';
import 'package:pokedexx_app/constants/ui_helper.dart';
import 'package:pokedexx_app/model/pokemon_model.dart';

class PokeInfo extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeInfo({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10.w),
        ),
      ),
      child: Padding(
        padding: UIHelper.getDefaultPadding(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildInfoRow('Name', pokemon.name),
            _buildInfoRow('Height', pokemon.height),
            _buildInfoRow('Weight', pokemon.weight),
            _buildInfoRow('Spawn Time', pokemon.spawnTime),
            _buildInfoRow('Weakness', pokemon.weaknesses),
            _buildInfoRow('Pre Evolution', pokemon.prevEvolution),
            _buildInfoRow('Next Evolution', pokemon.nextEvolution),
          ],
        ),
      ),
    );
  }

  _buildInfoRow(String label, dynamic value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: Constants.getPokeInfoLabelTextStyle(),
        ),
        if (value is List && value.isNotEmpty)
          Text(
            value.join(' , '),
            style: Constants.getPokeInfoTextStyle(),
          )
        else if (value == null)
          const Text('Not Available')
        else
          Text(value.toString()),
      ],
    );
  }
}
