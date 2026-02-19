import 'package:flutter/material.dart';

class MovieInfoScreen extends StatelessWidget {
  static const name = 'movie-screen';

  final String movieId;
  

  const MovieInfoScreen({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MovieID: $movieId'),
      ),
    );
  }
}
