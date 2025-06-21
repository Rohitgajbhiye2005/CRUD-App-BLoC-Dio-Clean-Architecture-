class Book {
  final String id;
  final String title;
  final String author;
  final String? image;

  Book({
    required this.id,
    required this.title,
    required this.author,
    this.image,
  });
}
