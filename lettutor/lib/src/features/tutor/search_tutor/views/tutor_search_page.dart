import 'package:flutter/material.dart';
import 'package:lettutor/src/constants/country_list.dart';
import 'package:lettutor/src/constants/datatype.dart';
import 'package:lettutor/src/constants/routes.dart';
import 'package:lettutor/src/dummy/dummy_data.dart';
import 'package:lettutor/src/models/tutor/tutor.dart';
import 'package:lettutor/src/providers/auth_provider.dart';
import 'package:lettutor/src/services/tutor_service.dart';
import 'package:provider/provider.dart';
import 'tutor_search_result.dart';

class TutorSearchPage extends StatefulWidget {
  const TutorSearchPage({Key? key}) : super(key: key);

  @override
  State<TutorSearchPage> createState() => _TutorSearchPageState();
}

class _TutorSearchPageState extends State<TutorSearchPage> {
  final _nameController = TextEditingController();
  List<String> _specialties = [];
  Nationality? _nationality = Nationality.foreign;
  int _chosenSpecialtiesIndex = 0;

  Map<String, dynamic> _encapsulateSearchParams(AuthProvider authProvider) {
    final name = _nameController.text;
    final accessToken = authProvider.token?.access?.token as String;
    return {
    'token': accessToken,
    'search': name,
    'nationality': _nationality?.index == Nationality.vietnamese.index,
    'specialties': _chosenSpecialtiesIndex == 0
    ? [].map((e) => e as String).toList()
    : [_specialties[_chosenSpecialtiesIndex].toLowerCase().replaceAll(' ', '-')],
  };
  }

  void _loadSpecialties(AuthProvider authProvider) {
    final learnTopics = authProvider.learnTopics.map((e) => e.name ?? 'null');
    final testPreparations = authProvider.testPreparations.map((e) => e.name ?? 'null');
    _specialties = ['All', ...learnTopics, ...testPreparations];
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = context.watch<AuthProvider>();
    _loadSpecialties(authProvider);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text('Find a tutor', style: Theme.of(context).textTheme.headlineMedium),

          const SizedBox(height: 8),

          TextField(
            controller: _nameController,
            decoration: InputDecoration(
              hintStyle: TextStyle(color: Colors.grey[500]),
              hintText: "Search by name",
              border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
          ),

          const SizedBox(height: 16),

          Text('Nationality', style: Theme.of(context).textTheme.headlineMedium),

          const SizedBox(height: 4),

          Row(
            children: [
              Radio<Nationality>(
                value: Nationality.vietnamese,
                groupValue: _nationality,
                onChanged: (value) {
                  setState(() {
                    _nationality = value;
                  });
                },
              ),
              const Text('Vietnamese Tutors'),
            ],
          ),

          Row(
            children: [
              Radio<Nationality>(
                value: Nationality.foreign,
                groupValue: _nationality,
                onChanged: (value) {
                  setState(() {
                    _nationality = value;
                  });
                },
              ),
              const Text('Foreign Tutors'),
            ],
          ),

          const SizedBox(height: 8),

          const SizedBox(height: 16),

          Text('Specialties', style: Theme.of(context).textTheme.headlineMedium),

          const SizedBox(height: 4),

          Wrap(
            spacing: 8,
            runSpacing: -4,
            children: List<Widget>.generate(
              _specialties.length,
                  (index) => ChoiceChip(
                backgroundColor: Colors.grey[100],
                selectedColor: Colors.pink[100],
                selected: _chosenSpecialtiesIndex == index,
                label: Text(
                  _specialties[index],
                  style: TextStyle(
                    fontSize: 14,
                    color: _chosenSpecialtiesIndex == index ? Colors.pink[700] : Colors.black54,
                  ),
                ),
                onSelected: (bool selected) {
                  setState(() {
                    _chosenSpecialtiesIndex = index;
                  });
                },
              ),
            ),
          ),

          const SizedBox(height: 12),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.max,
            children: [

              TextButton(
                onPressed: () {
                  setState(() {
                    _chosenSpecialtiesIndex = 0;
                  });
                },

                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6),
                  child: Text('Reset Filters', style: TextStyle(fontSize: 16)),
                ),
              ),

              const SizedBox(width: 10),

              TextButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    Routes.tutorSearchResult,
                    arguments: _encapsulateSearchParams(authProvider),
                  );
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.pink,
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    'Search',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
