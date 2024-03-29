import 'package:cached_network_image/cached_network_image.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/src/constants/country_list.dart';
import 'package:lettutor/src/constants/language_list.dart';
import 'package:lettutor/src/constants/routes.dart';
import 'package:lettutor/src/features/booking/widgets/tutor_schedule.dart';
import 'package:lettutor/src/features/tutor/tutor_detail/tutor_report_dialog.dart';
import 'package:lettutor/src/models/tutor/tutor_feedback.dart';
import 'package:lettutor/src/models/tutor/tutor_info.dart';
import 'package:lettutor/src/providers/auth_provider.dart';
import 'package:lettutor/src/services/tutor_service.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class TutorDetailView extends StatefulWidget {
  const TutorDetailView({Key? key}) : super(key: key);

  @override
  State<TutorDetailView> createState() => _TutorDetailViewState();
}

class _TutorDetailViewState extends State<TutorDetailView> {
  VideoPlayerController? _videoPlayerController;
  ChewieController? _chewieController;
  late TutorInfo _tutorInfo;
  late final List<String> _specialties;
  late final List<String> languages;
  late final List<TutorFeedback> feedbacks;
  late String userId;
  bool _isLoading = true;

  Future<void> _fetchTutorInfo(AuthProvider authProvider) async {
    final String token = authProvider.token?.access?.token as String;
    final result = await TutorService.getTutorInfoById(
      token: token,
      userId: userId,
    );
    if (_isLoading) {
      final learnTopics = authProvider.learnTopics
          .where((topic) => result.specialties?.split(',').contains(topic.key) ?? false)
          .map((e) => e.name ?? 'null');
      final testPreparations = authProvider.testPreparations
          .where((test) => result.specialties?.split(',').contains(test.key) ?? false)
          .map((e) => e.name ?? 'null');
      _specialties = [...learnTopics, ...testPreparations];
      languages = result.languages?.split(',') ?? ['null'];
    }
    if (mounted) {
      setState(() {
        _tutorInfo = result;
        _isLoading = false;
        _videoPlayerController = VideoPlayerController.network(_tutorInfo.video ?? '');
        _chewieController = ChewieController(
          videoPlayerController: _videoPlayerController!,
          aspectRatio: 2 / 3,
          autoPlay: true,
        );
      });
    }
  }

  @override
  void dispose() {
    _videoPlayerController?.dispose();
    _chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    if (_isLoading && authProvider.token != null) {
      final data = ModalRoute.of(context)?.settings.arguments as Map;
      userId = data['userId'];
      feedbacks = data['tutor'].feedbacks;
      _fetchTutorInfo(authProvider);
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: BackButton(
          color: Colors.pink[600],
        ),
        title: Text(
          'Tutor Details',
          style: Theme.of(context).textTheme.displayMedium,
        ),
      ),

      body: _isLoading ? const Center(child: CircularProgressIndicator()) : SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children:
              [

                Container(
                  width: 72,
                  height: 72,
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),

                  child: CachedNetworkImage(
                    imageUrl: _tutorInfo.user?.avatar ?? '',
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) => const Icon(
                      Icons.error_outline_rounded,
                      size: 32,
                      color: Colors.redAccent,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:
                    [

                      Text(
                        _tutorInfo.user?.name ?? 'null name',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),

                      Text(
                        countryList[_tutorInfo.user?.country] ?? 'unknown country',
                        style: const TextStyle(fontSize: 16),
                      ),
                      _tutorInfo.rating == null
                          ? const Text(
                        'No review(s) yet',
                        style: TextStyle(
                          fontStyle: FontStyle.italic,
                          color: Colors.grey,
                        ),
                      ) : Row(
                          children:
                          [
                        ...List<Widget>.generate(
                          _tutorInfo.rating?.round() ?? 0,
                              (index) => const Icon(Icons.star, color: Colors.amber),),

                            const SizedBox(width: 8),

                            Text('(${_tutorInfo.totalFeedback})',
                            style: const TextStyle(fontSize: 18))
                          ]
                      )
                    ],
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                _tutorInfo.bio ?? 'null bio',
                style: const TextStyle(fontSize: 16),
              ),
            ),

            Row(
              children:
              [

                Expanded(

                  child: TextButton(
                    onPressed: () async {
                      if (authProvider.token != null) {
                        final String accessToken =
                        authProvider.token?.access?.token as String;
                        await TutorService.addTutorToFavorite(
                          token: accessToken,
                          userId: userId,
                        );
                        _fetchTutorInfo(authProvider);
                      }
                    },

                    child: Column(
                      children:
                      [

                        _tutorInfo.isFavorite!
                            ? const Icon(
                          Icons.favorite_rounded,
                          color: Colors.black,
                        ) : const Icon(
                          Icons.favorite_border_rounded,
                          color: Colors.pink,
                        ),

                        Text(
                          'Favorite',
                          style: TextStyle(
                            color: _tutorInfo.isFavorite! ? Colors.black : Colors.pink,
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                Expanded(

                  child: TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        Routes.review,
                        arguments: feedbacks,
                      );
                    },

                    child: Column(
                      children: const
                      [

                        Icon(Icons.reviews_outlined, color: Colors.pink),

                        Text('Reviews', style: TextStyle(color: Colors.pink))
                      ],
                    ),
                  ),
                ),

                Expanded(
                  child: TextButton(

                    onPressed: () async {
                      final result = await showDialog(
                        context: context,
                        builder: (context) => TutorReportDialog(
                          token: authProvider.token?.access?.token ?? '',
                          userId: userId,
                        ),
                      );

                      if (result) {
                        await showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Report Success'),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('OK')),
                              ],
                            );
                          },
                        );
                      }
                    },

                    child: Column(
                      children: const
                      [

                        Icon(Icons.report_outlined, color: Colors.pink),

                        Text('Report', style: TextStyle(color: Colors.pink))
                      ],
                    ),
                  ),
                ),
              ],
            ),

            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              height: 300,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.pink, width: 2),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: _chewieController == null ? Text(
                'No Introduction Video',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Colors.pink[700],
                ),
              ) : Chewie(controller: _chewieController!),),

            const SizedBox(height: 8),

            Text('Languages', style: Theme.of(context).textTheme.displaySmall),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Wrap(
                spacing: 8,
                runSpacing: -4,
                children: List<Widget>.generate(
                  languages.length,
                      (index) => Chip(
                    label: Text(
                      languageList[languages[index]]?['name'] ?? 'unknown language',
                      style: const TextStyle(color: Colors.pink),
                    ),
                    backgroundColor: Colors.pink[50],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 8),

            Text('Specialties', style: Theme.of(context).textTheme.displaySmall),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Wrap(
                spacing: 8,
                runSpacing: -4,
                children: List<Widget>.generate(
                  _specialties.length,
                      (index) => Chip(
                    backgroundColor: Colors.pink[50],
                    label: Text(
                      _specialties[index],
                      style: const TextStyle(fontSize: 14, color: Colors.pink),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 8),

            const SizedBox(height: 12),

            Text('Interests', style: Theme.of(context).textTheme.displaySmall),

            Padding(
              padding: const EdgeInsets.only(left: 10, right: 8),
              child: Text(_tutorInfo.interests ?? 'No interests'),
            ),

            const SizedBox(height: 12),

            Text('Teaching Experiences', style: Theme.of(context).textTheme.displaySmall),

            Padding(
              padding: const EdgeInsets.only(left: 10, right: 8),
              child: Text(_tutorInfo.experience ?? 'No teaching experiences'),
            ),

            Padding(
                padding: const EdgeInsets.only(top: 24, bottom: 12),
                child: OutlinedButton(
                  style: TextButton.styleFrom(
                      minimumSize: const Size.fromHeight(0),
                      padding: const EdgeInsets.all(8),
                      side: const BorderSide(color: Colors.pink, width: 1.5)),
                  onPressed: () async {
                    await showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      elevation: 5,
                      clipBehavior: Clip.hardEdge,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(16),
                        ),
                      ),
                      builder: (context) => TutorSchedule(userId: userId),
                    );
                  },
                  child: const Text(
                    'Book This Tutor',
                    style: TextStyle(fontSize: 18, color: Colors.pink),
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}