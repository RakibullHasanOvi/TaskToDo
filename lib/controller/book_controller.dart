import 'package:get/get.dart';
import 'package:task_to_do/db/database_helper.dart';
import 'package:task_to_do/model/book_model.dart';

class BookController extends GetxController {
  var book = <Book>[].obs;
  final DatabaseService databaseService = DatabaseService();

  @override
  void onInit() {
    super.onInit();
    loadBooks();
  }

  void loadBooks() async {
    final data = await databaseService.getBookList();
    book.value = data.map((e) => Book.fromMap(e)).toList();
  }
}
