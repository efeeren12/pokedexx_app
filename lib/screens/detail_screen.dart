import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedexx_app/constants/ui_helper.dart';
import 'package:pokedexx_app/model/pokemon_model.dart';
import 'package:pokedexx_app/widgets/poke_information.dart';
import 'package:pokedexx_app/widgets/poke_type_name.dart';

// ignore: must_be_immutable
class DetailScreen extends StatelessWidget {
  PokemonModel pokemon;
  DetailScreen({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    String pokeballImageUrl = 'images/pokeball.png';
    return Scaffold(
      backgroundColor: UIHelper.getColorFromType(pokemon.type![0]),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: UIHelper.getDefaultPadding(),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios,
                    color: Colors.white, size: 30),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            PokeNameType(pokemon: pokemon),
            SizedBox(height: 20.h),
            Expanded(
              child: Stack(
                children: [
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Image.asset(pokeballImageUrl, height: 0.15.sh, fit: BoxFit.fitHeight,),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    top: 0.12.sh,
                    child: PokeInfo(pokemon: pokemon)),
                  Align(
                    alignment: Alignment.topCenter,
                    child: CachedNetworkImage(imageUrl: pokemon.img ?? '', height: 0.20.sh,fit: BoxFit.fitHeight, placeholder: (context, url) => const CircularProgressIndicator(color: Colors.black,),),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
