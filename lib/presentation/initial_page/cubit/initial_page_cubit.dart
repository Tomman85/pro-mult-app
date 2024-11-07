import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'initial_page_state.dart';

part 'initial_page_cubit.freezed.dart';

class InitialPageCubit extends Cubit<InitialPageState> {
  InitialPageCubit() : super(const InitialPageState.initial(index: 0));

  Future<void> changeIndexValue(int index) async => emit(state.copyWith(index: index));
}
