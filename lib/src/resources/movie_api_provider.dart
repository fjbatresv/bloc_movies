import 'dart:async';
import 'dart:convert';
import '../models/item_model.dart';
import 'package:http/http.dart' show Client;

class MovieApiProvider {
  Client client = Client();
  final _apiKey = '<your_api_key>';

  Future<ItemModel> fetchMovieList() async {
    print('Entered');
    final response = await client.get("http://api.themoviedb.org/3/movie/popular?api_key=$_apiKey");
    print(response.body.toString());
    if (response.statusCode == 200) {
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load post'); 
    }
  }
}