import 'package:ploff_kebab/export_files.dart';
import 'package:ploff_kebab/features/home/domain/entities/product_entity/product_entity.dart';
import 'package:ploff_kebab/features/home/domain/usecases/search_product.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetCategoriesWithProductsUseCase getCategoriesWithProductsUseCase;
  final GetBannerUseCase getBanner;
  final SearchProductUseCase searchProduct;
  HomeBloc({
    required this.getCategoriesWithProductsUseCase,
    required this.getBanner,
    required this.searchProduct,
  }) : super(const HomeState()) {
    on<GetCategoriesWithProductsEvent>(_getCategoriesWithProducts);
    on<GetBannerEvent>(_getBanner);
    on<SearchProductEvent>(_searchProduct);
  }
  void _getCategoriesWithProducts(
      GetCategoriesWithProductsEvent event, Emitter<HomeState> emit) async {
    final result = await getCategoriesWithProductsUseCase(NoParams());
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    result.fold(
      (l) {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      },
      (r) {
        emit(
          state.copyWith(
              categoriesWithProducts: r, status: FormzSubmissionStatus.success),
        );
      },
    );
  }

  void _searchProduct(SearchProductEvent event, Emitter<HomeState> emit) async {
    final result = await searchProduct(
      SearchProductParams(
        productId: event.productId,
      ),
    );
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    result.fold((l) {
      emit(state.copyWith(status: FormzSubmissionStatus.failure));
    }, (r) {
      emit(
        state.copyWith(
            searchProduct: r.response ?? [],
            status: FormzSubmissionStatus.success),
      );
    });
  }

  void _getBanner(GetBannerEvent event, Emitter<HomeState> emit) async {
    final result = await getBanner(NoParams());
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    result.fold(
      (l) {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      },
      (r) {
        emit(
          state.copyWith(banner: r, status: FormzSubmissionStatus.success),
        );
      },
    );
  }
}
