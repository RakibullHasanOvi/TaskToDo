import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_to_do/controller/book_controller.dart';
import 'package:task_to_do/screens/hadith_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // calling bookcontroller from BookController file..
    final BookController bookController = Get.put(BookController());

    return Container(
      color: Colors.green[300],
      child: SafeArea(
        child: Scaffold(
          drawer: const Drawer(
            child: Center(
                child: Text(
              'This task has completed by Rakibull Hasan Ovi',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            )),
          ),
          //AppBar..
          appBar: AppBar(
            title: const Text(
              'হাদিসের বই',
              style: TextStyle(
                fontFamily: 'Kalpurush',
                fontSize: 25,
                // color: Colors.black,
              ),
            ),
            backgroundColor: Colors.green[300],
          ),
          // End the AppBar..

          //Start body section..
          body: Obx(() {
            // implement a logic..
            if (bookController.book.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                // how many length come from the books table.
                itemCount: bookController.book.length,
                itemBuilder: (context, index) {
                  // assign syntex use for bookIndex
                  final bookIndex = bookController.book[index];
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 20),
                    // go to the another page..
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => HadithPage(),
                          ),
                        );
                      },
                      // In this card carry all of tha date to come the database or table.
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 20, bottom: 20),
                          child: Row(
                            children: [
                              //abvr_code..
                              Text(
                                bookIndex.abVrCode,
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.green[400],
                                ),
                              ),
                              const SizedBox(width: 20),
                              // some customise to use column
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // title
                                  Text(
                                    bookIndex.title,
                                    style: const TextStyle(
                                      fontFamily: 'Kalpurush',
                                      fontSize: 20,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  //bookname
                                  // Text(
                                  //   bookIndex.bookName,
                                  //   style: const TextStyle(
                                  //     fontFamily: 'Kalpurush',
                                  //     fontSize: 20,
                                  //     color: Colors.black,
                                  //     fontWeight: FontWeight.bold,
                                  //   ),
                                  // ),
                                ],
                              ),

                              //Number of Hadith.
                              const Spacer(),
                              Text(
                                bookIndex.numberOfHadis.toString(),
                                style: const TextStyle(
                                  fontSize: 25,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
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
        ),
      ),
    );
  }
}
