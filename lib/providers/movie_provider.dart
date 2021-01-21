import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tmdbap/data_access_layer/model/Movie.dart';
import 'package:tmdbap/data_access_layer/repo/movie_repo.dart';



class MovieProvider extends ChangeNotifier{

  MovieProvider() {
    getAllMovies();
  }

  List<Result> movies= [];
  List<Result> savedMovies = [];
  List<String> savedTitles = [];

  void getAllMovies() async {
    movies = await MovieRepository().getAllMovies();
    notifyListeners();
  }

  void addToSaved(Result result) {
    savedTitles.add(result.title);
    savedMovies.add(result);
    notifyListeners();
  }

  void removeFromSaved(Result movie) {
    for (Result favMovie in savedMovies) {
      if (favMovie.title == movie.title) {
        savedMovies.remove(movie);
        savedTitles.remove(movie.title);
        break;
      }
    }
    notifyListeners();
  }

}
