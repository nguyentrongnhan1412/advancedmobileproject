import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:lettutor/src/models/course/course_category.dart';
import 'package:lettutor/src/models/book/book.dart';
import 'package:lettutor/src/providers/app_provider.dart';
import 'package:lettutor/src/providers/auth_provider.dart';
import 'package:lettutor/src/services/ebook_service.dart';
import 'package:provider/provider.dart';

class BookView extends StatefulWidget {
  const BookView({Key? key}) : super(key: key);

  @override
  State<BookView> createState() => _BookViewState();
}

class _BookViewState extends State<BookView> {

  List<Book> _results = [];
  final TextEditingController _controller = TextEditingController();
  final listLevels = {
    "0": "Any level",
    "1": "Beginner",
    "2": "High Beginner",
    "3": "Pre-Intermediate",
    "4": "Intermediate",
    "5": "Upper-Intermediate",
    "6": "Advanced",
    "7": "Proficiency"
  };
  Timer? _debounce;
  String category = "";
  String search = "";

  bool isLoading = true;

  bool isLoadMore = false;

  int page = 1;

  int perPage = 10;

  late ScrollController _scrollController;

  String? token;

  List<Widget> _generateChips(List<CourseCategory> categories) {
    return categories.map((chip) => GestureDetector(
            onTap: () {
          if (category == chip.id) {
            setState(() {
              category = "";
              _results = [];
              page = 1;
              isLoading = true;
            });
          }
          else {
            setState(() {
              category = chip.id ?? "";
              _results = [];
              page = 1;
              isLoading = true;}
            );
          }},
            child: Container(
              margin: const EdgeInsets.only(top: 5, right: 8),
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: Text(
                chip.title ?? "",
                style: TextStyle(
                  fontSize: 12,
                  color: chip.id == category ? Colors.pink[400] : Colors.grey[600],
                  fontWeight: FontWeight.w700,),
              ),
              decoration: BoxDecoration(
                color: chip.id == category ? Colors.pink[50] : Colors.grey[200],
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: chip.id == category ? Colors.pink[100] as Color : Colors.grey[400] as Color),
              ),
            ),
          ),
    ).toList();
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(loadMore);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _scrollController.removeListener(loadMore);
    super.dispose();
  }

  void fetchListEbook(int page, int size, String token) async {
    final response = await EbookService.getListEbookWithPagination(page, size, token, categoryId: category, q: search);
    if (mounted) {
      setState(() {
        _results.addAll(response);
        isLoading = false;
      });
    }
  }

  void loadMore() async {
    if (_scrollController.position.extentAfter < page * perPage) {
      setState(() {
        isLoadMore = true;
        page++;
      });

      try {
        List<Book> response = await EbookService.getListEbookWithPagination(page, perPage, token as String,
            categoryId: category, q: search);
        if (mounted) {
          setState(() {
            _results.addAll(response);
            isLoadMore = false;
          });
        }
      }
      catch (e) {
        print("Cannot load more");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final appProvider = Provider.of<AppProvider>(context);
    final lang = appProvider.language;

    setState(() {
      token = authProvider.token!.access?.token;
    });

    if (isLoading) {
      fetchListEbook(1, 10, authProvider.token!.access?.token ?? "");
    }

    return Column(
      children:
      [

        Container(
          margin: const EdgeInsets.only(bottom: 10, top: 10),
          child: TextField(
            style: TextStyle(fontSize: 12, color: Colors.grey[900]),
            controller: _controller,
            onChanged: (value) {
              if (_debounce?.isActive ?? false) _debounce?.cancel();
              _debounce = Timer(const Duration(milliseconds: 500), () {
                setState(() {
                  search = value;
                  _results = [];
                  page = 1;
                  isLoading = true;
                });
              });
            },

            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(right: 24),
              hintStyle: TextStyle(color: Colors.grey[400]),
              hintText: 'Search book(s)',
              prefixIcon: const Icon(Icons.search),
              border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            )
          ),
        ),

        isLoading ? const Center(
          child: CircularProgressIndicator(),
        ) : Expanded(
          child: _results.isEmpty ? SizedBox(height: MediaQuery.of(context).size.height * 0.5,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "asset/svg/ic_notfound.svg",
                    width: 200,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: Text(
                      "No match(es) found",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ),
                ],
              ),
            ),
          ) : ListView.builder(
            itemCount: _results.length,
            controller: _scrollController,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: GestureDetector(
                  onTap: () async {
                    if (await canLaunchUrl(Uri.parse(_results[index].fileUrl))) {
                      await launchUrl(Uri.parse(_results[index].fileUrl));
                    }
                  },

                  child: Card(
                    elevation: 8,
                    child: SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:
                        [

                          CachedNetworkImage(
                            imageUrl: _results[index].imageUrl,
                            fit: BoxFit.cover,
                            progressIndicatorBuilder: (context, url, downloadProgress) =>
                                CircularProgressIndicator(value: downloadProgress.progress),
                            errorWidget: (context, url, error) => const Icon(Icons.error),
                          ),

                          Container(
                            padding: const EdgeInsets.fromLTRB(10, 10, 10, 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:
                              [

                                Text(
                                  _results[index].name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                                ),

                                Container(
                                  margin: const EdgeInsets.only(top: 8, bottom: 15),
                                  child: Text(
                                    _results[index].description,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(fontSize: 12, color: Colors.grey[800]),
                                  ),
                                ),

                                Text(
                                  listLevels[_results[index].level] ?? "Any level",
                                  style: TextStyle(fontSize: 15, color: Colors.grey[800]),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        if (isLoadMore)
          const SizedBox(
            height: 50,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
      ],
    );
  }
}