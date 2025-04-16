import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:oktoast/oktoast.dart';

import '../../core/index.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState.initial());

  LocalDatabase localDatabase = getIt<LocalDatabase>();

  final String popupKey = 'popupLastShownDate';
  bool isShowedPopupImage = false;

  Future<void> tryShowPopupImage() async {
    emit(const HomeState.initial());
    final lastShownDate = await localDatabase.getString(popupKey);
    final canShow = lastShownDate == null ||
        DateTime.now().difference(DateTime.parse(lastShownDate)).inDays >= 1;
    if (canShow && !isShowedPopupImage) {
      isShowedPopupImage = true;
      await localDatabase.setString(popupKey, DateTime.now().toIso8601String());
      emit(HomeState.imagePopup(isShowed: isShowedPopupImage));
    }
  }

  void closePopupImage() {
    emit(const HomeState.initial());
    isShowedPopupImage = false;
    emit(HomeState.imagePopup(isShowed: isShowedPopupImage));
  }

  Future<void> refreshHome() async {
    await Future.delayed(const Duration(seconds: 2));
  }

  var lastTimePressed = DateTime.now();

  void tryQuitApp(BuildContext context) {
    final now = DateTime.now();
    if (now.difference(lastTimePressed).inSeconds > 1) {
      showToast("Press back again to exit");
    } else {
      Navigator.of(context).pop();
    }
    lastTimePressed = now;
  }
}
