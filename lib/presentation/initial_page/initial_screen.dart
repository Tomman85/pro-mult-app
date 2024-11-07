import 'package:flutter/material.dart';
import 'package:pro_recruit_app/presentation/initial_page/components/bottom_navigation.dart';
import 'package:pro_recruit_app/presentation/initial_page/components/initial_page_view_builder.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  late final PageController _pageViewController;

  @override
  void initState() {
    _pageViewController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    return Scaffold(
      backgroundColor: const Color(0xFF4A6EA3),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (!isPortrait)
              const SizedBox(
                height: 25,
              ),
            Flexible(
              child: InitialPageViewBuilder(
                isPortrait: isPortrait,
                controller: _pageViewController,
              ),
            ),
            if (isPortrait)
              const SizedBox(
                height: 75,
              )
            else
              const SizedBox(
                height: 10,
              ),
            BottomNavigation(
              pageController: _pageViewController,
            ),
            if (isPortrait)
              const SizedBox(
                height: 50,
              ),
          ],
        ),
      ),
    );
  }
}
