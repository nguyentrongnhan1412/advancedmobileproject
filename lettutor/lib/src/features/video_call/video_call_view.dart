import 'dart:async';
import 'package:flutter/material.dart';

class VideoCallView extends StatefulWidget {
  const VideoCallView({Key? key, required this.startTimestamp}) : super(key: key);
  final int startTimestamp;

  @override
  State<VideoCallView> createState() => _VideoCallViewState();
}

class _VideoCallViewState extends State<VideoCallView> {
  late Timer _timer;
  late Duration _currentTime;
  int _start = 10;

  void _startTimer() {
    _currentTime = DateTime.fromMillisecondsSinceEpoch(widget.startTimestamp).difference(DateTime.now());
    _timer = Timer.periodic(
      const Duration(seconds: 1),
          (Timer timer) {
        if (_currentTime.inSeconds == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _currentTime = DateTime.fromMillisecondsSinceEpoch(widget.startTimestamp)
                .difference(DateTime.now());
          });
        }
      },
    );
  }

  String _convertWaitingTime() {
    var seconds = _currentTime.inSeconds;
    final days = seconds~/Duration.secondsPerDay;
    seconds -= days*Duration.secondsPerDay;
    final hours = seconds~/Duration.secondsPerHour;
    seconds -= hours*Duration.secondsPerHour;
    final minutes = seconds~/Duration.secondsPerMinute;
    seconds -= minutes*Duration.secondsPerMinute;
    final ddays = days.toString().padLeft(2, '0');
    final dhours = hours.toString().padLeft(2, '0');
    final dminutes = minutes.toString().padLeft(2, '0');
    final dseconds = seconds.toString().padLeft(2, '0');
    return '$ddays:$dhours:$dminutes:$dseconds';
  }

  @override
  void initState() {
    super.initState();
    if (mounted) _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                'Lesson is starting in\n${_convertWaitingTime()}',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20, color: Colors.white60),
              ),
            ),
          ),
        ],
      ),
    );
  }
}