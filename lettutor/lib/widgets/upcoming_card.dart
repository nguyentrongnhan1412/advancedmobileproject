import 'package:flutter/material.dart';
import 'package:lettutor/constants/routes.dart';

class UpcomingCard extends StatelessWidget{
  const UpcomingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      surfaceTintColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.teacherDetail);
                  },
                  child: const CircleAvatar(
                    backgroundImage: AssetImage('assets/tutors/keegan-avatar.png'),
                    radius: 32,
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, Routes.teacherDetail);
                          },
                          child: Text(
                            'Keegan',
                            style: Theme.of(context).textTheme.headline4,
                          ),
                        ),

                        const SizedBox(height: 4),

                        const Text('2023-3-1    8:00 - 8:55')
                      ],
                    ),
                ),

                IconButton(
                    onPressed: () async {
                      final dialogResult = await showEditRequestDialog(context);
                    },
                    icon: Icon(
                      Icons.edit_note_outlined,
                      size: 32,
                      color: Colors.pink[700],
                    ),
                )
              ],
            ),

            const SizedBox(
              height: 12,
            ),

            Row(
              children: [
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(foregroundColor: Colors.black),
                    onPressed: () {},
                    child: const Text(
                      'Cancel',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.videoCall);
                    },
                    child: const Text(
                      'Go to meeting',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),

              ],
            )
          ],
        ),
      ),
    );
  }
}

Future<bool> showEditRequestDialog(BuildContext context){
  return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Requests For Lesson'),
          content: TextField(
            minLines: 2,
            maxLines: 4,
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(12),
                border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)
                )
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: const Text(
                'Cancel',
                style: TextStyle(fontSize: 18),
              ),
            ),

            TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text(
                'OK',
                style: TextStyle(fontSize: 18),
              ),
            ),

          ],
        );
      },
  ).then((value) => value ?? false);
}