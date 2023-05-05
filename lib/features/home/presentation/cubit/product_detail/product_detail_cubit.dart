import 'package:ploff_kebab/core/local_source/cached_product.dart';
import 'package:ploff_kebab/export_files.dart';
import 'package:ploff_kebab/features/home/data/models/hive_model/product_hive_model.dart';

part 'product_detail_state.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  ProductDetailCubit({required CachedProducts cachedProducts})
      : _cachedProducts = cachedProducts,
        super(
          const ProductDetailState(productHiveModel: []),
        );
  final CachedProducts _cachedProducts;
  Future<void> addProduct({required ProductModel productModel}) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    try {
      await _cachedProducts.addProduct(productModel: productModel);
      emit(state.copyWith(status: FormzSubmissionStatus.success));
      getCachedProducts();
    } catch (e) {
      debugPrint(e.toString());
      debugPrint(">>>>");
      emit(
        state.copyWith(
          errorText: e.toString(),
          status: FormzSubmissionStatus.failure,
        ),
      );
    }
  }

  void getCachedProducts() async {
    final data = await _cachedProducts.getCachedProducts();
    emit(state.copyWith(productHiveModel: data));
  }

  void deleteAllCachedProducts() async {
    await _cachedProducts.deleteAllCachedProduct();
    emit(state.copyWith(status: FormzSubmissionStatus.success));
    getCachedProducts();
  }

  void deleteCachedProductById(String id) async {
    await _cachedProducts.deleteCachedProductById(id);
    emit(state.copyWith(id: id, status: FormzSubmissionStatus.success));
    getCachedProducts();
  }
}
