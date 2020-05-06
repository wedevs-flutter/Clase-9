import 'package:flutter/material.dart';
import 'package:pokemon_api_wedevs/models/detail_pokemon.dart';

class PokemonItem extends StatelessWidget {
  final DetailPokemon pokemon;

  PokemonItem({this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 150,
          // color: Colors.red,
          child: _buildItem(),
        ),
        Divider(
          color: Colors.grey,
          height: 0,
        ),
      ],
    );
  }

  Widget _buildItem() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        // image
        Expanded(
          child: Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.grey[350],
            ),
            child: FadeInImage(
              placeholder: AssetImage('assets/pokeball.png'),
              image: NetworkImage(
                'https://pokeres.bastionbot.org/images/pokemon/${pokemon.id}.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        // detail
        Expanded(
          flex: 2,
          child: Container(
            padding: const EdgeInsets.only(
              left: 12,
              top: 8,
              right: 8,
              bottom: 8,
            ),
            child: _dataPokemon(),
          ),
        ),
      ],
    );
  }

  Widget _dataPokemon() {
    return Column(
      children: <Widget>[
        SizedBox(height: 8),
        _nameAndStart(),
        SizedBox(height: 8),
        _listType(),
        Expanded(child: _description()),
      ],
    );
  }

  Widget _nameAndStart() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          '${pokemon.id}',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 18,
            fontWeight: FontWeight.w800,
          ),
        ),
        SizedBox(width: 8),
        Text(
          pokemon.name,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w800,
            letterSpacing: 1.2,
          ),
        ),
        Spacer(),
        GestureDetector(
          onTap: () {},
          child: Icon(Icons.star, color: Colors.grey[300]),
        ),
      ],
    );
  }

  Widget _listType() {
    return Row(
      children: pokemon.types
          .map(
            (type) => _chipTypePokemon(type.name),
          )
          .toList(),
    );
  }

  Widget _description() {
    return Container(
      padding: EdgeInsets.only(top: 12),
      child: Text(
        'aqui se viene la descripcion del pokemon para todos los pokemones',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _chipTypePokemon(String name) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.yellow,
      ),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Text(name.toString()),
    );
  }
}
