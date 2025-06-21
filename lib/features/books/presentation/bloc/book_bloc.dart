import 'package:crud_app/features/books/domain/usecases/get_books.dart';
import 'package:crud_app/features/books/presentation/bloc/book_event.dart';
import 'package:crud_app/features/books/presentation/bloc/book_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookBloc extends Bloc<BookEvent, BookState> {
  final GetBooks getBooks;

  BookBloc(this.getBooks) : super(BookInitial()) {
    print("Fetching books...");
    on<FetchBooks>((event, emit) async {
      print("Fetching books...");
      emit(BookLoading());
      try {
        final books = await getBooks();
        print("Books fetched: ${books.length}");
        emit(BookLoaded(books));
      } catch (e) {
        print("Book fetch failed: $e");
        emit(BookError(e.toString()));
      }
    });
  }
}
