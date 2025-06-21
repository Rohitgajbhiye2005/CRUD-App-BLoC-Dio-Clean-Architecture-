import 'package:crud_app/features/books/presentation/bloc/book_bloc.dart';
import 'package:crud_app/features/books/presentation/bloc/book_event.dart';
import 'package:crud_app/features/books/presentation/bloc/book_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/book_tile.dart'; 

class BookListPage extends StatefulWidget {
  const BookListPage({super.key});

  @override
  State<BookListPage> createState() => _BookListPageState();
}

class _BookListPageState extends State<BookListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Books"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: BlocBuilder<BookBloc, BookState>(
        builder: (context, state) {
          if (state is BookLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is BookLoaded) {
            return ListView.builder(
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                final book = state.books[index];
                return BookTile(book: book); // ✅ Use your widget here
              },
            );
          } else if (state is BookError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text("Press refresh to load books"));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<BookBloc>().add(FetchBooks()),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
