class TypePokemon {
  String name;
  String url;

  TypePokemon({this.name, this.url});

  TypePokemon.fromJson(Map<String, dynamic> json) {
    this.name = json['name'];
    this.url = json['url'];
  }
}

// "types": [
//     {
//       "slot": 1,
//       "type": {
//         "name": "fire",
//         "url": "https://pokeapi.co/api/v2/type/10/"
//       }
//     }
//   ],

class BaseTypePokemon {
  int slot;
  TypePokemon type;

  BaseTypePokemon({this.slot, this.type});

  BaseTypePokemon.fromJson(Map<String, dynamic> json) {
    this.slot = json['slot'];
    this.type = TypePokemon.fromJson(json['type']);
  }
}
