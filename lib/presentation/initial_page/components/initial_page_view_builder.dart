import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pro_recruit_app/presentation/initial_page/components/image_builder.dart';
import 'package:pro_recruit_app/presentation/initial_page/cubit/initial_page_cubit.dart';

// this key prevent losing index state after change to portrait mode
final Key _key = GlobalKey();

class InitialPageViewBuilder extends StatefulWidget {
  const InitialPageViewBuilder({
    required this.controller,
    required this.isPortrait,
    super.key,
  });

  final PageController controller;
  final bool isPortrait;

  @override
  State<InitialPageViewBuilder> createState() => _InitialPageViewBuilderState();
}

double currentPageValue = 0.0;

class _InitialPageViewBuilderState extends State<InitialPageViewBuilder> {
  @override
  void initState() {
    widget.controller.addListener(() {
      if (mounted) {
        setState(() {
          currentPageValue = widget.controller.page!;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      key: _key,
      onPageChanged: (int index) =>
          context.read<InitialPageCubit>().changeIndexValue(index),
      controller: widget.controller,
      itemCount: 6,
      itemBuilder: (context, index) {
        final transformValue = Matrix4.identity()
          ..rotateX(currentPageValue - index);
        return Transform(
          transform: transformValue,
          child: ImageBuilder(
            isPortrait: widget.isPortrait,
            index: index,
          ),
        );
      },
    );
  }
}
