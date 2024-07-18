import 'package:get/get.dart';
import 'package:task_to_do/db/database_helper.dart';
import 'package:task_to_do/model/chapter_model.dart';

class ChapterController extends GetxController {
  var chapter = <Chapter>[].obs;
  final DatabaseService databaseService = DatabaseService();

  @override
  void onInit() {
    super.onInit();
    loadChapter();
  }

  void loadChapter() async {
    final data = await databaseService.getChapterlist();
    chapter.value = data.map((e) => Chapter.fromMap(e)).toList();
  }
}
