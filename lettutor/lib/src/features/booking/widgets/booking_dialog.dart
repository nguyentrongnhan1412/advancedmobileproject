import 'package:flutter/material.dart';
import 'package:lettutor/src/providers/auth_provider.dart';
import 'package:lettutor/src/services/booking_service.dart';
import 'package:provider/provider.dart';

class BookingConfirmDialog extends StatefulWidget {
  const BookingConfirmDialog({Key? key, required this.start, required this.end, required this.date, required this.scheduleDetailIds}) : super(key: key);
  final String start;
  final String end;
  final String date;
  final List<String> scheduleDetailIds;

  @override
  State<BookingConfirmDialog> createState() => _BookingConfirmDialogState();
}

class _BookingConfirmDialogState extends State<BookingConfirmDialog> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    // start = widget.schedule.startTime ?? '??:??';
    // end = widget.schedule.endTime ?? '??:??';
    // date = DateFormat.yMMMMEEEEd().format(DateTime.fromMillisecondsSinceEpoch(widget.schedule.startTimestamp!));
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    final accessToken = authProvider.token?.access?.token ?? '';
    final bookStart = widget.start;
    final bookEnd = widget.end;
    final bookDate = widget.date;
    final bookIds = widget.scheduleDetailIds;
    return AlertDialog(
      title: const Text('Book This Tutor'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children:
        [

          Text(
            'Booking time',
            style: Theme.of(context).textTheme.displaySmall,
          ),

          const SizedBox(height: 4),

          Text(
            '  $bookStart- $bookEnd',
            style: const TextStyle(fontSize: 16),
          ),

          Text(
            '  $bookDate',
            style: const TextStyle(fontSize: 16),
          ),

          const SizedBox(height: 8),

          Text(
            'Note',
            style: Theme.of(context).textTheme.displaySmall,
          ),

          const SizedBox(height: 4),

          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: TextField(
              controller: _controller,
              minLines: 3,
              maxLines: 4,
              decoration: const InputDecoration(
                hintText: 'Your request(s) for the tutor',
                hintStyle: TextStyle(fontWeight: FontWeight.w300, color: Colors.grey),
                contentPadding: EdgeInsets.all(12),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(16))),
              ),
            ),
          ),
        ],
      ),

      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text(
              'CANCEL',
              style: TextStyle(color: Colors.red),
            )
        ),

        TextButton(
            onPressed: () async {
              await BookingService.bookClass(
                scheduleDetailIds: bookIds,
                note: _controller.text,
                token: accessToken,
              );
              if (mounted) {
                Navigator.pop(context);
                Navigator.pop(context);
              }
            },
            child: const Text('BOOK')),
      ],
    );
  }
}
