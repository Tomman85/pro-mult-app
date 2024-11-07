import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pro_recruit_app/presentation/initial_page/components/custom_button.dart';
import 'package:pro_recruit_app/presentation/initial_page/cubit/initial_page_cubit.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    required this.pageController,
    super.key,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return BlocListener<InitialPageCubit, InitialPageState>(
      listener: (context, state) {
        if (state.index == -1) {
          context.go('/home');
        }
      },
      child: BlocBuilder<InitialPageCubit, InitialPageState>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (state.index < 5)
                CustomButton(
                  backgroundColor: Colors.transparent,
                  borderColor: Colors.transparent,
                  title: 'Pomiń',
                  textColor: const Color(0xFFb2b2b2),
                  callback: () =>
                      context.read<InitialPageCubit>().changeIndexValue(-1),
                ),
              if (state.index < 5)
                const SizedBox(
                  width: 50,
                ),
              if (state.index < 5)
                CustomButton(
                  title: 'Dalej',
                  callback: () => pageController.animateToPage(
                    state.index + 1,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.linear,
                  ),
                )
              else
                CustomButton(
                  title: 'Zaczynamy',
                  callback: () =>
                      context.read<InitialPageCubit>().changeIndexValue(-1),
                )
            ],
          );
        },
      ),
    );
  }
}
