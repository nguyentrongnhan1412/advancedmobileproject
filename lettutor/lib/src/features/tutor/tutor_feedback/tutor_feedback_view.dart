import 'package:flutter/material.dart';
import 'package:lettutor/src/models/tutor/tutor_feedback.dart';
import 'package:lettutor/src/widgets/feedback_card.dart';

class TutorFeedbackView extends StatefulWidget {
  const TutorFeedbackView({Key? key}) : super(key: key);

  @override
  State<TutorFeedbackView> createState() => _TutorFeedbackViewState();
}

class _TutorFeedbackViewState extends State<TutorFeedbackView> {
  @override
  Widget build(BuildContext context) {
    final feedbacks = ModalRoute.of(context)?.settings.arguments as List<TutorFeedback>;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.pink[600],
        ),
        title: Text(
          'Reviews',
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: feedbacks.length,
          shrinkWrap: true,
          itemBuilder: (context, index) => FeedbackCard(feedback: feedbacks[feedbacks.length - index - 1]),
        ),
      ),
    );
  }
}

