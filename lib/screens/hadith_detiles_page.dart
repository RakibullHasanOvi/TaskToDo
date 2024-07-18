import 'package:flutter/material.dart';
import 'package:get/get.dart';
// ignore: unused_import
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:task_to_do/controller/book_controller.dart';
import 'package:task_to_do/controller/hadith_controller.dart';
import 'package:task_to_do/controller/section_controller.dart';

class HadithDetailsPage extends StatelessWidget {
  const HadithDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Calling controllers..
    final BookController bookController = Get.put(BookController());
    final SectionController sectionController = Get.put(SectionController());
    final HadithController hadithController = Get.put(HadithController());

    return Scaffold(
      //AppBar
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        title: const Text(
          'হাদিসের বিবরণ',
          style: TextStyle(
            fontFamily: 'Kalpurush',
            fontSize: 25,
          ),
        ),
      ),

      //

      body: Obx(() {
        if (bookController.book.isEmpty) {
          const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            itemCount: sectionController.section.length, // ItemCounting .
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
// This card used for showing the section table data.
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 20, bottom: 20, left: 20, right: 20),
                        child: Text(
                          sectionController.section[index].title,
                          style: const TextStyle(
                            fontFamily: 'Kalpurush',
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
// Completed.
                  const SizedBox(
                    height: 20,
                  ),
// This card used for showing the hadith table data.
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Row part start..
                            Row(
                              children: [
// B text
                                const Text(
                                  'B',
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.green,
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
//Column
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'সহিহ বূখারী',
                                      style: TextStyle(
                                        fontFamily: 'Kalpurush',
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    // SizedBox(
                                    //   height: 10,
                                    // ),
                                    Row(
                                      children: [
                                        const Text(
                                          'হাদিসঃ ',
                                          style: TextStyle(
                                            fontFamily: 'Kalpurush',
                                            fontSize: 17,
                                            fontWeight: FontWeight.w200,
                                          ),
                                        ),
                                        Text(hadithController
                                            .hadith[index].hadithId
                                            .toString()),
                                      ],
                                    ),
                                  ],
                                ),
// this widgets used for unlimited space it gave in ui
                                const Spacer(),
                                Container(
                                  height: 30,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      color: Colors.teal[300],
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: Text(
                                      hadithController.hadith[index].graDe,
                                      style: const TextStyle(
                                        fontFamily: 'Kalpurush',
                                        fontSize: 15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w200,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            // Row part end..
                            const SizedBox(
                              height: 10,
                            ),
                            // Arabic details of Hadis.
                            Text(
                              hadithController.hadith[index].aR.toString(),
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                fontFamily: 'KFGQPC Uthman Taha Naskh Regular',
                                fontSize: 25,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            const SizedBox(height: 15),
                            // narrator details..
                            Text(
                              hadithController.hadith[index].narraTor,
                              style: const TextStyle(
                                fontFamily: 'Kalpurush',
                                fontSize: 18,
                                color: Colors.teal,
                              ),
                            ),
                            // Bangla details of Hadis.
                            const SizedBox(height: 15),
                            Text(
                              hadithController.hadith[index].bN,
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                fontFamily: 'Kalpurush',
                                fontSize: 18,
                              ),
                            ),
                            const SizedBox(height: 15),
                            Text(
                              hadithController.hadith[index].note.toString(),
                              style: const TextStyle(
                                fontFamily: 'Kalpurush',
                                fontSize: 18,
                                color: Colors.teal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        }
        return Container();
      }),
    );
  }
}
