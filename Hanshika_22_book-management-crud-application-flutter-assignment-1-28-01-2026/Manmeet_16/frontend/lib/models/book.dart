class Book {
  final String? id;
  final String title;
  final String author;
  final String coverImage;
  final String description;
  final String genre;

  Book({
    this.id,
    required this.title,
    required this.author,
    this.coverImage = "",
    this.description = "",
    this.genre = "",
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      id: json['_id'] as String?,
      title: json['title'] as String,
      author: json['author'] as String,
      coverImage: json['coverImage'] as String? ?? "",
      description: json['description'] as String? ?? "",
      genre: json['genre'] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'author': author,
      'coverImage': coverImage,
      'description': description,
      'genre': genre,
    };
  }

  Book copyWith({
    String? id,
    String? title,
    String? author,
    String? coverImage,
    String? description,
    String? genre,
  }) {
    return Book(
      id: id ?? this.id,
      title: title ?? this.title,
      author: author ?? this.author,
      coverImage: coverImage ?? this.coverImage,
      description: description ?? this.description,
      genre: genre ?? this.genre,
    );
  }
}
