import 'package:crud_app/features/books/domain/entities/book.dart';

class BookModel extends Book{
    BookModel({required super.id,required super.title,required super.author,super.image});

    factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      id: json['_id'],
      title: json['title'],
      author: json['author'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "author": author,
      "image": image,
    };
  }
}