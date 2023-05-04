import 'package:ploff_kebab/export_files.dart';


part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetCategoriesWithProductsUseCase getCategoriesWithProductsUseCase;
  final GetBannerUseCase getBanner;
  HomeBloc({
    required this.getCategoriesWithProductsUseCase,
    required this.getBanner,
  }) : super(const HomeState()) {
    on<GetCategoriesWithProductsEvent>(_getCategoriesWithProducts);
    on<GetBannerEvent>(_getBanner);
    on<AddProductEvent>(_addProduct);
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

  void _addProduct(AddProductEvent event, Emitter<HomeState> emit) async {
    // var response = await homeLocalDataSource.addProducts(event.product);
    // emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    // if (response == true) {
    //   emit(state.copyWith(
    //       isProductAdded: response, status: FormzSubmissionStatus.success));
    // } else {
    //   emit(state.copyWith(
    //       status: FormzSubmissionStatus.failure, isProductAdded: response));
    // }
  }
}
