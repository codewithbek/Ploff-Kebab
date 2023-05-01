part of 'home_bloc.dart';

class HomeState extends Equatable {
  final FormzSubmissionStatus status;
  final CategoriesWithProductsEntity categoriesWithProducts;
  final BannerEntity banner;
  final List<ProductEntity> searchProduct;

  const HomeState({
    this.status = FormzSubmissionStatus.initial,
    this.categoriesWithProducts = const CategoriesWithProductsEntity(),
    this.banner = const BannerEntity(),
    this.searchProduct =  const [],
  });

  HomeState copyWith(
          {FormzSubmissionStatus? status,
          CategoriesWithProductsEntity? categoriesWithProducts,
          BannerEntity? banner,
          List<ProductEntity>? searchProduct}) =>
      HomeState(
        banner: banner ?? this.banner,
        categoriesWithProducts:
            categoriesWithProducts ?? this.categoriesWithProducts,
        status: status ?? this.status,
        searchProduct: searchProduct ?? this.searchProduct,
      );

  @override
  List<Object> get props => [
        status,
        categoriesWithProducts,
        banner,
        searchProduct,
      ];
}
