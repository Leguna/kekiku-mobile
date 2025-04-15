part of 'rating_cubit.dart';

@freezed
class RatingState with _$RatingState {
  const factory RatingState.initial() = _Initial;

  const factory RatingState.rating(int rating, int lastRating) = Rating;

  const factory RatingState.submitting() = Submitting;

  const factory RatingState.submitted() = Submitted;
}
