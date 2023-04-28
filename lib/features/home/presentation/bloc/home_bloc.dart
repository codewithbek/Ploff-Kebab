
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
    on<GetCategoriesWithProductsEvent>((event, emit) async {
      final result = await getCategoriesWithProductsUseCase(NoParams());
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      result.fold(
        (l) {
          emit(state.copyWith(status: FormzSubmissionStatus.failure));
        },
        (r) {
          emit(
            state.copyWith(categoriesWithProducts: r, status: FormzSubmissionStatus.success),
          );
        },
      );
    });
    on<GetBannerEvent>((event, emit) async {
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
    });
  }
}
