import 'package:crud_app/features/books/domain/entities/book.dart';

abstract class BookRepository {
  Future<List<Book>> getBooks();
}