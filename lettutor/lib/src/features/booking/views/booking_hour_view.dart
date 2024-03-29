import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lettutor/src/features/booking/widgets/booking_dialog.dart';
import 'package:lettutor/src/models/schedule/schedule.dart';

class BookingHourView extends StatefulWidget {
  const BookingHourView({Key? key, required this.schedules, required this.timestamp}) : super(key: key);
  final List<Schedule> schedules;
  final int timestamp;

  @override
  State<BookingHourView> createState() => _BookingHourViewState();
}

class _BookingHourViewState extends State<BookingHourView> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final pickedDate = DateTime.fromMillisecondsSinceEpoch(widget.timestamp);
    final validSchedules = widget.schedules.where((schedule)
    {
      if (schedule.startTimestamp == null) return false;
      final date = DateTime.fromMillisecondsSinceEpoch(schedule.startTimestamp!);
      if (date.day == pickedDate.day &&
          date.month == pickedDate.month &&
          date.year == pickedDate.year) {
        return true;
      }
      return false;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.pink[600],
        ),
        title: Text(
          'Choose learning time',
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
      body: Column(
        children:
        [

          Text(
            'On ${DateFormat.yMMMMEEEEd().format(pickedDate)}',
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),

          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.all(24),
              crossAxisCount: 2,
              mainAxisSpacing: 24,
              crossAxisSpacing: 32,
              childAspectRatio: 3,
              children: List<Widget>.generate(
                validSchedules.length,
                    (index) {
                  final start = DateFormat.Hm().format(DateTime.fromMillisecondsSinceEpoch(
                      validSchedules[index].startTimestamp ?? 0));
                  final end = DateFormat.Hm().format(DateTime.fromMillisecondsSinceEpoch(
                      validSchedules[index].endTimestamp ?? 0));
                  final date = DateFormat.yMMMMEEEEd().format(DateTime.fromMillisecondsSinceEpoch(
                      validSchedules[index].startTimestamp ?? 0));
                  final scheduleDetailIds = [validSchedules[index].scheduleDetails?.first.id ?? ''];

                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink[300],
                    ),
                    onPressed: validSchedules[index].isBooked as bool ? null : () async {
                       await showDialog(
                        context: context,
                        builder: (context) => BookingConfirmDialog(
                          start: start,
                          end: end,
                          date: date,
                          scheduleDetailIds: scheduleDetailIds,
                        ),
                      );
                    },
                    child: Text(
                      '$start - $end',
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Future<bool> _showBookingConfirmDialog(BuildContext context, Schedule schedule) {
  final start = schedule.startTime;
  final end = schedule.endTime;
  final date = DateFormat.yMMMMEEEEd().format(DateTime.fromMillisecondsSinceEpoch(schedule.startTimestamp!));

  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Book This Tutor'),
        content: Column(
          children: [
            const Text('Booking time'),
            Text('$start - $end, $date'),
            TextField(
              minLines: 4,
              maxLines: 5,
              onChanged: (value) {},
              decoration: const InputDecoration(
                hintText: 'Please let us know details about your problem',
                hintStyle: TextStyle(fontWeight: FontWeight.w300, color: Colors.grey),
                contentPadding: EdgeInsets.all(12),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(16))),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: const Text('CANCEL')),
          TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text('YES')),
        ],
      );
    },
  ).then((value) => value ?? false);
}