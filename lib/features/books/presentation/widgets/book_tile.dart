import 'package:flutter/material.dart';
import '../../domain/entities/book.dart';

class BookTile extends StatelessWidget {
  final Book book;
  const BookTile({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: book.image != null && book.image!.isNotEmpty
          ? Image.network(
              book.image!,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.book, size: 40); 
              },
            )
          : const Icon(Icons.book, size: 40),
      title: Text(book.title),
      subtitle: Text(book.author),
    );
  }
}
