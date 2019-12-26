class Book {
  String id;
  String authors;
  String title;
  String description;
  int pageCount;
  double averageRating;
  String language;
  String smallThumbnail;

  Book(id, authors, title, description, pageCount, averageRating, language,
      smallThumbnail) {
    this.id = id;
    this.authors = authors;
    this.title = title;
    this.description = description;
    this.pageCount = pageCount;
    this.averageRating = averageRating;
    this.language = language;
    this.smallThumbnail = smallThumbnail;
  }

  Book.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.title = json["volumeInfo"]["title"];
    this.authors = json["volumeInfo"]["authors"][0];
    this.pageCount = json["volumeInfo"]["pageCount"];
    this.averageRating = json["averageRating"];
    this.language = json["volumeInfo"]["language"];
    this.smallThumbnail = json["volumeInfo"]["imageLinks"]["smallThumbnail"];
  }
}
