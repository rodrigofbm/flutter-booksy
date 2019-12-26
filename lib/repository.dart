import 'package:booksy/models/book.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';
import 'package:booksy/src/home/bloc/home_page_state.dart';

class Repository {
  String baseUrl = "https://www.googleapis.com/books/v1/volumes?q=android";

  Future<HomePageState> getBooks() async {
    try {
      var response = await get(baseUrl);

      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        List<Book> books = [];

        for (var i = 0; i < data["items"].length; i++) {
          books.add(Book.fromJson(data["items"][i]));
        }

        return new HomePageStateSuccess(books: books);
      } else {
        return new HomePageStateError(message: "Erro ao buscar livros");
      }
    } catch (e) {
      print(e.message);
      return new HomePageStateError(message: e.message);
    }
  }
}
