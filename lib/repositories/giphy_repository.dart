import 'dart:convert';
import 'package:http/http.dart' as http;

class GiphyRepository {
  Future<Map> getGifs(String textBusca) async {
    http.Response response;
    response = await http.get(Uri.parse(
        'https://api.giphy.com/v1/gifs/search?api_key=SW5H8LkrCsSWIfPJSzIUHEX6w2gQ0yRz&q=${textBusca}&limit=25&offset=0&rating=g&lang=en'));
    return json.decode(response.body);
  }
}
