import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:pokemon_api_wedevs/models/base_pokemon.dart';
import 'package:pokemon_api_wedevs/models/detail_pokemon.dart';

class RestProvider {
  final String _baseUrl = 'https://pokeapi.co/api/v2';
  // 'https://pokeres.bastionbot.org/images/pokemon/{$id}.png';

  Future<List<DetailPokemon>> getBasePokemon() async {
    print('haciendo la peticion');
    try {
      http.Response response = await http.get('$_baseUrl/pokemon');
      if (response.statusCode == 200) {
        print('*****RESPONSE***');
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> list = json['results'];
        List<BasePokemon> listBasPok = List();
        List<DetailPokemon> listDetailPokemon = List();

        for (int i = 0; i < list.length; i++)
          listBasPok.add(BasePokemon.fromJson(list[i]));

        for (int i = 0; i < listBasPok.length; i++) {
          DetailPokemon detailPokemon = await getPokemonUrl(listBasPok[i].url);
          listDetailPokemon.add(detailPokemon);
        }
        print('llegando al final');
        return listDetailPokemon;
      } else {
        throw Exception('error al hacer la peticion');
      }
    } on SocketException {
      print('fallo de red');
      return null;
    }
  }

  Future<DetailPokemon> getPokemonUrl(String url) async {
    try {
      http.Response response = await http.get(url);
      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        return DetailPokemon.fromJson(json);
      } else {
        throw Exception('error al hacer la peticion');
      }
    } on SocketException {
      print('fallo de red');
      return null;
    }
  }
}
