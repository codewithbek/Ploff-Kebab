import 'package:ploff_kebab/export_files.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState()) {
    on<GetProductsFromLocalEvent>(_getProductsFromLocal);
  }
  void _getProductsFromLocal(
      GetProductsFromLocalEvent event, Emitter<CartState> emit) async {
    // emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    // List<ProductModel> products = await homeLocalDataSource.getProducts();
    // emit(state.copyWith(
    //     products: products, status: FormzSubmissionStatus.success));
  }
}
