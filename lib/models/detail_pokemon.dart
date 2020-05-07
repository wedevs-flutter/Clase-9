import 'package:pokemon_api_wedevs/models/type_pokemon.dart';

class DetailPokemon {
  int baseExperience;
  int id;
  String name;
  int order;
  int weight;
  List<BaseTypePokemon> types;

  DetailPokemon({
    this.baseExperience,
    this.id,
    this.name,
    this.order,
    this.weight,
    this.types,
  });

  DetailPokemon.fromJson(Map<String, dynamic> json){
    this.baseExperience = json['base_experience'];
    this.id = json['id'];
    this.name = json['name'];
    this.order = json['order'];
    this.weight = json['weight'];
    this.types = List.from(json['types'].map((myJson){
      return BaseTypePokemon.fromJson(myJson);
    }).toList());
  }

}

