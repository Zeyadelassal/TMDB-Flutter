import 'package:tmdbap/data_access_layer/http_client.dart';
import 'package:tmdbap/data_access_layer/model/Movie.dart';

class MovieApi {
  final String url =
      'https://api.themoviedb.org/4/discover/movie?api_key=9ba2a10e20c15ef6fb276c33692ba9e8&sort_by=popularity.desc';
  Future<List<Result>> fetchMovies() async {
    var response = await HttpClient().get(url);
    return List.from(response.map((json) => Result.fromJson(json)));
  }
}
