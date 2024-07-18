class Book {
  final int id;
  final String title;
  final dynamic titleAr;
  final dynamic numberOfHadis;
  final dynamic abVrCode;
  final dynamic bookName;
  final dynamic bookDescr;

  Book({
    required this.id,
    required this.title,
    required this.titleAr,
    required this.numberOfHadis,
    required this.abVrCode,
    required this.bookName,
    required this.bookDescr,
  });

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      id: map['id'],
      title: map['title'],
      titleAr: map['title_ar'],
      numberOfHadis: map['number_of_hadis'],
      abVrCode: map['abvr_code'],
      bookName: map['book_name'],
      bookDescr: map['book_descr'],
    );
  }
}
