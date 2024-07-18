class Hadith {
  final int hadithId;
  final int bookId;
  final dynamic bookName;
  final int chapterId;
  final int sectionId;
  final dynamic narraTor;
  final dynamic bN;
  final dynamic aR;
  final dynamic graDe;
  final dynamic note;
  final dynamic gradeColor;

  Hadith({
    required this.hadithId,
    required this.bookId,
    required this.bookName,
    required this.chapterId,
    required this.sectionId,
    required this.narraTor,
    required this.bN,
    required this.aR,
    required this.graDe,
    required this.note,
    required this.gradeColor,
  });

  factory Hadith.fromMap(Map<String, dynamic> map) {
    return Hadith(
      hadithId: map['hadith_id'],
      bookId: map['book_id'],
      bookName: map['book_name'],
      chapterId: map['chapter_id'],
      sectionId: map['section_id'],
      narraTor: map['narrator'],
      bN: map['bn'],
      aR: map['ar'],
      graDe: map['grade'],
      note: map['note'],
      gradeColor: map['grade_color'],
    );
  }
}
