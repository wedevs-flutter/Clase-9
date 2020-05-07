// {
  // "name": "bulbasaur",
  // "url": "https://pokeapi.co/api/v2/pokemon/1/"
// }

class BasePokemon{
  String name;
  String url;

  BasePokemon({this.name, this.url});

  BasePokemon.fromJson(Map<String, dynamic> json){
    this.name = json['name'];
    this.url = json['url'];
  }
}