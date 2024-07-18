import 'package:get/get.dart';
import 'package:task_to_do/db/database_helper.dart';
import 'package:task_to_do/model/section_model.dart';

class SectionController extends GetxController {
  var section = <Section>[].obs;
  final DatabaseService databaseService = DatabaseService();

  @override
  void onInit() {
    super.onInit();
    loadSection();
  }

  void loadSection() async {
    final data = await databaseService.getSectionList();
    section.value = data.map((e) => Section.fromMap(e)).toList();
  }
}
