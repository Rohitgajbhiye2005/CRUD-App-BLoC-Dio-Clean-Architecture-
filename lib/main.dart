import 'package:crud_app/core/utils/api_client.dart';
import 'package:crud_app/features/books/data/datasources/book_remote_datasource.dart';
import 'package:crud_app/features/books/domain/repositories/book_repo_impl.dart';
import 'package:crud_app/features/books/domain/usecases/get_books.dart';
import 'package:crud_app/features/books/presentation/bloc/book_bloc.dart';
import 'package:crud_app/features/books/presentation/pages/book_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  final apiclient=ApiClient();
final remoteDataSource = BookRemoteDatasource(apiclient);
final repository=BookRepoImpl(remoteDataSource);
final getBookusecase=GetBooks(repository);
  runApp(MyApp(getBookusecase));
}

class MyApp extends StatelessWidget {
  final GetBooks getBooks;
  
  const MyApp(this.getBooks, {super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:  BlocProvider(
        create: (_) => BookBloc(getBooks), 
        child: const BookListPage(),
      ),
      
    );
  }
}

