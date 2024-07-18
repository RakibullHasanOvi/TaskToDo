import 'package:get/get.dart';
import 'package:task_to_do/db/database_helper.dart';
import 'package:task_to_do/model/hadith_model.dart';

class HadithController extends GetxController {
  var hadith = <Hadith>[].obs;
  final DatabaseService databaseService = DatabaseService();

  @override
  void onInit() {
    super.onInit();
    loadHadiths();
  }

  void loadHadiths() async {
    final data = await databaseService.getHadithList();
    hadith.value = data.map((e) => Hadith.fromMap(e)).toList();
  }
}
