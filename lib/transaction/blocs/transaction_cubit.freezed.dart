// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TransactionState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TransactionState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TransactionState()';
  }
}

/// @nodoc
class $TransactionStateCopyWith<$Res> {
  $TransactionStateCopyWith(
      TransactionState _, $Res Function(TransactionState) __);
}

/// @nodoc

class _Initial implements TransactionState {
  const _Initial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TransactionState.initial()';
  }
}

/// @nodoc

class TransactionLoading implements TransactionState {
  const TransactionLoading({this.transactionId = ""});

  @JsonKey()
  final String transactionId;

  /// Create a copy of TransactionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TransactionLoadingCopyWith<TransactionLoading> get copyWith =>
      _$TransactionLoadingCopyWithImpl<TransactionLoading>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TransactionLoading &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, transactionId);

  @override
  String toString() {
    return 'TransactionState.loading(transactionId: $transactionId)';
  }
}

/// @nodoc
abstract mixin class $TransactionLoadingCopyWith<$Res>
    implements $TransactionStateCopyWith<$Res> {
  factory $TransactionLoadingCopyWith(
          TransactionLoading value, $Res Function(TransactionLoading) _then) =
      _$TransactionLoadingCopyWithImpl;
  @useResult
  $Res call({String transactionId});
}

/// @nodoc
class _$TransactionLoadingCopyWithImpl<$Res>
    implements $TransactionLoadingCopyWith<$Res> {
  _$TransactionLoadingCopyWithImpl(this._self, this._then);

  final TransactionLoading _self;
  final $Res Function(TransactionLoading) _then;

  /// Create a copy of TransactionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? transactionId = null,
  }) {
    return _then(TransactionLoading(
      transactionId: null == transactionId
          ? _self.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _Updated implements TransactionState {
  const _Updated();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Updated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TransactionState.updated()';
  }
}

/// @nodoc

class _Loaded implements TransactionState {
  const _Loaded(final List<Transaction> transactions)
      : _transactions = transactions;

  final List<Transaction> _transactions;
  List<Transaction> get transactions {
    if (_transactions is EqualUnmodifiableListView) return _transactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactions);
  }

  /// Create a copy of TransactionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoadedCopyWith<_Loaded> get copyWith =>
      __$LoadedCopyWithImpl<_Loaded>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Loaded &&
            const DeepCollectionEquality()
                .equals(other._transactions, _transactions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_transactions));

  @override
  String toString() {
    return 'TransactionState.loaded(transactions: $transactions)';
  }
}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res>
    implements $TransactionStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) =
      __$LoadedCopyWithImpl;
  @useResult
  $Res call({List<Transaction> transactions});
}

/// @nodoc
class __$LoadedCopyWithImpl<$Res> implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

  /// Create a copy of TransactionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? transactions = null,
  }) {
    return _then(_Loaded(
      null == transactions
          ? _self._transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<Transaction>,
    ));
  }
}

/// @nodoc

class _Error implements TransactionState {
  const _Error({required this.message});

  final String message;

  /// Create a copy of TransactionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Error &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'TransactionState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res>
    implements $TransactionStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) =
      __$ErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

  /// Create a copy of TransactionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(_Error(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class BuyAgainSuccess implements TransactionState {
  const BuyAgainSuccess();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is BuyAgainSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TransactionState.buyAgainSuccess()';
  }
}

/// @nodoc

class FinishSuccess implements TransactionState {
  const FinishSuccess({this.transactionId = ""});

  @JsonKey()
  final String transactionId;

  /// Create a copy of TransactionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FinishSuccessCopyWith<FinishSuccess> get copyWith =>
      _$FinishSuccessCopyWithImpl<FinishSuccess>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FinishSuccess &&
            (identical(other.transactionId, transactionId) ||
                other.transactionId == transactionId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, transactionId);

  @override
  String toString() {
    return 'TransactionState.finishSuccess(transactionId: $transactionId)';
  }
}

/// @nodoc
abstract mixin class $FinishSuccessCopyWith<$Res>
    implements $TransactionStateCopyWith<$Res> {
  factory $FinishSuccessCopyWith(
          FinishSuccess value, $Res Function(FinishSuccess) _then) =
      _$FinishSuccessCopyWithImpl;
  @useResult
  $Res call({String transactionId});
}

/// @nodoc
class _$FinishSuccessCopyWithImpl<$Res>
    implements $FinishSuccessCopyWith<$Res> {
  _$FinishSuccessCopyWithImpl(this._self, this._then);

  final FinishSuccess _self;
  final $Res Function(FinishSuccess) _then;

  /// Create a copy of TransactionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? transactionId = null,
  }) {
    return _then(FinishSuccess(
      transactionId: null == transactionId
          ? _self.transactionId
          : transactionId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
