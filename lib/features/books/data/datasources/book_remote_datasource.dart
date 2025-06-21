import 'package:crud_app/core/utils/api_client.dart';
import 'package:crud_app/core/utils/constants.dart';
import 'package:crud_app/features/books/data/models/book_model.dart';
import 'package:dio/dio.dart' as dio; 
import 'package:crud_app/core/errors/exception.dart';

class BookRemoteDatasource {
  final ApiClient client;

  BookRemoteDatasource(this.client);

  Future<List<BookModel>> fetchBooks() async {
  try {
    print("Calling API...");
    final response = await client.get(AppConstants.booksEndpoint);
    print("API response received: ${response.data}");

    final List<dynamic> data = response.data;
    final books = data.map((json) => BookModel.fromJson(json)).toList();
    print("Parsed books: ${books.length}");

    return books;
  } catch (e) {
    print("API fetch failed: $e");
    throw AppException("Failed to fetch books");
  }
}

}
