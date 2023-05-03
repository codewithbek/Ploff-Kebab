part of 'home_bloc.dart';

class HomeState extends Equatable {
  final FormzSubmissionStatus status;
  final CategoriesWithProductsEntity categoriesWithProducts;
  final BannerEntity banner;
  final bool isProductAdded;

  const HomeState({
    this.status = FormzSubmissionStatus.initial,
    this.categoriesWithProducts = const CategoriesWithProductsEntity(),
    this.banner = const BannerEntity(),
    this.isProductAdded = false,
  });

  HomeState copyWith(
          {FormzSubmissionStatus? status,
          CategoriesWithProductsEntity? categoriesWithProducts,
          BannerEntity? banner,
          bool? isProductAdded}) =>
      HomeState(
        banner: banner ?? this.banner,
        categoriesWithProducts:
            categoriesWithProducts ?? this.categoriesWithProducts,
        status: status ?? this.status,
        isProductAdded: isProductAdded ?? this.isProductAdded,
      );

  @override
  List<Object> get props => [
        status,
        categoriesWithProducts,
        banner,
        isProductAdded,
      ];
}
