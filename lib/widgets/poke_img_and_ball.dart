import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedexx_app/constants/ui_helper.dart';
import 'package:pokedexx_app/model/pokemon_model.dart';

class PokeImageAndBall extends StatelessWidget {
  const PokeImageAndBall({super.key, required this.pokemon});
  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) {
    String pokeballImageUrl = 'images/pokeball.png';

    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: Image.asset(
            pokeballImageUrl,
            height: UIHelper.calculatePokeImgAndBallSize(),
            width: UIHelper.calculatePokeImgAndBallSize(),
            fit: BoxFit.fitHeight,
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: CachedNetworkImage(
            imageUrl: pokemon.img ?? '',
            height: UIHelper.calculatePokeImgAndBallSize(),
            width: UIHelper.calculatePokeImgAndBallSize(),
            fit: BoxFit.fitHeight,
            placeholder: (context, url) => const CircularProgressIndicator(
              color: Colors.black,
            ),
          ),
        )
      ],
    );
  }
}
