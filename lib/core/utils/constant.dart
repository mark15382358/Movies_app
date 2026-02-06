class AppConstance {
  static const baseUrl = "https://api.themoviedb.org/3";
  static const apiKey = "91097d64b2598d434f136f65b8be9ca6";
  static const nowPlayingMoviesPath =
      "$baseUrl/movie/now_playing?api_key=$apiKey";
  static const topRatedMoviesPath = "$baseUrl/movie/top_rated?api_key=$apiKey";
  static const popularMoviesPath = "$baseUrl/movie/popular?api_key=$apiKey";
  static const baseImageUrl = "https://image.tmdb.org/t/p/w500";
  static String moviesDetailsPath(int id) =>
      "$baseUrl/movie/$id?api_key=$apiKey";
  static String imageUrl(String imageUrl) => "$baseImageUrl$imageUrl";
  static String recommendedMovies(int id) =>
      "$baseUrl/movie/$id/recommendations?api_key=$apiKey";

  /////https://api.themoviedb.org/3/movie/now_playing
}
