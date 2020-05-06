import 'package:pokemon_api_wedevs/models/type_pokemon.dart';

class DetailPokemon {
  int baseExperience;
  int id;
  String name;
  int order;
  int weight;
  List<TypePokemon> types;

  DetailPokemon({
    this.baseExperience,
    this.id,
    this.name,
    this.order,
    this.weight,
    this.types,
  });

  static List<DetailPokemon> listPokemonFake = [
    fakeBulbasur,
    fakeCharmander,
    fakeBulbasur,
    fakeCharmander,
    fakeBulbasur,
    fakeCharmander,
    fakeBulbasur,
    fakeCharmander,
  ];
}

final DetailPokemon fakeBulbasur = DetailPokemon(
  baseExperience: 1,
  id: 1,
  name: 'Bulbasur',
  order: 1,
  weight: 66,
  types: List<TypePokemon>()
    ..addAll([
      TypePokemon(name: 'Grass', url: 'url'),
      TypePokemon(name: 'Poison', url: 'url'),
    ]),
);
final DetailPokemon fakeCharmander = DetailPokemon(
  baseExperience: 1,
  id: 4,
  name: 'Charmander',
  order: 2,
  weight: 66,
  types: List<TypePokemon>()
    ..addAll([
      TypePokemon(name: 'Fire', url: 'url'),
    ]),
);
