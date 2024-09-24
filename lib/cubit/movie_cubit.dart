
import 'package:flutter_bloc/flutter_bloc.dart';

import '../api_manager.dart';
import 'movie_states.dart';


class MovieDetailsViewModel extends Cubit<MovieDetailsStates> {
  MovieDetailsViewModel() : super(MovieDetailsInitialState());

  void getAllDetails(int movieId) async {
    emit(MovieDetailsLoadingState());
    try {
      final movieDetails = await ApiManager.getMovieResponse(movieId);
      emit(MovieDetailsSuccessState(details: movieDetails));
    } catch (e) {
      emit(MovieDetailsErrorState("An error occurred: $e"));
    }
  }

  void getAllSimilarDetails(int movieId) async {
    emit(MovieDetailsLoadingState());
    try {
      final similarDetails = await ApiManager.getMovieResponse(movieId);
      emit(MovieSimilarDetailsSuccessState(details: similarDetails));
    } catch (e) {
      emit(MovieDetailsErrorState("An error occurred: $e"));
    }
  }
}