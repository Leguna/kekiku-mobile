import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/index.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState.initial());
}
