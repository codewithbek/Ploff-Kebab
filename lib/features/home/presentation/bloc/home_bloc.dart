import 'package:ploff_kebab/export_files.dart';
import 'package:ploff_kebab/features/home/domain/entities/product_entity/product_entity.dart';
import 'package:ploff_kebab/features/home/domain/usecases/get_product_by_id_usecase.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetCategoriesWithProductsUseCase getCategoriesWithProductsUseCase;
  final GetBannerUseCase getBanner;
  final GetProductByIdUseCase getProductByIdUseCase;
  HomeBloc({
    required this.getCategoriesWithProductsUseCase,
    required this.getBanner,
    required this.getProductByIdUseCase,
  }) : super(const HomeState()) {
    on<GetCategoriesWithProductsEvent>(_getCategoriesWithProducts);
    on<GetBannerEvent>(_getBanner);
    on<GetProducByIdtEvent>(_getProductById);
  }
  void _getCategoriesWithProducts(
      GetCategoriesWithProductsEvent event, Emitter<HomeState> emit) async {
    final result = await getCategoriesWithProductsUseCase(NoParams());
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    debugPrint("CategoriesWithProducts Loading");

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

  void _getBanner(GetBannerEvent event, Emitter<HomeState> emit) async {
    final result = await getBanner(NoParams());
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    debugPrint("Banner Loading>>");
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

  void _getProductById(
      GetProducByIdtEvent event, Emitter<HomeState> emit) async {
    final result = await getProductByIdUseCase(GetProductByIdParams(
      productId: event.productId,
    ));
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    result.fold(
      (l) {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      },
      (r) {
        emit(
          state.copyWith(productById: r, status: FormzSubmissionStatus.success),
        );
      },
    );
  }
}
