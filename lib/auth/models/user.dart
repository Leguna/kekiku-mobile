import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    required String displayName,
    @Default('local') String authMethod,
    required String email,
    @Default('') String phone,
    @Default('user') String role,
    @Default('') String address,
    @Default('') String id,
    @Default('') String photoUrl,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
