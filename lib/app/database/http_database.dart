
// ignore_for_file: unused_local_variable

import 'package:http/http.dart' as http;

class HttpDatabase {
  static final Uri _url =
      Uri.https("apifirabase-default-rtdb.firebaseio.com", "/quiz.json");

  static void adicionar(Object? body) {
    http.post(_url, body: body);
  }

  static void buscar(Object? body) {
    var result = http.get(_url);
  }
}
