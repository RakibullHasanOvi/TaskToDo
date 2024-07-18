class Section {
  final int id;
  final int bookId;
  final dynamic bookName;
  final int sectionId;
  final dynamic title;
  final dynamic preFace;
  final dynamic numBer;

  Section({
    required this.id,
    required this.bookId,
    required this.bookName,
    required this.sectionId,
    required this.title,
    required this.preFace,
    required this.numBer,
  });

  factory Section.fromMap(Map<String, dynamic> map) {
    return Section(
      id: map['id'],
      bookId: map['book_id'],
      bookName: map['book_name'],
      sectionId: map['chapter_id'],
      title: map['title'],
      preFace: map['preface'],
      numBer: map['number'],
    );
  }
}
