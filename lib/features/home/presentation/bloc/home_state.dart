part of 'home_bloc.dart';

class HomeState extends Equatable {
  final FormzSubmissionStatus status;
  final CategoriesWithProductsEntity categoriesWithProducts;
  final BannerEntity banner;
  const HomeState({
    this.status = FormzSubmissionStatus.initial,
    this.categoriesWithProducts = const CategoriesWithProductsEntity(),
    this.banner = const BannerEntity(),
  });

  HomeState copyWith(
          {FormzSubmissionStatus? status,
          CategoriesWithProductsEntity? categoriesWithProducts,
          BannerEntity? banner,
         }) =>
      HomeState(
        banner: banner ?? this.banner,
        categoriesWithProducts:
            categoriesWithProducts ?? this.categoriesWithProducts,
        status: status ?? this.status,
      );

  @override
  List<Object> get props => [
        status,
        categoriesWithProducts,
        banner,
      ];
}
