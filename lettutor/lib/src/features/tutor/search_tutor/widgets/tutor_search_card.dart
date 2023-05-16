import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lettutor/src/constants/country_list.dart';
import 'package:lettutor/src/constants/routes.dart';
import 'package:lettutor/src/models/tutor/tutor.dart';
import 'package:lettutor/src/models/tutor/tutor_info.dart';
import 'package:lettutor/src/providers/auth_provider.dart';
import 'package:lettutor/src/services/tutor_service.dart';
import 'package:provider/provider.dart';

class TutorSearchCard extends StatefulWidget {
  const TutorSearchCard({Key? key, required this.tutor,}) : super(key: key);
  final Tutor tutor;

  @override
  State<TutorSearchCard> createState() => _TutorSearchCardState();
}

class _TutorSearchCardState extends State<TutorSearchCard> {
  TutorInfo? _tutorInfo;
  List<String> _specialties = [];
  Future<void> _fetchTutorInfo(AuthProvider authProvider) async {
    final String token = authProvider.token?.access?.token as String;
    final learnTopics = authProvider.learnTopics
        .where((topic) => _tutorInfo?.specialties?.split(',').contains(topic.key) ?? false)
        .map((e) => e.name ?? 'null');
    final testPreparations = authProvider.testPreparations
        .where((test) => _tutorInfo?.specialties?.split(',').contains(test.key) ?? false)
        .map((e) => e.name ?? 'null');
    _specialties = [...learnTopics, ...testPreparations];
    final result = await TutorService.getTutorInfoById(
      token: token,
      userId: widget.tutor.userId ?? '',
    );
    if (mounted) {
      setState(() {
        _tutorInfo = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    if (authProvider.token != null) {
      _fetchTutorInfo(authProvider);
    }

    return Card(
      surfaceTintColor: Colors.white,
      elevation: 3.0,
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              children: [

                Container(
                  width: 72,
                  height: 72,
                  clipBehavior: Clip.hardEdge,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),

                  child: Image.network(
                    widget.tutor.avatar ?? '',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => const Icon(
                      Icons.error_outline_rounded,
                      color: Colors.red,
                      size: 32,
                    ),
                  ),
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(widget.tutor.name ?? 'null name',
                            style: Theme.of(context).textTheme.displaySmall),

                        Text(countryList[widget.tutor.country ?? 'null'] ?? 'unknown country', style: const TextStyle(fontSize: 16)),
                        widget.tutor.rating == null
                            ? const Text(
                          'No reviews yet',
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.grey,
                          ),
                        ) : Row(
                          children:
                          List<Widget>.generate(
                            widget.tutor.rating!.round(),
                                (index) => const Icon(Icons.star, color: Colors.amber),
                          ),
                        )
                      ],
                    ),
                  ),
                ),

                IconButton(
                  onPressed: () async {
                    if (authProvider.token != null) {
                      final String accessToken = authProvider.token?.access?.token as String;
                      await TutorService.addTutorToFavorite(
                        token: accessToken,
                        userId: widget.tutor.userId ?? '',
                      );
                      _fetchTutorInfo(authProvider);
                    }
                  },

                  icon: _tutorInfo?.isFavorite ?? false
                      ? const Icon(
                    Icons.favorite_rounded,
                    color: Colors.black,
                  )

                      : const Icon(
                    Icons.favorite_border_rounded,
                    color: Colors.pink,
                  ),
                )
              ],
            ),

            const SizedBox(height: 8),

            Wrap(
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

            const SizedBox(height: 8),

            Text(
              widget.tutor.bio ?? 'null',
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}