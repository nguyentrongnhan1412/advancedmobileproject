import 'package:flutter/material.dart';
import 'package:lettutor/constants/dummy.dart';
import 'package:lettutor/constants/routes.dart';
import 'package:lettutor/widgets/course_card.dart';
import 'package:lettutor/widgets/book_card.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({Key? key}) : super(key: key);

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage>{
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
                tabs: [
                  Tab(
                    icon: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.school_outlined,
                          color: Colors.pink,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'All Courses',
                          style: TextStyle(color: Colors.pink),
                        )
                      ],
                    )
                  ),

                  Tab(
                    icon: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.book_online_outlined,
                          color: Colors.pink,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Books',
                          style: TextStyle(color: Colors.pink),
                        )
                      ],
                    ),
                  ),
                ]
            ),

            Expanded(
                child: TabBarView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      child: Column(
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(right: 24),
                              hintStyle: TextStyle(color: Colors.grey[400]),
                              hintText: 'Search courses',
                              prefixIcon: const Icon(Icons.search),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey, width: 2),
                                  borderRadius: BorderRadius.all(Radius.circular(10))),
                            ),
                          ),

                          const SizedBox(height: 8),

                          Expanded(
                              child: ListView.separated(
                                itemCount: courses.length,
                                itemBuilder: (context, index) => CourseCard(
                                  course: courses[index],
                                  onTap: ((value) => Navigator.pushNamed(
                                    context,
                                    Routes.courseDetail,
                                  )),
                                ),
                                separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 8),
                              ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          TextField(
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(right: 24),
                              hintStyle: TextStyle(color: Colors.grey[400]),
                              hintText: 'Search books',
                              prefixIcon: const Icon(Icons.search),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey, width: 2),
                                  borderRadius: BorderRadius.all(Radius.circular(10))),
                            ),
                          ),

                          Expanded(
                              child: ListView.separated(
                                itemCount: books.length,
                                itemBuilder: (context, index) => BookCard(book: books[index]),
                                separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 8),
                              )
                          ),
                        ],
                      ),
                    )
                  ],
                )
            )
          ],
        )
    );
  }
}