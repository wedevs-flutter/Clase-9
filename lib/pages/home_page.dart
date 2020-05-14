import 'package:flutter/material.dart';

import 'package:pokemon_api_wedevs/models/detail_pokemon.dart';
import 'package:pokemon_api_wedevs/providers/rest_provider.dart';
import 'package:pokemon_api_wedevs/widgets/app_bar_widget.dart';
import 'package:pokemon_api_wedevs/widgets/pokemon_item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future _future;
  RestProvider _provider = RestProvider();

  @override
  void initState() {
    print('*********ENTRANDO AL INIT STATE');
    _future = _provider.getBasePokemon();
    super.initState();
  }

  @override
  void dispose() {
    print('********* ENTRANDO AL DISPOSE');
    super.dispose();
  }

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
              // child: ListView.builder(
              //   physics: BouncingScrollPhysics(),
              //   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              //   shrinkWrap: true,
              //   itemCount: _fakeList.length,
              //   itemBuilder: (context, index) =>
              //       PokemonItem(pokemon: _fakeList[index]),
              // ),
              child: FutureBuilder(
                future: _future,
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('error en la peticion'),
                    );
                  }
                  if (snapshot.hasData) {
                    List<DetailPokemon> data = snapshot.data;

                    return ListView.builder(
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 12,
                      ),
                      shrinkWrap: true,
                      itemCount: data.length,
                      itemBuilder: (context, index) =>
                          PokemonItem(pokemon: data[index]),
                    );
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
