import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_search/api_manager.dart';
import 'package:new_search/movieName.dart';

import 'MovieDetailsScreen.dart';
import 'cubit/movie_cubit.dart';
import 'cubit/movie_states.dart';

class Movie {
  final String title;
  final String year;
  final String actors;
  final String imageUrl;

  Movie({
    required this.title,
    required this.year,
    required this.actors,
    required this.imageUrl,
  });
}

class MovieSearchScreen extends StatefulWidget {
  MovieDetailsViewModel viewModel = MovieDetailsViewModel();
  @override
  _MovieSearchScreenState createState() => _MovieSearchScreenState();
}

class _MovieSearchScreenState extends State<MovieSearchScreen> {
  TextEditingController _searchController = TextEditingController();
  List<Movie> _allMovies = [
    Movie(
      title: 'Alita Battle Angel',
      year: '2019',
      actors: 'Rosa Salazar, Christoph Waltz',
      imageUrl: 'asset/Alita Battle Angel.jpg',
    ),
    Movie(
      title: 'Deadpool 2',
      year: '2018',
      actors: 'Ryan Reynolds, Josh Brolin',
      imageUrl: 'asset/deadpool2.jpeg',
    ),
    Movie(
      title: 'Deadpool 2',
      year: '2018',
      actors: 'Ryan Reynolds, Josh Brolin',
      imageUrl: 'asset/deadpool2.jpeg',
    ),
    Movie(
      title: 'Deadpool 2',
      year: '2018',
      actors: 'Ryan Reynolds, Josh Brolin',
      imageUrl: 'asset/deadpool2.jpeg',
    ),
    Movie(
      title: 'Deadpool 2',
      year: '2018',
      actors: 'Ryan Reynolds, Josh Brolin',
      imageUrl: 'asset/deadpool2.jpeg',
    ),
    Movie(
      title: 'Deadpool 2',
      year: '2018',
      actors: 'Ryan Reynolds, Josh Brolin',
      imageUrl: 'asset/deadpool2.jpeg',
    ),
    Movie(
      title: 'Deadpool 2',
      year: '2018',
      actors: 'Ryan Reynolds, Josh Brolin',
      imageUrl: 'asset/deadpool2.jpeg',
    ),
    Movie(
      title: 'Deadpool 2',
      year: '2018',
      actors: 'Ryan Reynolds, Josh Brolin',
      imageUrl: 'asset/deadpool2.jpeg',
    ),
    Movie(
      title: 'Deadpool 2',
      year: '2018',
      actors: 'Ryan Reynolds, Josh Brolin',
      imageUrl: 'asset/deadpool2.jpeg',
    ),
    Movie(
      title: 'Deadpool 2',
      year: '2018',
      actors: 'Ryan Reynolds, Josh Brolin',
      imageUrl: 'asset/deadpool2.jpeg',
    ),
    Movie(
      title: 'Deadpool 2',
      year: '2018',
      actors: 'Ryan Reynolds, Josh Brolin',
      imageUrl: 'asset/deadpool2.jpeg',
    ),
    Movie(
      title: 'Deadpool 2',
      year: '2018',
      actors: 'Ryan Reynolds, Josh Brolin',
      imageUrl: 'asset/deadpool2.jpeg',
    ),
    Movie(
      title: 'Deadpool 2',
      year: '2018',
      actors: 'Ryan Reynolds, Josh Brolin',
      imageUrl: 'asset/deadpool2.jpeg',
    ),
    Movie(
      title: 'Deadpool 2',
      year: '2018',
      actors: 'Ryan Reynolds, Josh Brolin',
      imageUrl: 'asset/deadpool2.jpeg',
    ),
  ];
  List<Movie> _filteredMovies = [];

  @override
  void initState() {
    super.initState();
    _filteredMovies = _allMovies;
    _searchController.addListener(_filterMovies);
  }

  void _filterMovies() {
    setState(() {
      String query = _searchController.text.toLowerCase();
      _filteredMovies = _allMovies.where((movie) {
        return movie.title.toLowerCase().contains(query);
      }).toList();
    });
  }

  void _navigateToMovieDetails(Movie movie) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MovieDetailsScreen(movie: movie),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailsViewModel, MovieDetailsStates>(
      bloc: viewModel,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Movie Search'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      border: InputBorder.none,
                      icon: Icon(Icons.search, color: Colors.white),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: _filteredMovies.isNotEmpty
                      ? ListView.builder(
                    itemCount: _filteredMovies.length,
                    itemBuilder: (context, index) {
                      Movie movie = _filteredMovies[index];
                      return ListTile(
                        leading: Image.asset(
                          movie.imageUrl,
                          width: 50,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                        title: Text(movie.title),
                        subtitle: Text('${movie.year}\n${movie.actors}'),
                        isThreeLine: true,
                        onTap: () => _navigateToMovieDetails(movie),
                      );
                    },
                  )
                      : Center(child: Text('No movies found')),
                ),
              ],
            ),
          ),
        );
      },

    );
  }
}
