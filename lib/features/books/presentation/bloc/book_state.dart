import 'package:crud_app/features/books/domain/entities/book.dart';

abstract class BookState {

}

class BookInitial extends BookState{}

class BookLoading extends BookState{}


class BookLoaded extends BookState{
  final List<Book> books;
  BookLoaded(this.books);
}

class BookError  extends BookState{
  final String message;
  BookError(this.message);
}