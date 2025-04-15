import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/index.dart';

part 'cart_cubit.freezed.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState.initial());
}
