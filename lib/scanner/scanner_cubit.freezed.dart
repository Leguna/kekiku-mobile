// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scanner_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ScannerState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ScannerState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ScannerState()';
  }
}

/// @nodoc
class $ScannerStateCopyWith<$Res> {
  $ScannerStateCopyWith(ScannerState _, $Res Function(ScannerState) __);
}

/// @nodoc

class _Initial implements ScannerState {
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
    return 'ScannerState.initial()';
  }
}

/// @nodoc

class DataScannedBarcode implements ScannerState {
  const DataScannedBarcode(final List<Barcode> barcodes) : _barcodes = barcodes;

  final List<Barcode> _barcodes;
  List<Barcode> get barcodes {
    if (_barcodes is EqualUnmodifiableListView) return _barcodes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_barcodes);
  }

  /// Create a copy of ScannerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DataScannedBarcodeCopyWith<DataScannedBarcode> get copyWith =>
      _$DataScannedBarcodeCopyWithImpl<DataScannedBarcode>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DataScannedBarcode &&
            const DeepCollectionEquality().equals(other._barcodes, _barcodes));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_barcodes));

  @override
  String toString() {
    return 'ScannerState.dataScanned(barcodes: $barcodes)';
  }
}

/// @nodoc
abstract mixin class $DataScannedBarcodeCopyWith<$Res>
    implements $ScannerStateCopyWith<$Res> {
  factory $DataScannedBarcodeCopyWith(
          DataScannedBarcode value, $Res Function(DataScannedBarcode) _then) =
      _$DataScannedBarcodeCopyWithImpl;
  @useResult
  $Res call({List<Barcode> barcodes});
}

/// @nodoc
class _$DataScannedBarcodeCopyWithImpl<$Res>
    implements $DataScannedBarcodeCopyWith<$Res> {
  _$DataScannedBarcodeCopyWithImpl(this._self, this._then);

  final DataScannedBarcode _self;
  final $Res Function(DataScannedBarcode) _then;

  /// Create a copy of ScannerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? barcodes = null,
  }) {
    return _then(DataScannedBarcode(
      null == barcodes
          ? _self._barcodes
          : barcodes // ignore: cast_nullable_to_non_nullable
              as List<Barcode>,
    ));
  }
}

/// @nodoc

class _Error implements ScannerState {
  const _Error(this.message);

  final String message;

  /// Create a copy of ScannerState
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
    return 'ScannerState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res>
    implements $ScannerStateCopyWith<$Res> {
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

  /// Create a copy of ScannerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(_Error(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
