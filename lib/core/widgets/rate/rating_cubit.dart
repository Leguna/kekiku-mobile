import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../index.dart';

part 'rating_cubit.freezed.dart';
part 'rating_state.dart';

class RatingCubit extends Cubit<RatingState> {
  RatingCubit() : super(const RatingState.initial());

  int lastRating = 0;
  int currentRating = 0;

  bool get canSubmit => currentRating > 0;

  bool get canRating => state.maybeWhen(
        orElse: () => true,
        submitting: () => false,
        submitted: () => false,
      );

  void setRating(int rating) {
    currentRating = rating;
    emit(RatingState.rating(currentRating, lastRating));
    lastRating = rating;
  }

  void resetRating() {
    emit(const RatingState.initial());
  }

  Future<void> submitRating() async {
    emit(const RatingState.submitting());
    await Future.delayed(const Duration(seconds: 1));
    emit(const RatingState.submitted());
  }

  Future<void> openAppLink(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  String getRatingText() {
    if (currentRating == 0) {
      return '';
    }
    return Strings.rate[currentRating-1];
  }
}
