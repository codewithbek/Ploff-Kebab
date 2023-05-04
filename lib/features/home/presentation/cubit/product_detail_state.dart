part of 'product_detail_cubit.dart';

class ProductDetailState extends Equatable {
  const ProductDetailState({
    required this.productHiveModel,
    this.status = FormzSubmissionStatus.initial,
    this.errorText = '',
  });
  final List<ProductHiveModel>? productHiveModel;
  final FormzSubmissionStatus status;
  final String errorText;

  ProductDetailState copyWith({
    FormzSubmissionStatus? status,
    List<ProductHiveModel>? productHiveModel,
    String? errorText,
  }) =>
      ProductDetailState(
        productHiveModel: productHiveModel ?? this.productHiveModel,
        status: status ?? this.status,
        errorText: errorText ?? this.errorText,
      );

  @override
  List<Object?> get props => [
        productHiveModel,
        status,
        errorText,
      ];
}
