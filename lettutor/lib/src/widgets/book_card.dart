import 'package:flutter/material.dart';
import 'package:lettutor/src/dummy/book.dart';

class BookCard extends StatelessWidget {

  final Book book;

  const BookCard({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: 2,
      surfaceTintColor: Colors.white,
      child: Column(
        children: [
          Image.asset(book.imageUrl),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.name,
                  style: Theme.of(context).textTheme.displaySmall,
                ),

                const SizedBox(
                  height: 8,
                ),

                Text(
                  book.description,
                  style: const TextStyle(fontWeight: FontWeight.w400, color: Colors.grey),
                ),

                const SizedBox(
                  height: 16,
                ),

                Text(
                  book.level,
                  style: const TextStyle(fontSize: 18),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}