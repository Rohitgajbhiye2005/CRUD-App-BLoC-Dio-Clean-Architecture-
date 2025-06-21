import 'package:crud_app/features/books/domain/entities/book.dart';
import 'package:crud_app/features/books/domain/repositories/book_repository.dart';

class GetBooks {
  final BookRepository repository;
  
  GetBooks(this.repository);

  Future<List<Book>> call()async{
    return await repository.getBooks();
  }
}