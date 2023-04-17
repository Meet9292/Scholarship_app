import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scholarship_app/india.dart';
import 'package:scholarship_app/main.dart';


class CountryPages extends StatelessWidget {
  const CountryPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: Colors.indigo,
      ),
      body: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>const india_sc()),
          );
        },
        child: OnboardingPagePresenter(pages: [
          OnboardingPageModel(
            title: 'India',
            description: '5 scholarships available',
            imageUrl: 'https://cdn-icons-png.flaticon.com/512/3336/3336203.png',
            bgColor: Colors.indigo,
          ),
          OnboardingPageModel(
            title: 'Canada',
            description: '3 scholarships available',
            imageUrl: 'https://cdn-icons-png.flaticon.com/512/4486/4486271.png',
            bgColor: const Color(0xff1eb090),
          ),
          OnboardingPageModel(
            title: 'UK',
            description: '4 scholarships available',
            imageUrl: 'https://cdn-icons-png.flaticon.com/512/3479/3479971.png',
            bgColor: const Color(0xfffeae4f),
          ),
        ]),
      ),
    );
  }
}

class OnboardingPagePresenter extends StatefulWidget {
  final List<OnboardingPageModel> pages;
  final VoidCallback? onSkip;
  final VoidCallback? onFinish;

  const OnboardingPagePresenter(
      {Key? key, required this.pages, this.onSkip, this.onFinish})
      : super(key: key);

  @override
  State<OnboardingPagePresenter> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPagePresenter> {
  // Store the currently visible page
  int _currentPage = 0;
  // Define a controller for the pageview
  final PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        color: widget.pages[_currentPage].bgColor,
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                // Pageview to render each page
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: widget.pages.length,
                  onPageChanged: (idx) {
                    // Change current page when pageview changes
                    setState(() {
                      _currentPage = idx;
                    });
                  },
                  itemBuilder: (context, idx) {
                    final item = widget.pages[idx];
                    return Column(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(32.0),
                            child: Image.network(
                              item.imageUrl,
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: Column(children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(item.title,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: item.textColor,
                                        )),
                              ),
                              Container(
                                constraints:
                                    const BoxConstraints(maxWidth: 280),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24.0, vertical: 8.0),
                                child: Text(item.description,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        ?.copyWith(
                                          color: item.textColor,
                                        )),
                              )
                            ]))
                      ],
                    );
                  },
                ),
              ),

              // Current page indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.pages
                    .map((item) => AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          width: _currentPage == widget.pages.indexOf(item)
                              ? 30
                              : 8,
                          height: 8,
                          margin: const EdgeInsets.all(2.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0)),
                        ))
                    .toList(),
              ),

              // Bottom buttons
              SizedBox(
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // children: const [
                  // TextButton(
                  //     style: TextButton.styleFrom(
                  //         visualDensity: VisualDensity.comfortable,
                  //         foregroundColor: Colors.white,
                  //         textStyle: const TextStyle(
                  //             fontSize: 16, fontWeight: FontWeight.bold)),
                  //     onPressed: () {
                  //       widget.onSkip?.call();
                  //     },
                  //     child: const Text("Back")),
                  // TextButton(
                  //   style: TextButton.styleFrom(
                  //       visualDensity: VisualDensity.comfortable,
                  //       foregroundColor: Colors.white,
                  //       textStyle: const TextStyle(
                  //           fontSize: 16, fontWeight: FontWeight.bold)),
                  //   onPressed: () {
                  //     if (_currentPage == widget.pages.length - 1) {
                  //       widget.onFinish?.call();
                  //     } else {
                  //       _pageController.animateToPage(_currentPage + 1,
                  //           curve: Curves.easeInOutCubic,
                  //           duration: const Duration(milliseconds: 250));
                  //     }
                  //   },
                  //   child: Row(
                  //     children: [
                  //       Text(
                  //         _currentPage == widget.pages.length - 1
                  //             ? ""
                  //             : "Next",
                  //       ),
                  //       const SizedBox(width: 8),
                  //       Icon(_currentPage == widget.pages.length - 1
                  //           ? Icons.done
                  //           : Icons.arrow_forward),
                  //     ],
                  //   ),
                  // ),
                  // ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class OnboardingPageModel {
  final String title;
  final String description;
  final String imageUrl;
  final Color bgColor;
  final Color textColor;

  OnboardingPageModel(
      {required this.title,
      required this.description,
      required this.imageUrl,
      this.bgColor = Colors.blue,
      this.textColor = Colors.white});
}
