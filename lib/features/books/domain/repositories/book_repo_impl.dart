import 'package:crud_app/features/books/data/datasources/book_remote_datasource.dart';
import 'package:crud_app/features/books/domain/entities/book.dart';
import 'package:crud_app/features/books/domain/repositories/book_repository.dart';

class BookRepoImpl implements BookRepository{
  final BookRemoteDatasource remoteDatasource;

  BookRepoImpl(this.remoteDatasource);


  @override
  Future<List<Book>> getBooks() async{
    return await remoteDatasource.fetchBooks();
  }}