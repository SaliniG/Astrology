import 'dart:convert';
import 'package:astrology/models/planetary.dart';
import 'package:http/http.dart' as http;

class Webservice {
  Future<Planetary> fetchDetails(String date) async {
    final url =
        "https://api.nasa.gov/planetary/apod?api_key=aWPhODExHc5j48m59viPzCysv1jkoaN7ID2dchPw&date=$date";
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return Planetary.fromJson(body);
    } else {
      throw Exception("Unable to perform request!");
    }
  }
}
