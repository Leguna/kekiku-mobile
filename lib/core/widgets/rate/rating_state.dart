part of 'rating_cubit.dart';

@freezed
class RatingState with _$RatingState {
  const factory RatingState.initial() = _Initial;
  const factory RatingState.rating(int rating, int lastRating) = _Rating;
  const factory RatingState.submitting() = _Submitting;
  const factory RatingState.submitted() = _Submitted;
}
