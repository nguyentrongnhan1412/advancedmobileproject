import 'package:flutter/material.dart';
import 'package:lettutor/src/features/courses/courses/views/courses_view.dart';
class CoursesPage extends StatefulWidget {
  const CoursesPage({Key? key}) : super(key: key);

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(tabs: [
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
                      'Courses',
                      style: TextStyle(color: Colors.pink),
                    )
                  ],
                ),
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

              child: TabBarView(children: [

                CoursesView(),

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
                    ],
                  ),
                ),
              ]
              ),
            )
          ],
        )
    );
  }
}