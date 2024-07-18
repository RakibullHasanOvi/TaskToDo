class Chapter {
  final int id;
  final String text;
  final int chapterId;
  final dynamic hadisRange;
  final dynamic bookName;

  Chapter({
    required this.id,
    required this.text,
    required this.chapterId,
    required this.bookName,
    required this.hadisRange,
  });

  factory Chapter.fromMap(Map<String, dynamic> map) {
    return Chapter(
      id: map['id'],
      text: map['title'],
      chapterId: map['chapter_id'],
      hadisRange: map['hadis_range'],
      bookName: map['book_name'],
    );
  }
}
