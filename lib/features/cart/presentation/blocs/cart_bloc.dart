import 'package:ploff_kebab/export_files.dart';
import 'package:ploff_kebab/features/home/data/datasources/local/home_local_data_source.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  HomeLocalDataSource homeLocalDataSource;
  CartBloc({
    required this.homeLocalDataSource,
  }) : super(const CartState()) {
    on<GetProductsFromLocalEvent>(_getProductsFromLocal);
  }
  void _getProductsFromLocal(
      GetProductsFromLocalEvent event, Emitter<CartState> emit) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    List<ProductModel> products = await homeLocalDataSource.getProducts();
    emit(state.copyWith(
        products: products, status: FormzSubmissionStatus.success));
  }
}
