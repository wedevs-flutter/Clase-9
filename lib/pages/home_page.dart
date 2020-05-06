import 'package:flutter/material.dart';

import 'package:pokemon_api_wedevs/models/detail_pokemon.dart';
import 'package:pokemon_api_wedevs/widgets/app_bar_widget.dart';
import 'package:pokemon_api_wedevs/widgets/pokemon_item.dart';

class HomePage extends StatelessWidget {
  final List<DetailPokemon> _fakeList = DetailPokemon.listPokemonFake;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(right: 8, left: 8, top: 44),
        child: Column(
          children: <Widget>[
            AppBarWidget(),
            // TODO: A custom tabBar
            Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                shrinkWrap: true,
                itemCount: _fakeList.length,
                itemBuilder: (context, index) =>
                    PokemonItem(pokemon: _fakeList[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
