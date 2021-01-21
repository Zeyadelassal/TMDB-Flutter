import 'package:tmdbap/data_access_layer/api/movie_api.dart';
import 'package:tmdbap/data_access_layer/model/Movie.dart';

class MovieRepository{
  Future<List<Result>> getAllMovies() async {
    return await MovieApi().fetchMovies();
  }
}