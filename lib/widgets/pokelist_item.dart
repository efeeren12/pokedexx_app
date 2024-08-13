import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedexx_app/constants/constants.dart';
import 'package:pokedexx_app/constants/ui_helper.dart';
import 'package:pokedexx_app/model/pokemon_model.dart';
import 'package:pokedexx_app/screens/detail_screen.dart';
import 'package:pokedexx_app/widgets/poke_img_and_ball.dart';

class PokeListItem extends StatelessWidget {
  final PokemonModel pokemon;
  const PokeListItem({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(pokemon: pokemon)));
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.w)),
        elevation: 3,
        shadowColor: Colors.white,
        color: UIHelper.getColorFromType(pokemon.type![0]),
        child: Padding(
          padding: UIHelper.getDefaultPadding(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                pokemon.name ?? 'N/A',
                style: Constants.getPokemonNameTextStyle(),
              ),
              Chip(
                backgroundColor: Colors.brown.shade400,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                label: Text(
                  pokemon.type![0],
                  style: Constants.getTypeChipTextStyle(),
                ),
              ),
              Expanded(child: PokeImageAndBall(pokemon: pokemon)),
            ],
          ),
        ),
      ),
    );
  }
}
