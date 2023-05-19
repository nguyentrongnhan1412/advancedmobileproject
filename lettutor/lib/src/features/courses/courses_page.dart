import 'package:flutter/material.dart';
import 'package:lettutor/src/features/courses/courses/views/courses_view.dart';
import 'package:lettutor/src/features/courses/books/views/books_view.dart';

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

              child: TabBarView(children:
              [
                CoursesView(),
                BookView(),
              ]
              ),
            ),


          ],
        )
    );
  }
}