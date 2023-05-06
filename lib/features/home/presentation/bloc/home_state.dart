part of 'home_bloc.dart';

class HomeState extends Equatable {
  final FormzSubmissionStatus status;
  final CategoriesWithProductsEntity categoriesWithProducts;
  final BannerEntity banner;
  final ProductEntity productById;
  const HomeState({
    this.status = FormzSubmissionStatus.initial,
    this.categoriesWithProducts = const CategoriesWithProductsEntity(),
    this.banner = const BannerEntity(),
    this.productById = const ProductEntity() ,
  });

  HomeState copyWith({
    FormzSubmissionStatus? status,
    CategoriesWithProductsEntity? categoriesWithProducts,
    BannerEntity? banner,
    ProductEntity? productById,
  }) =>
      HomeState(
        banner: banner ?? this.banner,
        categoriesWithProducts:
            categoriesWithProducts ?? this.categoriesWithProducts,
        status: status ?? this.status,
        productById: productById ?? this.productById,
      );

  @override
  List<Object> get props => [
        status,
        categoriesWithProducts,
        banner,
        productById,
      ];
}
