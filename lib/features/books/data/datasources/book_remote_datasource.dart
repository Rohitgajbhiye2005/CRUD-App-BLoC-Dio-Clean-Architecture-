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
      final response = await client.get(AppConstants.booksEndpoint);
      final List<dynamic> data = response.data;
      return data.map((json) => BookModel.fromJson(json)).toList();
    } on dio.DioException catch (e) {
      throw DioFailureException(e.message);
    }
  }
}
