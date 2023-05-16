import 'package:flutter/material.dart';
import 'package:lettutor/src/models/schedule/schedule.dart';

class BookingDetailView extends StatefulWidget {
  const BookingDetailView({Key? key, required this.schedule}) : super(key: key);
  final Schedule schedule;

  @override
  State<BookingDetailView> createState() => _BookingDetailViewState();
}

class _BookingDetailViewState extends State<BookingDetailView> {
  String weekdayConverter(int weekday) {
    String result = '';
    switch (weekday) {
      case 1:
        result = 'Monday';
        break;
      case 2:
        result = 'Tuesday';
        break;
      case 3:
        result = 'Wednesday';
        break;
      case 4:
        result = 'Thursday';
        break;
      case 5:
        result = 'Friday';
        break;
      case 6:
        result = 'Saturday';
        break;
      case 7:
        result = 'Sunday';
        break;
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.pink[600],
        ),
        title: Text(
          'Booking Details',
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
          [

            Text('Booking Time', style: Theme.of(context).textTheme.displaySmall),

            const SizedBox(height: 8),

            const SizedBox(height: 16),

            const SizedBox(height: 16),

            Text('Notes', style: Theme.of(context).textTheme.displaySmall),

            const SizedBox(height: 12),

            TextField(
              minLines: 3,
              maxLines: 5,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(12),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10))),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 48),
              child: TextButton(
                style: TextButton.styleFrom(
                  minimumSize: const Size.fromHeight(40),
                  backgroundColor: Colors.pink,
                ),
                onPressed: () async {
                  final dialogResult = await showBookingResultDialog(context);
                  if (dialogResult) {
                    Navigator.pop(context);
                  }
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.keyboard_double_arrow_right_rounded,
                      color: Colors.white,
                      size: 32,
                    ),

                    Text(
                      'BOOK',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Future<bool> showBookingResultDialog(BuildContext context) async {
  return await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Booking Success'),
        content: const Text('You can now study with this tutor at booked time.'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text('OK')),
        ],
      );
    },
  ).then((value) => value ?? false);
}