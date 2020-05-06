import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildTitles(),
          SizedBox(height: 12),
          _buildSearch(),
          SizedBox(height: 12),
        ],
      ),
    );
  }

  Widget _buildTitles() {
    return Row(
      children: <Widget>[
        GestureDetector(
          child: Text(
            'All',
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(width: 12),
        GestureDetector(
          child: Text(
            'Favourites',
            style: TextStyle(
              fontSize: 42,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSearch() {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: <Widget>[
          Icon(Icons.search, color: Colors.grey),
          SizedBox(width: 16),
          Text('Search...', style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
