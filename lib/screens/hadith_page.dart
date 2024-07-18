import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_to_do/controller/chapter_controller.dart';
import 'package:task_to_do/screens/hadith_detiles_page.dart';

class HadithPage extends StatelessWidget {
  //calling chapterController from ChapterController file..
  final ChapterController chapterController = Get.put(ChapterController());

  HadithPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        title: const Text(
          'হাদিস পেইজ',
          style: TextStyle(
            fontFamily: 'Kalpurush',
            fontSize: 25,
            // color: Colors.black,
          ),
        ),
      ),
      //this section use for showing the data from database..
      body: Obx(() {
        // Implement a logic..
        if (chapterController.chapter.isEmpty) {
          return const Center(child: Text('No hadiths found.'));
        } else {
          return ListView.builder(
            itemCount: chapterController.chapter.length,
            itemBuilder: (context, index) {
              //use assignmet syntax.
              final chapterIndex = chapterController.chapter[index];
              return Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, bottom: 10, top: 10),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (context) => const HadithDetailsPage(),
                        ));
                  },
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    // color: Colors.teal[200],
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 20, top: 10, bottom: 10),
                      child: Row(
                        children: [
                          Text(
                            chapterIndex.id.toString(),
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 15,
                          ),

                          //Text

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                chapterIndex.text.toString(),
                                style: const TextStyle(
                                  fontFamily: 'Kalpurush',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20,
                                ),
                              ),
                              // HadisRange
                              Text(
                                chapterIndex.hadisRange.toString(),
                                style: const TextStyle(
                                  fontFamily: 'Kalpurush',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
